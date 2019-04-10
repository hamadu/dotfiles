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

Plug 'thinca/vim-quickrun'

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
let g:syntastic_rust_checkers = ['rustc']

" Unite
noremap <C-U><C-F> :Unite -buffer-name=file file<CR>
noremap <C-U><C-R> :Unite file_mru<CR>

function! BuildSingleRustFile()
        let path = expand('%:p')
        let file = expand('%:t')
        let command = '!rustc -o ' . file . '.out -O ' . path
        execute command
        redraw!
endfunction

function! RunSingleRustFile()
        call BuildSingleRustFile()
        let file = expand('%:t')
        let command = './' . file . '.out'
        execute command
endfunction

function! GetProblemId()
        let name = expand('%:t')
        let pos = match(name, '\.')
        return strpart(name, 0, pos)
endfunction

function! GetContestId()
        let path = tolower(expand('%:p'))
        let elements = split(path, '/')
        return elements[-2]
endfunction

function! GetProblemUrl()
        let path = tolower(expand('%:p'))
        let elements = split(path, '/')
        let contest = elements[-2]
        let problemId = GetProblemId()
        if match(path, 'atcoder') != -1
                " ex: https://atcoder.jp/contests/agc032/tasks/agc032_a
                return 'https://atcoder.jp/contests/' . contest . '/tasks/' . contest . '_' . problemId
        elseif match(path, 'codeforces') != -1
                " ex: https://codeforces.com/contest/1144/problem/A
                return 'https://codeforces.com/contest/' . contest . '/problem/' . toupper(problemId)
        elseif match(path, 'topcoder') != -1
                return ''
        endif
endfunction

function! TestSolution()
        call BuildSingleRustFile()
        let firstLine = getline(1)
        let url = trim(strpart(firstLine, match(firstLine, 'http')))

        let contestId = GetContestId()
        let problemId = GetProblemId()
        echo contestId
        echo problemId

        let command = '!oj download -d test/' . contestId  . ' -f ' . problemId . '-sample-\%i.\%e ' . url
        echo command
        execute command

        let name = expand('%:t')
        let command = '!oj test -c ./' . name . '.out test/' . contestId . '/' . problemId . '-*'
        execute command
endfunction

function! SubmitSolution()
        let firstLine = getline(1)
        let url = trim(strpart(firstLine, match(firstLine, 'http')))
        let command = '!oj submit '. url . ' ' . expand('%p')
        execute command
endfunction

function! CreateSolution(url, ...)
        let url = a:url
        let ext = get(a:, 1, 'rs')
        let elements = split(url, '/')
        let filename = ''
        if match(url, 'atcoder.jp') != -1
                " ex: https://atcoder.jp/contests/agc032/tasks/agc032_a
                let problemName = elements[-1]
                let contestName = elements[-3]
                " ex: atcoder/agc032/agc032_a
                let path = 'src/atcoder/' . contestName
                let filename = problemName . '.' . ext
        elseif match(url, 'codeforces.com') != -1
        elseif match(url, 'topcoder.com') != -1
        end

        call mkdir(path, 'p')

        let filepath = path . '/' . filename
        execute 'silent! touch ' . filepath
        redraw!
        set splitright
        execute 'vne ' . filepath
        execute 'normal i' . '// ' . url . "\n"
        execute 'r ' . 'templates/' . ext
endfunction


command! Build call BuildSingleRustFile()
command! Run call RunSingleRustFile()
command! Test call TestSolution()
command! Submit call SubmitSolution()
command! GetUrl call GetProblemUrl()
command! -nargs=* Solution call CreateSolution(<f-args>)

