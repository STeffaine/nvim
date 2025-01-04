return {
  {
    "prichrd/netrw.nvim",
    event = "BufRead",
    lazy = true,
    opts = {},
    dependencies = {
      "kyazdani42/nvim-web-devicons",
    },
    config = function()
      require("netrw").setup({
        use_devicons = true,
      })
    end,
  },
}
