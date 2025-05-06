return {
  "folke/zen-mode.nvim",
  lazy = false,
  opts = {
    window = { width = 160 },
  },
  config = function(_, opts)
    require("zen-mode").setup(opts)
    vim.keymap.set("n", "<leader>o", ":ZenMode<cr>", { noremap = true, silent = true })
  end,
}
