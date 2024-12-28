return {
  {
    "williamboman/mason.nvim",
    event = "VeryLazy",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "bashls",
          "ansiblels",
          "lua_ls",
          "ts_ls",
          "gopls",
          "docker_compose_language_service",
          "dockerls",
          "tailwindcss",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspRestart" },
    config = function()
      -- local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local capabilities = {}
      local lspconfig = require("lspconfig")

      lspconfig.bashls.setup({
        capabilities = capabilities,
        cmd = { "bash-language-server", "start" },
        filetypes = { "sh", "zsh" },
      })

      lspconfig.gopls.setup({
        capabilities = capabilities,
        cmd = { "gopls" },
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        root_dir = lspconfig.util.root_pattern("go.work", "go.mod", ".git"),
        settings = {
          gofumpt = true,
          completeUnimported = true,
          usePlaceholders = true,
          analyses = {
            unusedparams = true,
          },
        },
      })

      lspconfig.ansiblels.setup({
        on_attach = function(client, bufnr)
          -- Check if the working directory is named "ansible"
          local cwd = vim.fn.getcwd()
          if not cwd:match("/ansible$") then
            client.stop() -- Stop the LSP client if not in an "ansible" directory
          end
        end,
        filetypes = { "yaml", "yml" },
      })

      lspconfig.dockerls.setup({
        filetypes = { "dockerfile" },
        capabilities = capabilities,
      })

      lspconfig.docker_compose_language_service.setup({
        filetypes = { "dockercompose" },
        capabilities = capabilities,
      })

      lspconfig.tailwindcss.setup({
        filetypes = { "css", "scss", "less", "html", "yaml", "markdown", "graphql" },
        capabilities = capabilities,
      })

      lspconfig.lua_ls.setup({
        filetypes = { "lua" },
        capabilities = capabilities,
      })
      lspconfig.ts_ls.setup({
        filetypes = { "typescript", "typescriptreact" },
        capabilities = capabilities,
      })
    end,
  },
  -- linting stuffs
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup({
        sources = {

          formatting.shfmt.with({
            filetypes = {
              "sh",
            },
            extra_args = {
              "--indent-size",
              "2",
            },
          }),

          formatting.prettier.with({
            filetypes = {
              "css",
              "scss",
              "less",
              "html",
              "yaml",
              "markdown",
              "graphql",
              "lua",
              "go",
            },
            extra_args = {
              "--print-width",
              "120",
              "--tab-width",
              "2",
              "--use-tabs",
              "false",
              "--single-quote",
              "false",
            },
          }),

          require("none-ls.diagnostics.eslint_d"),
          require("none-ls.formatting.eslint_d"),
          -- stylua
          formatting.stylua.with({
            extra_args = {
              "--indent-type",
              "Spaces", -- Set indentation to spaces
              "--indent-width",
              "2", -- Set 2 spaces for indentation
            },
          }),
        },
      })
    end,
  },
}
