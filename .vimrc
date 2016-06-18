set nocompatible
let mapleader =","
filetype plugin indent on
syntax on

" indentation
set tabstop=2
set shiftwidth=2
set expandtab "use spaces, not tabs

" plug

call plug#begin('~/.vim/plugged')
"common
Plug 'tpope/vim-surround'
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }

"fuzzy search
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

"ruby
Plug 'vim-ruby/vim-ruby', { 'for': 'ruby' }
Plug 'tpope/vim-rails', { 'for': 'ruby' }
Plug 'slim-template/vim-slim', { 'for': 'slim' }
Plug 'bruno-/vim-ruby-fold', { 'for': 'ruby' }

"js
Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }
Plug 'pangloss/vim-javascript', { 'for': 'javascript' }
Plug 'digitaltoad/vim-pug', { 'for': 'pug' }
call plug#end()

" Nerdtree
autocmd StdinReadPre * let sstd_in=1 " open Nerdtree if no files were specified
nmap <C-F> :NERDTreeToggle<CR>
nmap <leader>f :NERDTreeFind<CR>


" Remember the line when reopen a file
" This is an auto command that looks for
" line numbers of the evaluated expressions.
" The g command jumps to the last position if
" it was recorded. Using :help commands for BufReadPost,
" line() and g` will explain the details of how this works
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" don't use saving global option in session (:mksession)
set sessionoptions-=options

" no swapfile
set nobackup
set noswapfile

" hides buffers instead of closing them
set hidden

" edit config
command! Econf :edit $MYVIMRC

" keep silence
set visualbell
set noerrorbells

" movement between windows
nmap <C-J> <C-W>j
nmap <C-K> <C-W>k
nmap <C-L> <C-W>l
nmap <C-H> <C-W>h

" movements in insert mode
imap <C-J> <C-O>j
imap <C-K> <C-O>k
imap <C-L> <C-O>l
imap <C-B> <C-O>h

" go to normal mode
imap kj <C-[>
vmap kj <C-[>

" Split opening
set splitbelow
set splitright

" Mouse
set mouse+=a

" Fix tmux mouse behaviour
if &term=~ '^screen'
  " tmux know the extended mouse mode
  set ttymouse=xterm2
endif

" Copy/paste selection from/in clipboard
set clipboard=unnamedplus

" Search
set incsearch  " incremental searching
set ignorecase " searches are case insensitive...
set smartcase  " ... unless they contain at least one capital letter

" fzf
nmap <C-p> :Files<CR>

" For Emacs-style editing on the command-line
"start of line
cnoremap <C-A>	<Home>
"end of line
cnoremap <C-E>	<End>
"back one word
cnoremap <C-B> <S-Left>
"forward one word
cnoremap <C-F> <S-Right>
"recall newer command-line
cnoremap <C-N> <Down>
"recall previous (older) command-line
cnoremap <C-P> <Up>

" Highlight whitespaces
highlight ExtraWhitespace ctermbg=30
match ExtraWhitespace /\s\+$/

" Change vertical and horizontal borders
set t_Co=256
set fillchars=vert:\ 
highlight VertSplit ctermfg=8
highlight StatusLine ctermfg=8

" indenation lines
let g:indentLine_color_term = 239

" Reduce ESC delay
set timeoutlen=1000 ttimeoutlen=0

" vertical line
highlight ColorColumn ctermbg=15

" Tab panel color
hi TabLineFill ctermfg=16 ctermbg=DarkGreen

" Folds color
highlight Folded ctermbg=8

" Ignore these directories
set wildignore+=*/tmp/*
set wildignore+=*/log/*
set wildignore+=*/node_modules/*
set wildignore+=*/bower_components/*
set wildignore+=*/vendor/*

" don't highlight background in html
let html_no_rendering = 1

" associate *.es6 with *.js
au BufRead,BufNewFile *.es6 setfiletype javascript
