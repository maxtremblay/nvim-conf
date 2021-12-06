local function nkeymap(key, command)
  vim.api.nvim_set_keymap('n', key, command, {noremap = true})
end

local function xkeymap(key, command)
  vim.api.nvim_set_keymap('x', key, command, {noremap = true})
end

vim.g.mapleader = ' '

-- Tree explorer
nkeymap('<Leader>n', ':NvimTreeToggle<CR>')

-- Better window movement
nkeymap('<C-h>', '<C-w>h')
nkeymap('<C-j>', '<C-w>j')
nkeymap('<C-k>', '<C-w>k')
nkeymap('<C-l>', '<C-w>l')

-- Telescope
nkeymap('<Leader>ff', '<cmd>lua require("telescope.builtin").find_files()<cr>')
nkeymap('<Leader>fb', '<cmd>lua require("telescope.builtin").buffers()<cr>')
nkeymap('<Leader>fh', '<cmd>lua require("telescope.builtin").help_tags()<cr>')
nkeymap('<Leader>fe', '<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<cr>')

nkeymap('<Leader>rg', '<cmd>lua require("telescope.builtin").live_grep()<cr>')

nkeymap('<Leader>gc', '<cmd>lua require("telescope.builtin").git_commits()<cr>')
nkeymap('<Leader>gb', '<cmd>lua require("telescope.builtin").git_branches()<cr>')
nkeymap('<Leader>gs', '<cmd>lua require("telescope.builtin").git_statuses()<cr>')

-- Comments
vim.api.nvim_set_keymap('n', '<Leader>ci', '<Plug>kommentary_line_increase', {})
vim.api.nvim_set_keymap('n', '<Leader>cd', '<Plug>kommentary_line_decrease', {})
vim.api.nvim_set_keymap('n', '<Leader>cc', '<Plug>kommentary_line_default', {})
vim.api.nvim_set_keymap('x', '<Leader>ci', '<Plug>kommentary_visual_increase', {})
vim.api.nvim_set_keymap('x', '<Leader>cd', '<Plug>kommentary_visual_decrease', {})
vim.api.nvim_set_keymap('x', '<Leader>cc', '<Plug>kommentary_visual_default', {})

-- Terminal
nkeymap('<Leader>t', ':ToggleTerm<cr>')

function _G.set_terminal_keymaps()
  local opts = {noremap = true}
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

