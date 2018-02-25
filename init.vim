"  █████╗ ██████╗ ███████╗██╗     ███████╗██╗███╗   ██╗███████╗████████╗
" ██╔══██╗██╔══██╗██╔════╝██║     ██╔════╝██║████╗  ██║██╔════╝╚══██╔══╝
" ███████║██████╔╝█████╗  ██║     ███████╗██║██╔██╗ ██║█████╗     ██║
" ██╔══██║██╔═══╝ ██╔══╝  ██║     ╚════██║██║██║╚██╗██║██╔══╝     ██║
" ██║  ██║██║     ███████╗███████╗███████║██║██║ ╚████║███████╗   ██║
" ╚═╝  ╚═╝╚═╝     ╚══════╝╚══════╝╚══════╝╚═╝╚═╝  ╚═══╝╚══════╝   ╚═╝

" Theme
syntax enable
" for vim 7
set t_Co=256

" for vim 8
if (has("termguicolors"))
  set termguicolors
endif

call plug#begin('~/.local/share/nvim/plugged')
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
" fzf requires 'brew install fzf'
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'mbbill/undotree'
Plug 'haya14busa/incsearch.vim'
Plug 'apelsinet/gruvbox'
Plug 'tomtom/tcomment_vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/tmuxline.vim'
Plug 'w0rp/ale'
Plug 'othree/html5.vim'
Plug 'hail2u/vim-css3-syntax'
Plug 'cakebaker/scss-syntax.vim'
Plug 'othree/yajs.vim'
Plug 'mxw/vim-jsx'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
call plug#end()

" Colors
let g:gruvbox_italicize_comments=1
let g:gruvbox_italic=1
colorscheme gruvbox
set background=dark

" Editor
set scrolloff=5
set colorcolumn=80,100
set autoindent
set number
set nowrap

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
map <leader>u :UndotreeToggle<CR>
map <C-p> :FZF<CR>
map <leader>a :Ag<CR>
map <leader>e :!estilo render<CR><CR>:so ~/.config/nvim/init.vim<CR>
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h
nnoremap <Tab> :bnext!<CR>
nnoremap <S-Tab> :bprevious!<CR>
nnoremap <leader>x :bp\|bd #<CR>
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <leader>ff :ALEFix<CR>
nnoremap <leader>ss :so ~/.config/nvim/init.vim<CR>
nmap <leader>b <Plug>(ale_previous_wrap)
nmap <leader>n <Plug>(ale_next_wrap)
nmap <leader>v :vsplit<CR>
nmap <leader>h :split<CR>
" use tab to forward cycle
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" use tab to backward cycle
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<s-tab>"

" Deoplete
let g:deoplete#enable_at_startup = 1

" NerdTree
let g:NERDTreeQuitOnOpen = 1
let NERDTreeIgnore = ['\.pyc$']

" Vim airline
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='gruvbox'

" ALE
call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')
let g:airline_section_error = airline#section#create_right(['ALE'])
let g:ale_statusline_format = ['⨉ %d', '⚠ %d', '']
let g:ale_sign_error = '🔥'
let g:ale_sign_warning = '💩'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_fixers = {}
let g:ale_fixers['javascript'] = ['prettier']
let g:ale_javascript_prettier_options = '--single-quote --tab-width 4 --trailing-comma all'

" Vim-jsx
let g:jsx_ext_required = 0

" Always rewrite original on save, for better webpack watching
set backupcopy=yes

" Setup persistent undo directory
set undodir=~/.undodir/
set undofile

" Make vim background transparent, gets rid of tearing in tmux
autocmd BufEnter * highlight Normal guibg=0
