return {
  "RRethy/vim-illuminate",
  lazy = true,
  event = "VeryLazy",
  config = function()
    require("illuminate").configure({
      providers = {
        "lsp",
        "treesitter",
        "regex",
      },
      delay = 20,
      filetype_overrides = {},
      filetype_denylist = {},
      under_curor = true,
      min_count_to_highlight = 1,
      case_insensitive_regex = true,
      large_file_cutoff = 1000,

      should_enable = function(bufnr)
        return true
      end,

      case_insensitive_regex = false,
    })
  end,
}
