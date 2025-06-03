return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true },
    { "folke/neodev.nvim", opts = {} },
  },
  config = function()
    local lspconfig = require("lspconfig")
    local mason_lspconfig = require("mason-lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local keymap = vim.keymap

    -- Keybindings for LSP
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        local opts = { buffer = ev.buf, silent = true }

        keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", vim.tbl_extend("force", opts, { desc = "Show LSP references" }))
        keymap.set("n", "gD", vim.lsp.buf.declaration, vim.tbl_extend("force", opts, { desc = "Go to declaration" }))
        keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", vim.tbl_extend("force", opts, { desc = "Show definitions" }))
        keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", vim.tbl_extend("force", opts, { desc = "Show implementations" }))
        keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", vim.tbl_extend("force", opts, { desc = "Show type defs" }))
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, vim.tbl_extend("force", opts, { desc = "Code actions" }))
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, vim.tbl_extend("force", opts, { desc = "Smart rename" }))
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", vim.tbl_extend("force", opts, { desc = "Buffer diagnostics" }))
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, vim.tbl_extend("force", opts, { desc = "Line diagnostics" }))
        keymap.set("n", "[d", vim.diagnostic.goto_prev, vim.tbl_extend("force", opts, { desc = "Prev diagnostic" }))
        keymap.set("n", "]d", vim.diagnostic.goto_next, vim.tbl_extend("force", opts, { desc = "Next diagnostic" }))
        keymap.set("n", "K", vim.lsp.buf.hover, vim.tbl_extend("force", opts, { desc = "Hover doc" }))
        keymap.set("n", "<leader>rs", ":LspRestart<CR>", vim.tbl_extend("force", opts, { desc = "Restart LSP" }))
      end,
    })

    -- Diagnostic signs (deprecated sign_define() орлуулах)
    local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
    vim.diagnostic.config({
      virtual_text = {
        prefix = "●",
        spacing = 2,
      },
      virtual_lines = false, -- эсвэл true
      underline = true,
      update_in_insert = true,
      severity_sort = true,
      float = {
        show_header = true,
        source = "always",
        border = "rounded",

      },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = signs.Error,
          [vim.diagnostic.severity.WARN] = signs.Warn,
          [vim.diagnostic.severity.HINT] = signs.Hint,
          [vim.diagnostic.severity.INFO] = signs.Info,
        },
      },
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Mason LSP setup
    mason_lspconfig.setup({
      handlers = {
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["graphql"] = function()
          lspconfig.graphql.setup({
            capabilities = capabilities,
            filetypes = { "graphql", "gql", "svelte", "typescriptreact", "javascriptreact" },
          })
        end,
        ["emmet_ls"] = function()
          lspconfig.emmet_ls.setup({
            capabilities = capabilities,
            filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss" },
          })
        end,
        ["lua_ls"] = function()
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                diagnostics = { globals = { "vim" } },
                completion = { callSnippet = "Replace" },
              },
            },
          })
        end,
        ["rust_analyzer"] = function()
          lspconfig.rust_analyzer.setup({
            capabilities = capabilities,
            settings = {
              ["rust-analyzer"] = {
                checkOnSave = { command = "clippy" },
                diagnostics = { enable = true },
              },
            },
          })
        end,
        ["tsserver"] = function()
          lspconfig.tsserver.setup({
            capabilities = capabilities,
            filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
            settings = {
              completions = { completeFunctionCalls = true },
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all",
                  includeInlayFunctionLikeReturnTypeHints = true,
                },
              },
            },
          })
        end,
        ["eslint"] = function()
          lspconfig.eslint.setup({
            capabilities = capabilities,
            on_attach = function(client, bufnr)
              client.server_capabilities.documentFormattingProvider = true
              client.server_capabilities.didChangeWatchedFiles = { dynamicRegistration = true }
              vim.api.nvim_create_autocmd("BufWritePre", {
                buffer = bufnr,
                command = "EslintFixAll",
              })
            end,
          })
        end,
      },
    })
  end,
}
