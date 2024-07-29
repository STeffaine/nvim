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
        icons_enabled = false,
        component_separators = "<",
        section_separators = "",
      },
    },
  },
}
