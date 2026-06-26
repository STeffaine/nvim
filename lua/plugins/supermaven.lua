return {
  "supermaven-inc/supermaven-nvim",
  event = "BufRead",
  config = function()
    require("supermaven-nvim").setup({
      keymaps = {
        accept_suggestion = "<Tab>",
        clear_suggestion = "<C-[>",
        accept_word = "<C-h>",
      },
    })
  end,
}
