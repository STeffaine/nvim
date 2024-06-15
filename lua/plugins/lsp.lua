return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "tsserver",
          "docker_compose_language_service",
          "dockerls",
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local lspconfig = require("lspconfig")

      lspconfig.lua_ls.setup({
        capabilities = capabilities,
      })
      lspconfig.tsserver.setup({
        capabilities = capabilities,
      })
      --      lspconfig.dockerls.setup({})
      --      lspconfig.docker_compose_language_service.setup({})
    end,
  },
  -- linting stuffs
  {
    "nvimtools/none-ls.nvim",
    dependencies = {
      "nvimtools/none-ls-extras.nvim"
    },
    config = function()
      local null_ls = require("null-ls")

      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup({
        sources = {
          formatting.prettier.with({
            -- extra_args = { "--single-quote", "--print-width 120" },
            filetypes = {
              "css",
              "scss",
              "less",
              "html",
              "json",
              "yaml",
              "markdown",
              "graphql",
            },
          }),
          require("none-ls.diagnostics.eslint_d"),
          require("none-ls.formatting.eslint_d"),
          formatting.stylua,
        },
      })
    end,
  },
}
