inoremap jj <Esc><Right>
inoremap jk <Esc><Right>

inoremap pp (
inoremap cc )
inoremap uu _

" Fix background color
set t_ut=

" Fixing tabs
set tabstop=4
set expandtab
set shiftwidth=4

" Show line numbers
set number

" Show tab and trailing whitespace characters
set listchars=tab:>-,trail:-
set list!

color desert

function! StripTabsAndTrailingWhitespaces()
  let _s=@/
  retab
  %s/\s\+$//e
  let @/=_s
  exec "normal ``"
endfunction

nnoremap <Leader>w :call StripTabsAndTrailingWhitespaces()<CR>:w<CR>

"Incremental Search and Highlighting Results"
set incsearch
set hlsearch

"Plugins"

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'                 "Syntax Checking
Plug 'tpope/vim-fugitive'                   "git rapper
Plug 'tpope/vim-sensible'                   "sensible defaults
call plug#end()
