set nocompatible

execute pathogen#infect('bundle/{}')
autocmd StdinReadPre * let s:std_in=1

filetype plugin indent on
syntax on
autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" custom escape and file system toggling
:imap kj <ESC>
map <C-f> :NERDTreeToggle<CR>

"movement between tabs
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-L> <C-W>l<C-W>_
map <C-H> <C-W>h<C-W>_
set wmh=0 "minimaze inactive window

"quick setting of window size in vertical split
map - <C-W>-
map + <C-W>+
map ( <C-W><
map ) <C-W>>

" indentation
set tabstop=2
set shiftwidth=2
set expandtab "use spaces, not tabs

" Mouse
set mouse+=a
" Fix tmux
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
" For Emacs-style editing on the command-line:
" start of line
:cnoremap <C-A>		<Home>
" back one character
:cnoremap <C-B>		<Left>
" delete character under cursor
:cnoremap <C-D>		<Del>
" end of line
:cnoremap <C-E>		<End>
" forward one character
:cnoremap <C-F>		<Right>
" recall newer command-line
:cnoremap <C-N>		<Down>
" recall previous (older) command-line
:cnoremap <C-P>		<Up>
" back one word
:cnoremap <Esc><C-B>	<S-Left>
" forward one word
:cnoremap <Esc><C-F>	<S-Right>
set tags=./tags;

" Highlight whitespaces
:highlight ExtraWhitespace ctermbg=red
:match ExtraWhitespace /\s\+$/

" Change vertical and horizontal borders
:set fillchars+=vert:\ 
:highlight VertSplit ctermfg=grey
:highlight StatusLine ctermfg=none

