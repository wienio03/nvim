local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false

opt.cursorline = true

opt.termguicolors = true
opt.background = "dark"
opt.colorcolumn = "0"
opt.signcolumn = "yes"

opt.clipboard:append("unnamedplus")

opt.splitright = true
opt.splitbelow = true

opt.iskeyword:append("-")

opt.termguicolors = true

local diagnostics_active = true
local toggle_diagnostics = function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

vim.keymap.set('n', '<leader>td', toggle_diagnostics, { desc = 'Toggle diagnostics' })
