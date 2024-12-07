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

			-- Changes: HTML LSP (No modification, just included for context)
			lspconfig.html.setup({
				capabilities = capabilities,
				filetypes = { "html", "ejs" }, -- Add support for EJS
				settings = {
					html = {
						suggest = {
							html5 = true, -- Enable HTML5 suggestions
						},
					},
				},
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
				settings = {
					tailwindCSS = {
						experimental = {
							classRegex = {
								{ "class\\s*=\\s*['\"](.*?)['\"]", 1 }, -- Match class="..."
								{ "className\\s*=\\s*['\"](.*?)['\"]", 1 }, -- Match className="..."
								{ "clsx\\(([^)]*)\\)", 1 }, -- Match clsx(...)
								{ "cn\\(([^)]*)\\)", 1 }, -- Match cn(...)
							},
						},
					},
				},
			})

			-- Other LSP configurations
			setup_lsp("lua_ls", {
				Lua = {
					diagnostics = {
						globals = { "vim" }, -- Recognize `vim` as a global variable
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

