return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make"},
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope")
    telescope.setup({
      defaults = {
        file_ignore_patterns = {
          "node_modules/",
          "%.lock",
          "package%-lock%.json",
          "yarn%.lock",
          "pnpm%-lock%.yaml",

          "dist/",
          "build/",
          "%.min%.js",
          "%.min%.css",

          "%.git/",
          "%.svn/",

          "%.DS_Store",
          "Thumbs%.db",

          "%.vscode/",
          "%.idea/",
          "%.swp",
          "%.swo",
          "%.tmp",

          "%.env",
          "%.log",
          "%.cache/",
          "%.next/",
          "coverage/",
        },
        vimgrep_arguments = {
          "rg",
          "--color=never",
          "--no-heading",
          "--with-filename",
          "--line-number",
          "--column",
          "--smart-case",
          "--hidden",
          "--glob=!.git/",
        }
      }
    })
    telescope.load_extension("fzf")

    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
    vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
    vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
    vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  end
}
