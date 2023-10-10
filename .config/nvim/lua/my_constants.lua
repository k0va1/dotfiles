local set = vim.opt

set.history=10000
-- autoread file if it was changed outside of vim
set.autoread = true
-- hide buffer instead of abandon
set.hidden = true
-- default split is right
set.splitright = true
set.splitbelow = true
-- enable mouse
set.mouse='a'
set.so=7
-- ingore cases in search
set.ignorecase = true
set.smartcase = true
-- highlight search results
set.hlsearch = true
--  "incrementally highlight
set.incsearch = true
set.lazyredraw = true
set.magic = true
-- show matches for brackets
set.showmatch = true
set.mat=2
--set.t_vb=nil
set.tm=500
set.foldcolumn='1'
set.encoding='utf8'
set.ffs='unix'
set.writebackup=false
set.swapfile=false
set.expandtab=true
set.smarttab=true
set.shiftwidth=2
set.tabstop=2
set.lbr=true
set.tw=500
-- auto indent
set.ai=true
-- smart indent
set.si=true
-- wrap lines
set.wrap=true

-- show spaces
set.listchars = {space = "·", tab = '>>'}
set.list=true

-- don't wrap the lines
set.wrap=false

-- set.primary clipboard
set.clipboard='unnamedplus'

-- relative line numbers
set.number=true
set.relativenumber=true

-- status line
set.laststatus=2

-- Folding
set.foldmethod="syntax"
set.foldenable=false
