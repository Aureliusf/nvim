set guicursor=
set noshowmatch
set number
set nohlsearch
set hidden
set noerrorbells
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=/home/aurelius/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8

" Give more space for displaying messages
set cmdheight=2

"Having longer updatetime leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to /ins-completion-menu/
set shortmess+=c

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')
Plug 'neoclide/coc.nvim',{'branch':'release'}
Plug 'tweekmonster/gofmt.vim',{'branch':'release'}
Plug 'mbbill/undotree'
"" Plug 'junegunn/fzf',{'do':{fzf#install()}}
Plug 'junegunn/fzf.vim'
Plug 'autozimu/LanguageClient-neovim'

Plug 'ctrlpvim/ctrlp.vim'

" Colorways
Plug 'sainnhe/forest-night'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'

call plug#end()

let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start']
    \ }

let g:gruvbox_contrast_dark ='hard'
let g:gruvbox_inver_selection ='0'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

let g:forest_night_enable_italic = 1
let g:forest_night_enable_italic_comment = 1

colorscheme forest-night
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let mapleader = " "
let g:netwr_browser_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25


augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch",100)
augroup END

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: use :verbose imap <tab> to make sure is not already taken.
inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.')[col -1] =~# '\s'
endfun

command! -nargs=0 Prettier :CocCommand prettier.formatFile

inoremap <silent><expr> <C-space> coc#refresh()

" cntrlp config
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_working_path_mode = 'c'
