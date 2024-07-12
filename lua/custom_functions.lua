-- custom_functions.lua

-- Function to find the git root
local function find_git_root()
  local git_dir = vim.fn.finddir('.git', '.;')
  return git_dir ~= '' and vim.fn.fnamemodify(git_dir, ':h') or nil
end

-- Custom function to search in git root
local function live_grep_git_root()
  local git_root = find_git_root()
  if git_root then
    require('telescope.builtin').live_grep({
      search_dirs = {git_root},
    })
  end
end

-- Define custom commands
vim.api.nvim_create_user_command('LiveGrepGitRoot', live_grep_git_root, {})

vim.api.nvim_create_user_command('IvanFindFileFromHome',
  function()
    require('telescope.builtin').find_files({
      prompt_title = 'Find Files',
      cwd = vim.fn.expand('$HOME'),
      find_command = {'fd', '--type', 'f', '--hidden', '--no-ignore-vcs', '--max-depth', '4'}
    })
  end,
  {}

)vim.api.nvim_create_user_command('IvanFindConfig',
  function()
    vim.cmd[[e ~/.config/nvim/init.lua]]
  end,
  {}
)

vim.api.nvim_create_user_command('IvanSnipeCopyWord',
  function()
    vim.cmd.HopChar1MW()
    vim.cmd('normal! yiw')
    vim.cmd.execute [["normal \<c-o>"]]
  end,
  {}
)

vim.api.nvim_create_user_command('IvanSnipeCopyWholeWord',
  function()
    vim.cmd.HopChar1MW()
    vim.cmd('normal! yiW')
    vim.cmd.execute [["normal \<c-o>"]]
  end,
  {}
)

vim.api.nvim_create_user_command('IvanSnipeCopyLine',
  function()
    vim.cmd.HopLine()
    vim.cmd('normal! yy')
    vim.cmd.execute [["normal \<c-o>"]]
  end,
  {}
)
