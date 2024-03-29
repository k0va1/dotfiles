if ! filereadable(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim"'))
  echo "Downloading junegunn/vim-plug to manage plugins..."
  silent !mkdir -p ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/
  silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ${XDG_CONFIG_HOME:-$HOME/.config}/nvim/autoload/plug.vim
  autocmd VimEnter * PlugInstall
endif

let g:coc_node_path = '/home/k0va1/.asdf/installs/nodejs/16.15.1/bin/node'
call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))" my plugins
Plug 'dracula/vim'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'preservim/nerdcommenter'
Plug 'SirVer/ultisnips'
Plug 'alvan/vim-closetag'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/tagalong.vim'
let g:tagalong_additional_filetypes = ['javascript']
Plug 'posva/vim-vue'
Plug 'lyokha/vim-xkbswitch'
Plug 'jreybert/vimagit'
Plug 'slim-template/vim-slim'
"fzf
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }

"nvim start screen
Plug 'mhinz/vim-startify'

" plugins from vimrc
Plug 'mileszs/ack.vim'
" Asynchronous Lint Engine
Plug 'dense-analysis/ale'
Plug 'jiangmiao/auto-pairs'
" distraction-free mode
Plug 'junegunn/goyo.vim'

" status line
Plug 'itchyny/lightline.vim'
Plug 'maximbaz/lightline-ale'

Plug 'godlygeek/tabular'
Plug 'terryma/vim-expand-region'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'farmergreg/vim-lastplace'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-repeat'
Plug 'maxbrunsfeld/vim-yankstack'

" for languages
Plug 'chr4/nginx.vim'
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'groenewege/vim-less'
Plug 'plasticboy/vim-markdown'
Plug 'vim-ruby/vim-ruby'

" markdown preview
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

Plug 'vim-test/vim-test'

" find and replace tool
Plug 'brooth/far.vim'

"nnoremap <silent> <leader>g   :Farf<cr>
"vnoremap <silent> <leader>g   :Farf<cr>

" haskell
Plug 'neovimhaskell/haskell-vim'
let g:haskell_classic_highlighting=1

Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()


" ### CONFIGURATION ###
filetype plugin on
filetype indent on

set history=10000
set autoread "autoread file if it was changed outside of vim
set hidden "hide buffer instead of abandon
set splitbelow splitright "default split is right
set mouse=a "enable mouse
set so=7
set ignorecase "ingore cases in search
set smartcase
set hlsearch "highlight search results
set incsearch "incrementally highlight
set lazyredraw
set magic
set showmatch "show matches for brackets
set mat=2
set noerrorbells "disable bells
set novisualbell "disable visual bells
set t_vb=
set tm=500
set foldcolumn=1
set encoding=utf8
set ffs=unix
set nobackup
set nowb
set noswapfile
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
set lbr
set tw=500
set ai "Auto indent
set si "Smart indent
set wrap "Wrap lines
"disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L
"show spaces
set lcs+=space:·
set list
"don't wrap the lines
set nowrap
"set primary clipboard
set clipboard=unnamedplus
"relative line numbers
set number
set relativenumber
"status line
set laststatus=2

syntax enable

au FocusGained,BufEnter * checktime

let mapleader = ","

nmap <leader>w :w!<cr>
" :W sudo saves the file
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

vnoremap <silent> * :<C-u>call VisualSelection('', '')<CR>/<C-R>=@/<CR><CR>
vnoremap <silent> # :<C-u>call VisualSelection('', '')<CR>?<C-R>=@/<CR><CR>

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT
" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$")   | exe "normal! g'\"" | endif

if has("autocmd")
  autocmd BufWritePre *.txt,*.js,*.py,*.wiki,*.sh,*.coffee :call CleanExtraSpaces()
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>e :e! ~/.config/nvim/init.vim<cr>
autocmd! bufwritepost ~/.config/nvim/init.vim source ~/.config/nvim/init.vim

" Bash like keys for the command line
cnoremap <C-A> <Home>
cnoremap <C-E> <End>
cnoremap <C-K> <C-U>

cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <M-b> <C-Left>
cnoremap <M-f> <C-Right>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i

