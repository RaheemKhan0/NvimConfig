return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- Lua
					"clangd", -- C++
					"html", -- HTML
					"cssls", -- CSS
					"tailwindcss", -- Tailwind CSS
					"ts_ls", -- TypeScript/JavaScript
					"jdtls", -- Java
					"jsonls", -- JSON
					"bashls", -- Bash (useful for scripting)
					"emmet_ls", -- Emmet for JSX/TSX
				},
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		config = function()
			-- Enhance capabilities for autocompletion and features
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Import lspconfig
			local lspconfig = require("lspconfig")

			-- Helper function for setting up LSPs with enhanced capabilities
			local function setup_lsp(server, settings)
				lspconfig[server].setup({
					capabilities = capabilities,
					settings = settings or {},
				})
			end

			-- TypeScript/JavaScript LSP
			setup_lsp("ts_ls", {
				settings = {
					javascript = {
						suggest = {
							completeFunctionCalls = true, -- Suggest function calls
						},
					},
					typescript = {
						suggest = {
							completeFunctionCalls = true, -- Suggest function calls
						},
					},
				},
			})

			-- HTML LSP
			lspconfig.html.setup({
				capabilities = capabilities,
				filetypes = { "html", "ejs" }, -- Add support for EJS
			})

			-- Tailwind CSS Configuration
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				filetypes = {
					"html",
					"ejs",
					"css",
					"scss",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
				},
			})

			-- Emmet LSP for JSX and TSX
			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				filetypes = {
					"html",
					"css",
					"javascript",
					"javascriptreact",
					"typescriptreact",
				},
				init_options = {
					html = {
						options = {
							["bem.enabled"] = true, -- Optional: Enable BEM support
						},
					},
				},
			})

			-- Other LSP configurations
			setup_lsp("lua_ls", {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			})
			setup_lsp("clangd", {
				cmd = { "clangd", "--background-index", "--suggest-missing-includes" },
			})
			setup_lsp("cssls")
			setup_lsp("jdtls")
			setup_lsp("jsonls")
			setup_lsp("bashls")

			-- Keymaps for LSP actions
			vim.keymap.set("n", "k", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}

