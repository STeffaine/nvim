return {
  {
    "catppuccin/nvim",
    name = "catppuccin-macchiato",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
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
      "arkav/lualine-lsp-progress",
    },
  },
}
