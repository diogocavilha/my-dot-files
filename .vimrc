"===============================================================================
" Author : Diogo Alexsander Cavilha.
" Date   : 19/03/2012
"===============================================================================

syntax on

set nu
set et                      " spaces instead of tabs
set ts=4                    " four space tabs
set ignorecase              " ignore case when performing searches
set autoindent
set bg=dark
set fileencoding=utf-8
set wildmenu

autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd Filetype gitcommit setlocal spell textwidth=72
