return {
	"williamboman/mason.nvim", -- mason.nvim plugin (LSP сервер, форматлагч суулгагч)
	dependencies = { -- Хамааралтай plugin-ууд
		"williamboman/mason-lspconfig.nvim", -- LSP серверүүдийг mason-аар удирдах
		"WhoIsSethDaniel/mason-tool-installer.nvim", -- Форматлагч, линтер зэргийг mason-аар суулгах
		"stevearc/conform.nvim", -- Форматлагчдад зориулсан plugin
	},
	config = function() -- Plugin-ийн тохиргооны функц
		-- mason модулийг дуудах
		local mason = require("mason") -- mason-г ашиглахын тулд дуудах

		-- mason-lspconfig модулийг дуудах
		local mason_lspconfig = require("mason-lspconfig") -- mason-lspconfig-г ашиглахын тулд дуудах

		-- mason-tool-installer модулийг дуудах
		local mason_tool_installer = require("mason-tool-installer") -- mason-tool-installer-г ашиглахын тулд дуудах

		-- mason-ийн тохиргоо
		mason.setup({ -- mason-ийн тохиргооны функцыг дуудах
			ui = { -- Хэрэглэгчийн интерфэйсийн тохиргоо
				icons = { -- Төлөвийн тэмдэгтийн тохиргоо
					package_installed = "✓", -- Суулгагдсан бол "✓" тэмдэг
					package_pending = "➜", -- Суулгаж байна бол "➜" тэмдэг
					package_uninstalled = "✗", -- Суулгагдаагүй бол "✗" тэмдэг
				},
			},
		})

		-- mason-lspconfig-ийн тохиргоо
		mason_lspconfig.setup({ -- mason-lspconfig-ийн тохиргооны функцыг дуудах
			ensure_installed = { -- mason-аар суулгах LSP серверүүдийн жагсаалт
				"html", -- HTML-д зориулсан LSP сервер
				"cssls", -- CSS, SASS-д зориулсан LSP сервер
				"tailwindcss", -- Tailwind CSS-д зориулсан LSP сервер
				"lua_ls", -- Lua-д зориулсан LSP сервер
				"graphql", -- GraphQL-д зориулсан LSP сервер
				"emmet_ls", -- Emmet (HTML, CSS-д хурдан бичихэд туслах) LSP сервер
				"rust_analyzer", -- Rust-д зориулсан LSP сервер
			},
		})

		-- mason-tool-installer-ийн тохиргоо
		mason_tool_installer.setup({ -- mason-tool-installer-ийн тохиргооны функцыг дуудах
			ensure_installed = { -- mason-аар суулгах хэрэгслүүдийн жагсаалт
				"prettier", -- Prettier форматлагч (TypeScript, JavaScript, React, TSX, TS, CSS, SASS гэх мэт)
				"stylua", -- Lua форматлагч
				"isort", -- Python кодын импортыг эмхэлдэг форматлагч
				"black", -- Python кодын форматлагч
				"pylint", -- Python линтер (кодын алдаа шалгагч)
				"eslint_d", -- ESLint линтер (TypeScript, JavaScript, React, TSX, TS кодын алдаа шалгагч)
				"stylelint", -- SASS, CSS-д зориулсан линтер
			},
		})

		-- conform.nvim тохиргоо
		-- require("conform").setup({ -- conform.nvim-ийн тохиргооны функцыг дуудах
		-- 	formatters_by_ft = { -- Файлын төрөл тус бүрт форматлагч тохируулах
		-- 		scss = { "prettier" }, -- SCSS файлуудад prettier ашиглах
		-- 		html = { "prettier" }, -- HTML файлуудад prettier ашиглах
		-- 		svelte = { "prettier" }, -- Svelte файлуудад prettier ашиглах
		-- 		graphql = { "prettier" }, -- GraphQL файлуудад prettier ашиглах
		-- 		lua = { "stylua" }, -- Lua файлуудад stylua ашиглах
		-- 		python = { "isort", "black" }, -- Python файлуудад isort болон black ашиглах
		-- 		rust = { "rustfmt" }, -- Rust файлуудад rustfmt ашиглах
		--
		-- 		javascript = { { "eslint_d", "eslint", "prettierd", "prettier" } },
		-- 		javascriptreact = { { "eslint_d", "eslint", "prettierd", "prettier" } },
		-- 		typescript = { { "eslint_d", "eslint", "prettierd", "prettier" } },
		-- 		typescriptreact = { { "eslint_d", "eslint", "prettierd", "prettier" } },
		-- 		css = { { "stylelint" } },
		-- 		go = { { "goimports", "golines", "", "prettier" } },
		-- 		proto = { { "buf" } },
		-- 		sql = { { "sql_formatter" } },
		-- 		["*"] = { "injected" },
		-- 	},
		-- 	format_on_save = { -- Хадгалахдаа автоматаар формат хийх
		-- 		timeout_ms = 500, -- Формат хийхэд хамгийн их хүлээх хугацаа (миллисекунд)
		-- 		lsp_fallback = true, -- Хэрвээ форматлагч байхгүй бол LSP ашиглан формат хийх
		-- 	},
		-- 	formatters = {
		-- 		prepend_args = { "--print-width", "120" },
		-- 	},
		-- })

		-- tsserver-ийг тусад нь суулгах
		local mason_registry = require("mason-registry")
		if not mason_registry.is_installed("typescript-language-server") then
			mason_registry.get_package("typescript-language-server"):install()
		end
	end,
}
