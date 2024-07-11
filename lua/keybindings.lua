-- keybindings.lua
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

-- Plugin keybindings
map('n', '<leader>j', ':Oil<CR>', {})
map('n', '<leader>k', ':bd<CR>', {})

print("Plugin keybindings set")

-- Window maximization
map('n', '<M-f>', ':WindowsMaximize<CR>', {})

print("Window maximization keybinding set")

-- Buffer commands
map('n', '<leader>bn', ':enew<CR>', {})
map('n', '<leader>bd', ':bd<CR>', {})

print("Buffer commands keybindings set")

-- LSP keybindings
map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
map('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaration' })
map('n', 'gr', vim.lsp.buf.references, { desc = 'Go to references' })
map('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
map('n', 'K', vim.lsp.buf.hover, { desc = 'Hover' })
map('n', '<leader>rn', vim.lsp.buf.rename, { desc = 'Rename' })
map('n', '<leader>ca', vim.lsp.buf.code_action, { desc = 'Code action' })
map('n', '<leader>f', vim.lsp.buf.formatting, { desc = 'Format buffer' })

print("LSP keybindings set")

-- Telescope keybindings
map('n', '<leader>ir', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
map('n', '<leader>if', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
map('n', '<leader>/', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })
map('n', '<leader>iw', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
map('n', '<leader>ie', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
map('n', '<leader>iE', ":IvanFindFileFromHome<CR>", { desc = '[S]earch [F]iles' })
map('n', '<leader>iC', ":IvanFindConfig<CR>", { desc = 'Open config' })
map('n', '<leader>ih', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
map('n', '<leader>is', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
map('n', '<leader>ia', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
map('n', '<leader>iA', ':LiveGrepGitRoot<cr>', { desc = '[S]earch by [G]rep on Git Root' })
map('n', '<leader>id', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
map('n', '<leader>ic', require('telescope.builtin').commands, { desc = '[S]earch [C]ommands' })
map('n', '<leader>im', require('telescope.builtin').man_pages, { desc = '[S]earch [M]an pages' })
map('n', '<leader>iq', require('telescope.builtin').registers, { desc = '[S]earch [R]egisters' })
map('n', '<leader>gs', require('telescope.builtin').git_status, { desc = '[G]it [S]tatus' })
map('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

print("Telescope keybindings set")

-- Window swap
map('n', '<leader>ws', "<C-w>x", { desc = '[S]wap Windows' })

print("Window swap keybinding set")

-- Additional custom command keybindings
map('n', '<leader>scw', ":IvanSnipeCopyWord<CR>", { desc = 'Snipe Copy Word' })
map('n', '<leader>scW', ":IvanSnipeCopyWholeWord<CR>", { desc = 'Snipe Copy Whole Word' })
map('n', '<leader>scl', ":IvanSnipeCopyLine<CR>", { desc = 'Snipe Copy Line' })

print("All keybindings set")

