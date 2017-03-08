" More maps for return to normal mode.
inoremap jj <Esc><Right>
inoremap jk <Esc><Right>
inoremap jJ <Esc><Right>
inoremap kk <Esc><Right>

" Insert blank line from normal mode.
nmap <CR> o<Esc>
nmap <S-Enter> 0<Esc>

" Use r to comment out a line on the fly
" use t to delete the first character of a line.
:nmap r I#<Space><Esc>
:nmap t I<Delete><Delete><Esc>

" Use tab in normal mode to indent a line one tab.
" Shift tab to unindent a line.
:nmap <Tab> I<Tab><Esc>
:nmap <S-Tab> 0i<Delete><delete><Delete><Delete><Esc>

" Fix background color
set t_ut=

" Tabbed file browsing
map <C-t><up> :tabr<cr>
map <C-t><down> :tabl<cr>
map <C-t><left> :tabp<cr>
map <C-t><right> :tabn<cr>

" Fixing tabs
set tabstop=4
set expandtab
set shiftwidth=4

" Show line numbers
set number

" Turn on wordwarp for markdown
:set wrap
:set linebreak

" Show tab and trailing whitespace characters
set listchars=tab:>-,trail:-
set list!

" write the file when you accidentally opened it without the right (root)
cmap w!! w !sudo tee % > /dev/null

" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_python_checkers = ["pyflakes"]

" dissaproval
let g:LookOfDissaprovalTabTreshold=2

" set the colorscheme.  
" srcery was modded to have an ice blue instead of the red
color srceryModded

" Function for stripping whitespice at end of lines and removing tab chars.
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

" Setting for markdown preview
let vim_markdown_preview_github=1

" Syntastic settings
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] }
noremap <C-w>e :SyntasticCheck<CR>
noremap <C-w>f :SyntasticToggleMode<CR>

" Ctrl-w + e shall enable checking
" Ctrl-w + f shall disable checking
"
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
Plug 'davidhalter/jedi-vim'                                " Python auto completion
Plug 'dodie/vim-disapprove-deep-indentation'               " Don't indent far!

call plug#end()
