return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true, additional_vim_regex_highlighting = true, use_languagetree = true },
      ensure_installed = {
        "bash",
        "css",
        "gitcommit",
        "gitignore",
        "vimdoc",
        "regex",
        "html",
        "javascript",
        "json",
        "lua",
        "markdown",
        "scss",
        "solidity",
        "vim",
      },
    },
		config = function(_, opts)
			require("nvim-treesitter.configs").setup(opts)
		end,
  }
}
