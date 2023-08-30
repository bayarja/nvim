return {
  {
    "lukas-reineke/indent-blankline.nvim",
    opts = {
      show_end_of_line = true,
      space_char_blankline = " ",
    },
    config = function(_, opts)
      require("indent_blankline").setup(opts)
    end,
  },
}
