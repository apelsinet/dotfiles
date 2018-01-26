"  █████╗ ██████╗ ███████╗██╗     ███████╗██╗███╗   ██╗███████╗████████╗
" ██╔══██╗██╔══██╗██╔════╝██║     ██╔════╝██║████╗  ██║██╔════╝╚══██╔══╝
" ███████║██████╔╝█████╗  ██║     ███████╗██║██╔██╗ ██║█████╗     ██║
" ██╔══██║██╔═══╝ ██╔══╝  ██║     ╚════██║██║██║╚██╗██║██╔══╝     ██║
" ██║  ██║██║     ███████╗███████╗███████║██║██║ ╚████║███████╗   ██║
" ╚═╝  ╚═╝╚═╝     ╚══════╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝

set nocompatible
filetype off
syntax on
set t_Co=256
set autoindent

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Plugin 'alessandroyorba/despacio'
" Plugin 'mhartington/oceanic-next'
Plugin 'morhetz/gruvbox'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'w0rp/ale'
Plugin 'scrooloose/nerdtree'
Plugin 'Valloric/YouCompleteMe'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'edkolev/tmuxline.vim'
Plugin 'haya14busa/incsearch.vim'
Plugin 'mbbill/undotree'
Plugin 'othree/yajs.vim'
Plugin 'mxw/vim-jsx'
Plugin 'tomtom/tcomment_vim'

call vundle#end()
filetype plugin indent on

" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" File specific indentation
autocmd Filetype html setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype css setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype scss setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype json setlocal ts=2 sts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sts=4 sw=4 expandtab
autocmd Filetype cpp setlocal ts=4 sts=4 sw=4 expandtab
" Work specific indendation
autocmd BufNewFile,BufRead ~/w/* setlocal ts=4 sts=4 sw=4 expandtab

colorscheme gruvbox
set background=dark

set relativenumber
set scrolloff=5

set colorcolumn=80,100
set cursorline

" Always show status bar
set laststatus=2

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|.jpg'

" Vim airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
" Airline theme for despacio:
" let g:airline_theme='base16color'
let g:airline_theme='gruvbox'

call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')

let g:airline_section_error = airline#section#create_right(['ALE'])
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_javascript_prettier_options = '--single-quote --tab-width 4 --trailing-comma all'

" JSX highlighting also in .js files
let g:jsx_ext_required = 0

" Always rewrite original on save, for better webpack watching
set backupcopy=yes

let g:NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.pyc$']

" Dont use preview scratch window
set completeopt-=preview

" Setup persistent undo directory
set undodir=~/.undodir/
set undofile

" Remaps
map <C-n> :NERDTreeToggle<CR>
map <S-n> :UndotreeToggle<CR>
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprevious!<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <leader>g :YcmCompleter GoTo<CR>
nnoremap <leader>ff :ALEFix<CR>
nnoremap <leader>ss :so ~/.vimrc<CR>

" Yank to mac clipboard
set clipboard=unnamed
set ttyfast " u got a fast terminal
set synmaxcol=128

set guioptions=
set guifont=mononoki:h16
