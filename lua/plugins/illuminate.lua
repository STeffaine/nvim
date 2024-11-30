return {
  "RRethy/vim-illuminate",
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

      should_enable = function(bufnr)
        return true
      end,
    })
  end,
}
