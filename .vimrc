set nocompatible

execute pathogen#infect()
autocmd StdinReadPre * let s:std_in=1

filetype plugin indent on
syntax on

autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" custom escape and file system toggling
:imap kj <ESC>
map <C-n> :NERDTreeToggle<CR>

" indentation
set tabstop=2
set shiftwidth=2
set expandtab "use spaces, not tabs

"Search
set hlsearch    " highlight matches
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

"Copying to clipboard (Ctrl + c):
map <C-c> y:e ~/clipsongzboard<CR>P:w !pbcopy<CR><CR>:bdelete!<CR>
