return {
  {
    "hrsh7th/cmp-nvim-lsp"
  },
  {
    'L3MON4D3/LuaSnip',
    dependencies = {
      'saadparwaiz1/cmp_luasnip',
      "rafamadriz/friendly-snippets",
    },
  },
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lua",
    },
    config = function()
      local cmp = require'cmp'
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For LuaSnip users
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' }, -- LSP suggestions
          { name = 'luasnip' },  -- Snippet suggestions
          { name = 'nvim_lua' }, -- Lua API completions
          { name = 'path' },     -- Filepath completions
        }, {
          { name = 'buffer' },   -- Buffer completions
        }),
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")
      local capabilities = require('cmp_nvim_lsp').default_capabilities()

      -- Setup for EJS linting
      lspconfig.html.setup({
        capabilities = capabilities,
        filetypes = { "html", "htmldjango", "ejs" }, -- Add "ejs" for EJS support
        settings = {
          html = {
            validate = true, -- Enable linting
          },
        },
      })
    end,
  },
}

