syntax on

set guicursor=
set noshowmatch
set relativenumber
set hlsearch
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
set undodir=~/.vim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=8
set noshowmode

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=50

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

"set colorcolumn=80
"highlight ColorColumn ctermbg=0 guibg=lightgrey

call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tweekmonster/gofmt.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-utils/vim-man'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vuciv/vim-bujo'
Plug 'tpope/vim-dispatch'
Plug 'easymotion/vim-easymotion'
Plug 'shutnik/jshint2.vim'
Plug 'ryanoasis/vim-devicons'
"Vim Git
Plug 'tpope/vim-fugitive'
"Vim statusline
Plug 'vim-airline/vim-airline'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"  I AM SO SORRY FOR DOING COLOR SCHEMES IN MY VIMRC, BUT I HAVE
"  TOOOOOOOOOOOOO
"Plug 'gruvbox-community/gruvbox'
"Plug 'sainnhe/gruvbox-material'
"Plug 'phanviet/vim-monokai-pro'
"Plug 'flazz/vim-colorschemes'
"Plug '/home/mpaulson/personal/vim-be-good'
"Plug 'tomasiser/vim-code-dark'
Plug 'artanikin/vim-synthwave84'

call plug#end()

" exit to n\rmal mode with 'jj'
inoremap eu <ESC>

let g:mapleader=';'

map <Leader> <Plug>(easymotion-prefix)
map <C-w> :NERDTreeToggle<CR>
" In insert or command mode, move normally by using Ctrl
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

"let g:airline#extensions#tabline#formatter = 'default'
"let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }


set statusline+=%{exists('g:loaded_fugitive')?fugitive#statusline():''}

" --- vim go (polyglot) settings.
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

colorscheme synthwave84
set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let loaded_matchparen = 1
let g:mapleader = ";"

let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25


" Vim with me
nnoremap <leader>vwm :colorscheme gruvbox<bar>:set background=dark<CR>
nmap <leader>vtm :highlight Pmenu ctermbg=gray guibg=gray

vnoremap X "_d
inoremap <C-c> <esc>

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

command! -nargs=0 Prettier :CocCommand prettier.formatFile
inoremap <silent><expr> <C-space> coc#refresh()

fun! TrimWhitespace()
    let l:save = winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank("IncSearch", 50)
augroup END

autocmd BufWritePre * :call TrimWhitespace()
