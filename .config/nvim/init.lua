require('my_plugins')
require('my_globals')
require('my_functions')
require('my_constants')
require('my_mappings')
require('plugins/my_autotag')
require('plugins/my_xkbswitch')
require('plugins/my_nvim_tree')
require('plugins/my_lsp')
require('plugins/my_nvim_cmp')
require('plugins/my_lualine')
require('plugins/my_neogit')
require('plugins/my_gitsigns')
require('plugins/my_telescope')

vim.cmd([[
colorscheme dracula

au FocusGained,BufEnter * checktime
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")   | exe "normal! g'\"" | endif
nmap <silent> <leader>a <Plug>(ale_next_wrap)
]])
