return {
  {
    "catppuccin/nvim",
    name = "catppuccin-macchiato",
    event = "BufReadPre",
    config = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = {
      options = {
        icons_enabled = true,
        component_separators = "<",
        section_separators = "",
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
      },
    },
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
  },
}
