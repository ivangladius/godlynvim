print("Setting general keybindings")

local map = vim.keymap.set

-- Window management
map('n', '<leader>1', ":only<CR>", {})
map('n', '<leader>2', ":sp<CR><C-w>w", {})
map('n', '<leader>3', ":vsp<CR><C-w>w", {})
map('n', '<leader>4', "<C-w>=", {})

print("Window management keybindings set")

-- Buffer navigation
map('n', '<M-n>', ":bprevious<CR>", { desc = 'goto previous buffer' })
map('n', '<M-p>', ":bnext<CR>", { desc = 'goto next buffer' })

print("Buffer navigation keybindings set")

-- Window navigation
map('n', '<M-h>', ":wincmd h<CR>", {})
map('n', '<M-j>', ":wincmd j<CR>", {})
map('n', '<M-k>', ":wincmd k<CR>", {})
map('n', '<M-l>', ":wincmd l<CR>", {})

print("Window navigation keybindings set")

-- Quick quit and save
map('n', '<M-q>', ":q!<CR>", {})
map('n', '<M-w>', ":w!<CR>", {})

print("Quick quit and save keybindings set")

-- Scrolling
map('n', '<M-.>', "<C-d>", {})
map('n', '<M-,>', "<C-u>", {})

print("Scrolling keybindings set")

-- Jump list navigation
map('n', '<M-o>', "<C-o>", {})
map('n', '<M-i>', "<C-i>", {})

print("Jump list navigation keybindings set")

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

print("All general keybindings set")

