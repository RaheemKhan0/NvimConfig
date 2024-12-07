return {
  "jose-elias-alvarez/null-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        -- Lua
        null_ls.builtins.formatting.stylua,

        -- JavaScript/TypeScript
        null_ls.builtins.formatting.prettier, -- Prettier for JS/TS/HTML/CSS/JSON
        null_ls.builtins.diagnostics.eslint, -- ESLint for JavaScript/TypeScript

        -- HTML
        null_ls.builtins.formatting.prettier.with({ filetypes = { "html" } }),

        -- CSS
        null_ls.builtins.formatting.prettier.with({ filetypes = { "css", "scss", "less" } }),

        -- Python
        null_ls.builtins.formatting.black, -- Python formatter
        null_ls.builtins.formatting.isort, -- Python import sorter
        null_ls.builtins.diagnostics.flake8, -- Python linter

        -- C/C++
        null_ls.builtins.formatting.clang_format, -- C/C++ formatter
        null_ls.builtins.diagnostics.cpplint, -- C++ linter

        -- Markdown
        null_ls.builtins.formatting.prettier.with({ filetypes = { "markdown" } }),

        -- JSON
        null_ls.builtins.formatting.prettier.with({ filetypes = { "json" } }),

        -- YAML
        null_ls.builtins.formatting.prettier.with({ filetypes = { "yaml", "yml" } }),

        -- Shell scripting
        null_ls.builtins.formatting.shfmt, -- Shell script formatter
        null_ls.builtins.diagnostics.shellcheck, -- Shell script linter

        -- Go
        null_ls.builtins.formatting.gofmt, -- Go formatter

        -- Rust
        null_ls.builtins.formatting.rustfmt, -- Rust formatter

        -- Java
        null_ls.builtins.formatting.google_java_format, -- Java formatter
      },
      on_attach = function(client, bufnr)
        -- Keymaps for formatting in normal and visual modes
        local opts = { buffer = bufnr }

        -- Normal mode: format the entire buffer
        vim.keymap.set("n", "<leader>gf", function()
          if client.server_capabilities.documentFormattingProvider then
            vim.lsp.buf.format({ async = true })
          else
            print("Formatting is not supported by the LSP server.")
          end
        end, opts)

        -- Visual mode: format the selected range
        vim.keymap.set("v", "<leader>gf", function()
          if client.server_capabilities.documentRangeFormattingProvider then
            vim.lsp.buf.range_formatting()
          else
            print("Range formatting is not supported by the LSP server.")
          end
        end, opts)
      end,
    })

    -- Custom filetype detection for .ejs
    vim.filetype.add({
      extension = {
        ejs = "ejs",
      },
    })
  end,
}

