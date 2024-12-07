return {
  "nvim-treesitter/nvim-treesitter", 
  build = ":TSUpdate",
  
  config = function()
     local config = require("nvim-treesitter.configs")
     config.setup({
        ensure_installed = {
           -- Commonly used languages
           "bash", "c", "cpp", "css", "html", "javascript", "typescript", "json",
           "lua", "java", "python", "markdown", "markdown_inline", "vim", "yaml",
           "php", "ruby", "go", "rust", "scss", "sql", "tsx",     

           -- Other useful languages
           "dockerfile", "graphql", "toml", "make", "perl", "kotlin", "haskell",
        },
        highlight = {
           enable = true,  -- Enable syntax highlighting
        },
        indent = {
           enable = true,  -- Enable Treesitter-based indentation
        },
        autotag = {
           enable = true,  -- Enable auto-closing tags for HTML and JSX
        },
        autoinstall = true,
     })

     -- Add support for EJS by mapping it to HTML
     vim.filetype.add({
        extension = {
           ejs = "html", -- Treat .ejs files as HTML
        },
     })
  end,
}

