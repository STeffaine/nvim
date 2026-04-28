return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()
    end,
  },
  -- {
  --   "mason-org/mason-lspconfig.nvim",
  --   event = { "BufReadPost", "BufNewFile" },
  --   config = function()
  --     require("mason-lspconfig").setup({
  --       ensure_installed = {
  --         "bashls",
  --         "ansiblels",
  --         "lua_ls",
  --         "ts_ls",
  --         "gopls",
  --         "docker_compose_language_service",
  --         "dockerls",
  --         "tailwindcss",
  --       },
  --     })
  --   end,
  -- },

  -- linting stuffs
  {
    "nvimtools/none-ls.nvim",
    lazy = false,
    dependencies = {
      "nvimtools/none-ls-extras.nvim",
    },
    config = function()
      local null_ls = require("null-ls")

      local formatting = null_ls.builtins.formatting
      local diagnostics = null_ls.builtins.diagnostics

      null_ls.setup({
        sources = {

          formatting.nixpkgs_fmt.with({
            filetypes = {
              "nix",
            },
          }),
          formatting.nixfmt.with({
            filetypes = {
              "nix",
            },
          }),

          formatting.shfmt.with({
            filetypes = {
              "sh",
            },
            extra_args = {
              "--indent-size",
              "2",
            },
          }),

          formatting.gofumpt.with({
            filetypes = {
              "go",
              "gomod",
              "gowork",
              "gotmpl",
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
