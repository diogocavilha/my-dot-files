set number                  " add line numbers
set autoindent              " indent a new line the same amount as the line just typed
set hlsearch                " highlight search
set showmatch               " show matching 
set ignorecase              " case insensitive
"set cursorline              " highlight current cursorline
filetype plugin indent on   "allow auto-indenting depending on file type
filetype plugin on

call plug#begin('~/.local/share/nvim/plugged')
 " Plugin Section
 Plug 'vim-airline/vim-airline'
 Plug 'dracula/vim'
 Plug 'ryanoasis/vim-devicons'
 Plug 'SirVer/ultisnips'
 Plug 'honza/vim-snippets'
 "Plug 'scrooloose/nerdtree'
 "Plug 'preservim/nerdcommenter'
 "Plug 'mhinz/vim-startify'
call plug#end()