" When you press gv you Ack after the selected text
vnoremap <silent> gv :call VisualSelection('gv', '')<CR>

" Open Ack and put the cursor in the right position
map <leader>g :Ack 

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace', '')<CR>

" Do :help cope if you are unsure what cope is. It's super       useful!
"
" When you search with Ack, display your results in cope by      doing:
"   <leader>cc
"
" To go to the next search result do:
"   <leader>n
"
" To go to the previous search results do:
"   <leader>p
"
map <leader>cc :botright cope<cr>
map <leader>co ggVGy:tabnew<cr>:set syntax=qf<cr>pgg
map <leader>n :cn<cr>
map <leader>p :cp<cr>

" Make sure that enter is never overriden in the quickfix window
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>

""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400

""""""""""""""""""""""""""""""
" => YankStack
""""""""""""""""""""""""""""""
let g:yankstack_yank_keys = ['y', 'd']

nmap <C-p> <Plug>yankstack_substitute_older_paste
nmap <C-n> <Plug>yankstack_substitute_newer_paste

"leaderf
let g:Lf_WindowPosition = 'popup'
let g:Lf_ShortcutF = '<C-F>'
let g:Lf_PreviewInPopup = 1
let g:Lf_IndexTimeLimit = 2
let g:Lf_UseCache = 0
let g:Lf_UseMemoryCache = 0
let g:Lf_PreviewResult = {'Rg': 1 }

noremap gf :<C-U><C-R>=printf("Leaderf! rg -F -e %s ", leaderf#Rg#visual())<CR>
noremap <leader>f :<C-U><C-R>=printf("Leaderf mru %s", "")<CR><CR>

let g:ctrlp_custom_ignore = {
      \ 'dir': '\v[\/](node_modules|target|dist|bower_components|build)|(\.(swp|ico|git|svn|idea|bundle|sass-cache))$'
      \ }


""""""""""""""""""""""""""""""
" => ZenCoding
""""""""""""""""""""""""""""""
" Enable all functions in all modes
let g:user_zen_mode='a'

map <leader>nn :CocCommand explorer --width 35<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => vim-multiple-cursors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-s>'
let g:multi_cursor_select_all_word_key = '<A-s>'
let g:multi_cursor_start_key           = 'g<C-s>'
let g:multi_cursor_select_all_key      = 'g<A-s>'
let g:multi_cursor_next_key            = '<C-s>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
        \   'left': [ ['mode', 'paste'],
        \             ['fugitive', 'readonly', 'filename', 'modified'] ],
        \   'right': [ [ 'lineinfo' ], ['percent'] ]
        \ },
        \ 'component': {
          \   'readonly': '%{&filetype=="help"?"":&readonly?"🔒":""}',
          \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
          \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
          \ },
          \ 'component_visible_condition': {
            \   'readonly': '(&filetype!="help"&& &readonly)',
            \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
            \   'fugitive': '(exists("*fugitive#head") && ""!=fugitive#head())'
            \ },
            \ 'separator': { 'left': ' ', 'right': ' ' },
            \ 'subseparator': { 'left': ' ', 'right': ' ' }
            \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Ale (syntax checker and linter)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:ale_linters = {
      \   'javascript': ['jshint'],
      \   'python': ['flake8'],
      \   'go': ['go', 'golint', 'errcheck']
      \}
let g:ale_fixers = {'javascript': ['eslint']}
nmap <silent> <leader>a <Plug>(ale_next_wrap)

let g:ale_fix_on_save = 1
" Disabling highlighting
let g:ale_set_highlights = 0

" Only run linting when saving the file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Git gutter (Git diff)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:gitgutter_enabled=1

let g:XkbSwitchEnabled=1
let g:XkbSwitchLib='/usr/lib/libxkbswitch.so'

"Если вы используете обычную qwerty, то поменяте mac на win
set keymap=russian-jcukenwin
"Язык ввода при старте Вима - Английский
set iminsert=0
"Аналогично настраивается режим поиска
set imsearch=0
"set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz

set termguicolors
colorscheme dracula
let g:ctrlp_show_hidden = 1
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --color never --hidden -g "!{node_modules,.git}"'
  let g:ctrlp_use_caching = 0
