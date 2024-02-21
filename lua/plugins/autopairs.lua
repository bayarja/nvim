return {
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "vim" },
				enable_check_bracket_line = false,
				check_ts = true,
				ts_config = {
					lua = { "string" }, -- it will not add a pair on that treesitter node
					javascript = { "template_string" },
					java = false, -- don't check treesitter on java
				},
				break_line_filetype = nil, -- enable this rule for all filetypes
				pairs_map = {
					["'"] = "'",
					['"'] = '"',
					["("] = ")",
					["["] = "]",
					["{"] = "}",
					["`"] = "`",
				},
				html_break_line_filetype = {
					"html",
					"vue",
					"typescriptreact",
					"svelte",
					"javascriptreact",
				},
				ignored_next_char = "[%w%.%+%-%=%/%,]",
			})
			local cmp_autopairs = require("nvim-autopairs.completion.cmp")
			local cmp = require("cmp")
			cmp.event:on(
				"confirm_done",
				cmp_autopairs.on_confirm_done({
					map_complete = true, -- it will auto insert `(` (map_char) after select function or method item
					auto_select = true, -- automatically select the first item
					insert = false, -- use insert confirm behavior instead of replace
					map_char = {
						-- modifies the function or method delimiter by filetypes
						all = "(",
						tex = "{",
					},
				})
			)
		end,
	},
}
