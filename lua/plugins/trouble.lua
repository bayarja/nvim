return {
 "folke/trouble.nvim",
 dependencies = { "nvim-tree/nvim-web-devicons" },
 opts = {
   indent_lines = false,
   padding = 1,
   auto_close = true,
 },
 config = function(_, opts)
   require("trouble").setup(opts)
   vim.keymap.set("n", "<F2>", ":TodoTrouble<cr>")
   vim.keymap.set("n", "<F3>", ":TroubleToggle workspace_diagnostics<cr>")
 end,
}
