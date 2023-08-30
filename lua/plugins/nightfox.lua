return {
  {
    "EdenEast/nightfox.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      options = {
        styles = {
          comments = 'italic',
        },
      },
    },
    config = function(_, opts)
      -- load the colorscheme here
      require("nightfox").setup(opts)

      vim.cmd([[colorscheme duskfox]])
    end,
  },
}