endif

let g:vue_pre_processors = []

filetype plugin indent on
filetype on
"nerd comments for vue files
let g:ft = ''
function! NERDCommenter_before()
  if &ft == 'vue'
    let g:ft = 'vue'
    let stack = synstack(line('.'), col('.'))
    if len(stack) > 0
      let syn = synIDattr((stack)[0], 'name')
      if len(syn) > 0
        exe 'setf ' . substitute(tolower(syn), '^vue_', '', '')
      endif
    endif
  endif
endfunction

function! NERDCommenter_after()
  if g:ft == 'vue'
    setf vue
    let g:ft = ''
  endif
endfunction

"vim-closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.vue,*.html.erb,*.js'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_shortcut = '>'
let g:closetag_filetypes = 'html,xhtml,phtml'


let g:ackprg = 'rg --no-heading --color never --column'
let g:ack_autoclose = 1

let g:UltiSnipsExpandTrigger="<C-tab>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Helper functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Returns true if paste mode is enabled
function! HasPaste()
  if &paste
    return 'PASTE MODE  '
  endif
  return ''
endfunction

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
  let l:currentBufNum = bufnr("%")
  let l:alternateBufNum = bufnr("#")

  if buflisted(l:alternateBufNum)
    buffer #
  else
    bnext
  endif

  if bufnr("%") == l:currentBufNum
    new
  endif

  if buflisted(l:currentBufNum)
    execute("bdelete! ".l:currentBufNum)
  endif
endfunction

function! CmdLine(str)
  call feedkeys(":" . a:str)
endfunction

function! VisualSelection(direction, extra_filter) range
  let l:saved_reg = @"
  execute "normal! vgvy"

  let l:pattern = escape(@", "\\/.*'$^~[]")
  let l:pattern = substitute(l:pattern, "\n$", "", "")

  if a:direction == 'gv'
    call CmdLine("Ack '" . l:pattern . "' " )
  elseif a:direction == 'replace'
    call CmdLine("%s" . '/'. l:pattern . '/')
  endif

  let @/ = l:pattern
  let @" = l:saved_reg
endfunction

" Delete trailing white space on save, useful for some filetype  s ;)
fun! CleanExtraSpaces()
  let save_cursor = getpos(".")
  let old_query = getreg('/')
  silent! %s/\s\+$//e
  call setpos('.', save_cursor)
  call setreg('/', old_query)
endfun


" coc vim
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
"inoremap <silent><expr> <TAB>
      "\ pumvisible() ? "\<C-n>" :
      "\ <SID>check_back_space() ? "\<TAB>" :
      "\ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

"function! s:check_back_space() abort
"let col = col('.') - 1
"return !col || getline('.')[col - 1]  =~# '\s'
"endfunction

"" Use <c-space> to trigger completion.
"if has('nvim')
"inoremap <silent><expr> <c-space> coc#refresh()
"else
"inoremap <silent><expr> <c-@> coc#refresh()
"endif
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gs :sp<CR><Plug>(coc-definition)
nmap <silent> gv :vsp<CR><Plug>(coc-definition)

" folding
set foldmethod=syntax
set nofoldenable

" tests
nmap <leader>t :TestNearest<CR>
nmap <leader>tt :TestLast<CR>
nmap <leader>tf :TestFile<CR>

"call CocActionAsync('runCommand', 'explorer.doAction', 'closest', ['reveal'], [['relative', 0, 'file']])


" autoindent files
augroup autoindent
  au!
  let blacklist = ['dockerfile', 'yaml', 'markdown', 'conf', 'tads', '', 'javascript']
  autocmd BufWritePre * if index(blacklist, &ft) < 0 | :normal migg=G`i
augroup End

" vim-closetag config
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
" end vim-closetag config
"

" reduce memory consumption tsserver
autocmd VimLeavePre * :call coc#rpc#kill()
autocmd VimLeave * if get(g:, 'coc_process_pid', 0) | call system('kill -9 -'.g:coc_process_pid) | endif

nnoremap <silent> <leader>m :MagitOnly<CR>
