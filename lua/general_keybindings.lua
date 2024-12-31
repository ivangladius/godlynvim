local map = vim.keymap.set

-- Window management
map('n', '<leader>1', ":only<CR>", {})
map('n', '<leader>2', ":sp<CR><C-w>w", {})
map('n', '<leader>3', ":vsp<CR><C-w>w", {})
map('n', '<leader>4', "<C-w>=", {})

-- Buffer navigation
map('n', '<M-n>', ":bprevious<CR>", { desc = 'goto previous buffer' })
map('n', '<M-p>', ":bnext<CR>", { desc = 'goto next buffer' })

-- Window navigation
map('n', '<M-h>', ":wincmd h<CR>", {})
map('n', '<M-j>', ":wincmd j<CR>", {})
map('n', '<M-k>', ":wincmd k<CR>", {})
map('n', '<M-l>', ":wincmd l<CR>", {})

map('n', '<M-f>', ':WindowsMaximize<CR>', {})

-- Quick quit and save
map('n', '<M-q>', ":q!<CR>", {})
map('n', '<M-w>', ":w!<CR>", {})

-- Scrolling
map('n', '<M-.>', "<C-d>", {})
map('n', '<M-,>', "<C-u>", {})

-- Jump list navigation
map('n', '<M-o>', "<C-o>", {})
map('n', '<M-i>', "<C-i>", {})

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
map('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
map('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
map('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Other keybindings
map('n', '<leader>fc', ":cd %:p:h<CR>", { desc = 'cd into current file directory' })

map('n', '<C-h>', "<C-w>2<", { desc = 'Resize to left' })
map('n', '<C-l>', "<C-w>2>", { desc = 'Resize to right' })
map('n', '<C-k>', "<C-w>2+", { desc = 'Resize to up' })
map('n', '<C-j>', "<C-w>2-", { desc = 'Resize to down' })


vim.keymap.set('n', '[', '%', { desc = 'Jump to matching bracket/paren' })
vim.keymap.set('x', '[', '%', { desc = 'Jump to matching bracket/paren in visual mode' }) -- Add this line

map('n', "<M-a>", ":w! | !!<CR>", { desc='Rerun last command' })
map('n', "<M-d>", ":<C-f>", { desc='Rerun last command MENU' })

vim.keymap.set("x", "p", function() return 'pgv"' .. vim.v.register .. "y" end, { remap = false, expr = true })
