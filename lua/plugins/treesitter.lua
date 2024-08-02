return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      local config = require("nvim-treesitter.configs")
      config.setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "lua",
          "javascript",
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
