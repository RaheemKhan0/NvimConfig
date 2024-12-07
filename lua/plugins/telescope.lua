return {
   { 
     "nvim-telescope/telescope.nvim", 
     tag = "0.1.8",
     dependencies = { "nvim-lua/plenary.nvim" },
 
     config = function()
       local telescope_status, builtin = pcall(require, "telescope.builtin")
 
       if telescope_status then
         vim.keymap.set("n", "<leader>p", builtin.find_files, {})
         vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
       else
         vim.api.nvim_err_writeln("Telescope is not loaded.")
       end
     end,
   },
   {
     "nvim-telescope/telescope-ui-select.nvim",
     config = function()
       require("telescope").setup({
         extensions = {
           ["ui-select"] = {
             require("telescope.themes").get_dropdown({})
           },
         },
       })
 
       require("telescope").load_extension("ui-select")
     end,
   },
 }
 

 
