set nocompatible

" Pathogen
" let g:pathogen_disabled = []
execute pathogen#infect('bundle/{}')

" Nerdtree
autocmd StdinReadPre * let sstd_in=1 " open Nerdtree if no files were specified

filetype plugin indent on
syntax on

" indentation
set tabstop=2
set shiftwidth=2
set expandtab "use spaces, not tabs

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

" set leaderkey and fast edit of vimrc
let mapleader =","
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" keep silence
set visualbell
set noerrorbells

" custom escape and file system toggling
imap kj <ESC>
nmap <C-F> :NERDTreeToggle<CR>

" ruby ommi completion
imap <C-S> <C-X><C-O>

" ruby compiler
autocmd FileType ruby compiler ruby

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

" For Emacs-style editing on the command-line
"start of line
cnoremap <C-A>	<Home>
"end of line
cnoremap <C-E>	<End>
"forward one character
cnoremap <C-F>	<Right>
"recall newer command-line
cnoremap <C-N>	<Down>
"recall previous (older) command-line
cnoremap <C-P>	<Up>
"back one word
cnoremap <Esc><C-B> <S-Left>
"forward one word
cnoremap <Esc><C-F> <S-Right>


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

" Status line
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_theme='simple'

" Reduce ESC delay
set timeoutlen=1000 ttimeoutlen=0
