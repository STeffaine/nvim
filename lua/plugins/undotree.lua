return {
  {
    "mbbill/undotree",
    lazy = true,
    init = function()
      vim.g.undotree_WindowLayout = 4
      vim.g.undotree_SetFocusWhenToggle = 1
    end,
    keys = {
      {
        "<leader>u",
        function()
          vim.cmd.UndotreeToggle()
        end,
        desc = "Show nvim undotree",
      },
    },
  },
}
