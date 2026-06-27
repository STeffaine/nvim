return {
  {
    "mason-org/mason.nvim",
    lazy = false,
    config = function()
      require("mason").setup()

      local function get_lsp_tool_names()
        local lsp_dir = vim.fn.stdpath("config") .. "/lsp"
        local tools = {}

        if vim.fn.isdirectory(lsp_dir) == 0 then
          return tools
        end

        for _, file in ipairs(vim.fn.readdir(lsp_dir)) do
          if file:match("%.lua$") and file ~= "init.lua" then
            local tool_name = file:gsub("%.lua$", "")
            table.insert(tools, tool_name)
          end
        end

        return tools
      end

      vim.api.nvim_create_user_command("MasonInstall", function()
        local ok, registry = pcall(require, "mason-registry")
        if not ok then
          vim.notify("mason-registry is not available", vim.log.levels.ERROR)
          return
        end

        local mason_mappings = require("config.mason_mappings")

        local lspconfig_to_package = mason_mappings.get_lspconfig_to_package_map(registry)

        local tools = get_lsp_tool_names()
        if #tools == 0 then
          vim.notify("No tool files found in lsp directory", vim.log.levels.WARN)
          return
        end

        local installed = {}
        local queued = {}
        local missing = {}

        for _, tool in ipairs(tools) do
          local package_name = lspconfig_to_package[tool] or tool

          if registry.has_package(package_name) then
            local pkg = registry.get_package(package_name)
            local label = package_name == tool and tool or (tool .. " -> " .. package_name)

            if pkg:is_installed() then
              table.insert(installed, label)
            else
              pkg:install()
              table.insert(queued, label)
            end
          else
            table.insert(missing, tool)
          end
        end

        if #installed > 0 then
          vim.notify("Already installed: " .. table.concat(installed, ", "), vim.log.levels.INFO)
        end

        if #queued > 0 then
          vim.notify("Installing via Mason: " .. table.concat(queued, ", "), vim.log.levels.INFO)
        end

        if #missing > 0 then
          vim.notify("Not found in Mason registry: " .. table.concat(missing, ", "), vim.log.levels.WARN)
        end
      end, {
        desc = "Install Mason tools from lsp/*.lua filenames",
      })
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
