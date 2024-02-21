return {
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
      indent = { char = "|" },
      whitespace = { highlight = { "Whitespace", "NonText" } },
    },
    config = function(_, opts)
      -- require("indent_blankline").setup(opts)
      require("ibl").setup(opts)
    end,
  },
}
