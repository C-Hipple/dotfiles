inoremap jj <Esc><Right>
inoremap jk <Esc><Right>
inoremap jJ <Esc><Right>
inoremap kk <Esc><Right>

nmap <CR> o<Esc>
nmap <S-Enter> 0<Esc>

" Use r to comment out a line on the fly
" use t to delete the first character of a line.

:nmap r I#<Space><Esc>
:nmap t I<Delete><Delete><Esc>

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

"Highlight Chracters that are beyond the 80th column
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

let vim_markdown_preview_github=1

"Plugins"

call plug#begin('~/.vim/plugged')

Plug 'scrooloose/syntastic'                                " Syntax Checking
Plug 'tpope/vim-fugitive'                                  " git rapper
Plug 'tpope/vim-sensible'                                  " sensible defaults
Plug 'jalvesaq/Nvim-R',                                    " R Plugin
Plug 'ivanov/vim-ipython',                                 " Vim + IPython Notebook integration
Plug 'tpope/vim-pathogen'                                  " install halp
Plug 'nvie/vim-flake8'                                     " python pep8 checker
Plug 'JamshedVesuna/vim-markdown-preview'                  " markdown preview

call plug#end()
