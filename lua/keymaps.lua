-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
-- tst
-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })
-- vim.keymap.set('n', '<C-/>', ':split | term<CR>', { noremap = true, silent = true })
local terminal_open = false

local function toggle_terminal()
  if terminal_open then
    -- Close the terminal if it's open
    vim.cmd 'q' -- This closes the current split
  else
    -- Open a terminal in a new split if it's not open
    vim.cmd 'split | term'
  end
  terminal_open = not terminal_open
end

-- Set the keymap to call the toggle function
vim.keymap.set('n', '<C-/>', toggle_terminal, { noremap = true, silent = true })
-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
local opts = { noremap = true, silent = true }
vim.keymap.set('v', 'p', 'P', opts)
vim.keymap.set('n', 'U', '<C-r>', opts)
vim.keymap.set('n', '<S-h>', ':bprevious<cr>', opts)
vim.keymap.set('n', '<S-l>', ':bnext<cr>', opts)
vim.keymap.set('n', 'gl', '$', opts)
vim.keymap.set('n', 'gh', '^', opts)
vim.keymap.set('n', 'Y', 'y$', opts)
--
-- BUFFERS
-- delete current
vim.api.nvim_set_keymap('n', '<leader>bd', ':confirm bd<CR>', { noremap = true, silent = true })
-- delete all others
vim.api.nvim_set_keymap('n', '<leader>bo', ':%bd|e#<CR>', { noremap = true, silent = true })
--
-- WINDOWS
-- Split window horizontally
vim.api.nvim_set_keymap('n', '<leader>sh', ':split<CR>', { noremap = true, silent = true })

-- Split window vertically
vim.api.nvim_set_keymap('n', '<leader>sv', ':vsplit<CR>', { noremap = true, silent = true })

-- Close current window
vim.api.nvim_set_keymap('n', '<leader>cw', ':close<CR>', { noremap = true, silent = true })

-- Navigate between windows
vim.api.nvim_set_keymap('n', '<C-h>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-j>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-k>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-l>', '<C-w>l', { noremap = true, silent = true })

-- Resize windows
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>+', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>-', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w><', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>>', { noremap = true, silent = true })

-- Equalize window sizes
vim.api.nvim_set_keymap('n', '<leader>we', '<C-w>=', { noremap = true, silent = true })
-- vim: ts=2 sts=2 sw=2 et
