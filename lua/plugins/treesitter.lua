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
          "javascript",
          "vim",
          "markdown",
          "go",
          "python",
          "typescript",
          "dockerfile",
          "yaml",
          "html",
          "bash",
          "json",
          "nginx",
          "regex",
          "sql",
        },
      })
    end,
  },
  {
    "windwp/nvim-ts-autotag",
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
