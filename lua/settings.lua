-- settings.lua
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.cmd[[set cpoptions+=x]]
vim.cmd[[set noswapfile]]

vim.o.clipboard = 'unnamedplus'

--vim.o.number = true
--vim.o.relativenumber = true
vim.o.expandtab = true
vim.o.shiftwidth = 4
vim.o.tabstop = 4
-- Add more settings as needed

vim.o.mouse = 'a'

vim.o.completeopt = 'menuone,noselect'

vim.o.hlsearch = false


--vim.cmd("colorscheme modus_vivendi")

vim.cmd('hi! MatchParen guibg=red guifg=black')
vim.cmd('hi! Visual guibg=white guifg=black')

vim.o.updatetime = 250
--vim.o.timeoutlen = 250
vim.o.termguicolors = true

-- vim.cmd("set background=dark")

-- vim.cmd("set scrolloff=999")
--
-- vim.cmd('hi! Constant guibg=black  guifg=white')
-- vim.cmd('hi! String guibg=black  guifg=#DB4E29')
-- vim.cmd('hi! Character guibg=black  guifg=white')
-- vim.cmd('hi! Number guibg=black  guifg=white')
-- vim.cmd('hi! Boolean guibg=black  guifg=white')
-- vim.cmd('hi! Float guibg=black  guifg=white')
--
-- vim.cmd('hi! Tag guibg=black  guifg=blue')
--
-- vim.cmd('hi! Normal guifg=yellow')
--  vim.cmd('hi! Function guibg=NONE  guifg=NONE gui=bold')
-- vim.cmd('hi! Comment guibg=black guifg=lightgrey ')
 -- vim.cmd('hi! Identifier guibg=NONE guifg=white')
--
-- vim.cmd('hi! Type guibg=black guifg=white gui=bold')
-- vim.cmd('hi! StorageClass guibg=black guifg=white gui=bold')
-- vim.cmd('hi! Structure guibg=black guifg=white gui=bold')
-- vim.cmd('hi! Typedef guibg=black guifg=white gui=bold')
--
-- vim.cmd('hi! Repeat guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! Condition guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! Exception guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! Statement guibg=black guifg=#FF7575 gui=NONE')
-- vim.cmd('hi! Operator guibg=black guifg=white ')
--
--
-- vim.cmd('hi! PrePro guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! Include guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! Define guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! Macro guibg=black guifg=#FF0058  ')
-- vim.cmd('hi! PreCondit guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! PreCondit guibg=black guifg=#FF0058 ')
--
--
-- vim.cmd('hi! Special guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! SpecialChar guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! Tag guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! Delimiter guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! SpecialComment guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! Debug guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! Underlined guibg=#251C25 guifg=#FF0058 ')
-- vim.cmd('hi! Ignore guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! Error guibg=black guifg=#FF0058 ')
-- vim.cmd('hi! Todo guibg=black guifg=#FF0058 ')
--
-- COLOR START 
  vim.cmd('hi! TelescopeSelection guibg=#251C25 guifg=#11FF29 ')
  vim.cmd('hi! WhichKeyFloat guibg=black guifg=#11FF29 ')
  vim.cmd('hi! WhichKeyDesc guibg=black guifg=#11FF29 ')
  vim.cmd('hi! WhichKeyGroup guibg=black guifg=#11FF29 ')

 --
  vim.cmd('hi! Pmenu guibg=#252A58 guifg=white ')
   vim.cmd('hi! PmenuSel guibg=#2F377E guifg=yellow gui=bold')
   vim.cmd('hi! PmenuKind guibg=NONE guifg=white ')
   vim.cmd('hi! PmenuKindSel guibg=NONE guifg=white ')
   vim.cmd('hi! PmenuExtra guibg=NONE guifg=white ')
   vim.cmd('hi! PmenuExtraSel guibg=NONE guifg=white ')
   vim.cmd('hi! PmenuSbar guibg=NONE guifg=white ')
   vim.cmd('hi! PmenuThumb guibg=NONE guifg=white ')
   vim.cmd('hi! CmpItemMenu guibg=NONE guifg=white ')
   vim.cmd('hi! CmpItemMenuDefault guibg=NONE guifg=white ')
   vim.cmd('hi! CmpItemMenuKind guibg=NONE guifg=white ')

   vim.cmd('hi! NvimTreeCursorLine guibg=#0E1024 guifg=yellow ')
   vim.cmd('hi! NvimTreeCursorColumn guibg=black guifg=yellow ')
   vim.cmd('hi! NvimTreeFolderName guibg=NONE guifg=white ')
   vim.cmd('hi! NvimTreeOpenedFolderName guibg=NONE guifg=white ')
   vim.cmd('hi! NvimTreeSymlinkFolderName guibg=NONE guifg=white ')
 --
   vim.cmd('hi! SignColumn guibg=NONE guifg=NONE ')
 --
 --
   vim.cmd('hi! DapUIType guibg=NONE guifg=yellow gui=NONE')
   vim.cmd('hi! DapUIVariable guibg=#251C25 guifg=#11FF29 gui=NONE')
   vim.cmd('hi! DapUIValue guibg=NONE guifg=white gui=NONE')
   vim.cmd('hi! DapUINormal guibg=NONE guifg=white gui=NONE')
   vim.cmd('hi! DapUIModifiedValue guibg=NONE guifg=yellow gui=NONE')

   vim.cmd('hi! debugPC guibg=white guifg=blue ')

   vim.cmd('hi! QuickFixLine guibg=NONE guifg=white ')


