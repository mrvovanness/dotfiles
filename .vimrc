set nocompatible

execute pathogen#infect('bundle/{}')
autocmd StdinReadPre * let sstd_in=1

filetype plugin indent on
syntax on
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
set autoindent

" don't use saving global option in session
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

" rails integration
let g:rubycomplete_rails = 1
let g:rubycomplete_load_gemfile = 1

" ruby compiler
autocmd FileType ruby compiler ruby

" movement between windows
nmap <C-J> <C-W>j<C-W>_
nmap <C-K> <C-W>k<C-W>_
nmap <C-L> <C-W>l<C-W>_
nmap <C-H> <C-W>h<C-W>_
set wmh=0 "minimaze inactive window

" movements in insert mode
imap <C-J> <C-O>j
imap <C-K> <C-O>k

" Change vertical/horizontal split and vise versa
nmap <C-N> <C-W>t<C-W>K
nmap <C-P> <C-W>t<C-W>H

"quick setting of window size
nmap - <C-W>-
nmap + <C-W>+
nmap ( <C-W><
nmap ) <C-W>>
nmap = <C-W>=

" indentation
set tabstop=2
set shiftwidth=2
set expandtab "use spaces, not tabs

" Mouse
set mouse+=a
" Fix tmux mouse behaviour
if &term=~ '^screen'
  " tmus know the extended mouse mode
  set ttymouse=xterm2
endif

" Copy/paste selection from/in clipboard
map <C-c> "+y
map <C-b> "+p

" Search
set incsearch  " incremental searching
set ignorecase " searches are case insensitive...
set smartcase  " ... unless they contain at least one capital letter

" For Emacs-style editing on the command-line
"start of line
cnoremap <C-A>	<Home>
"back one character
cnoremap <C-B>	<Left>
"delete character under cursor
cnoremap <C-D>	<Del>
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

set tags=./tags;

" Highlight whitespaces
highlight ExtraWhitespace ctermbg=30
match ExtraWhitespace /\s\+$/

" Change vertical and horizontal borders
set fillchars=vert:\ 
highlight VertSplit ctermfg=grey
highlight StatusLine ctermfg=30
set t_Co=256

" syntastic config
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {"mode": "passive"}
map <leader>c :SyntasticCheck<CR>
map <leader>r :SyntasticReset<CR>

" indenation lines
let g:indentLine_color_term = 239
