set encoding=utf-8
scriptencoding utf-8
syntax enable

" tab,indent
set expandtab
set autoindent
set smartindent

" search
set incsearch
set ignorecase
set smartcase
set hlsearch

" cursor
set whichwrap=b,s,h,l,<,>,[,],~
set number
set cursorline
set showmatch

" menu
set wildmenu

" backspace
set backspace=indent,eol,start

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-github-dashboard'
Plug 'w0ng/vim-hybrid'

Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'Shougo/unite.vim'
Plug 'Shougo/neomru.vim'

Plug 'fatih/vim-go'
Plug 'rust-lang/rust.vim'

Plug 'itchyny/lightline.vim'

Plug 'bronson/vim-trailing-whitespace'
Plug 'Yggdroot/indentLine'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'
Plug 'suy/vim-ctrlp-commandline'

Plug 'Shougo/neocomplete.vim'
Plug 'Shougo/neosnippet'
Plug 'Shougo/neosnippet-snippets'

Plug 'scrooloose/syntastic'

call plug#end()

" hybrid
set background=dark
colorscheme hybrid

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_types = ['fil']
let g:ctrlp_extensions = ['funky', 'commandline']

" nerdtree
" autocmd vimenter * NERDTree
map <C-n> :NERDTreeToggle<CR>

" newcomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#min_keyword_length = 3
let g:neocomplete#enable_auto_delimiter = 1

" syntastic
let g:syntastic_enable_signs = 1

" languages
let g:rustfmt_autosave = 1

" Unite
noremap <C-U><C-F> :Unite -buffer-name=file file<CR>
noremap <C-U><C-R> :Unite file_mru<CR>
