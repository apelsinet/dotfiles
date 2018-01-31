"  █████╗ ██████╗ ███████╗██╗     ███████╗██╗███╗   ██╗███████╗████████╗
" ██╔══██╗██╔══██╗██╔════╝██║     ██╔════╝██║████╗  ██║██╔════╝╚══██╔══╝
" ███████║██████╔╝█████╗  ██║     ███████╗██║██╔██╗ ██║█████╗     ██║
" ██╔══██║██╔═══╝ ██╔══╝  ██║     ╚════██║██║██║╚██╗██║██╔══╝     ██║
" ██║  ██║██║     ███████╗███████╗███████║██║██║ ╚████║███████╗   ██║
" ╚═╝  ╚═╝╚═╝     ╚══════╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝

set t_Co=256
syntax enable
call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" fzf requires 'brew install fzf'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'mbbill/undotree'
Plug 'haya14busa/incsearch.vim'
Plug 'morhetz/gruvbox'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'edkolev/tmuxline.vim'
Plug 'w0rp/ale'
Plug 'chemzqm/vim-jsx-improve'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

" Colors
colorscheme gruvbox
set background=dark

" Editor
set scrolloff=5
set colorcolumn=80,100
set autoindent
set number

" Always show status bar
set laststatus=2

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

" Remaps
map <C-n> :NERDTreeToggle<CR>
map <S-n> :UndotreeToggle<CR>
map <C-p> :FZF<CR>
map <leader>a :Ag<CR>
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprevious!<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <leader>ff :ALEFix<CR>
nnoremap <leader>ss :so ~/.config/nvim/init.vim<CR>

" Deoplete
let g:deoplete#enable_at_startup = 1

" NerdTree
let g:NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.pyc$']

" Vim airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'

" ALE
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

" Always rewrite original on save, for better webpack watching
set backupcopy=yes
