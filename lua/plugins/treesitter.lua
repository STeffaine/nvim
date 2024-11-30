return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        additional_vim_regex_highlighting = false,
        auto_install = true,
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "lua",
          "luadoc",
          "vim",
          "vimdoc",
          "javascript",
          "markdown",
          "go",
          "python",
          "typescript",
          "dockerfile",
          "yaml",
          "html",
          "bash",
          "nginx",
          "regex",
          "sql",
          "json",
          "sql",
          "nginx",
          "csv",
          "toml",
          "git_config",
          "helm",
          "http",
          "jq",
          "regex",
          "rust",
          "terraform",
          "zig",
          "markdown_inline",
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    event = "BufReadPre",
    config = function()
      local config = require("nvim-ts-autotag")
      config.setup({
        opts = {
          enable_close = true,
          enable_rename = true,
          enable_close_on_slash = true,
        },
      })
    end,
  },
}
