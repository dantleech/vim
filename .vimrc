let mapleader=","

" Pathogen !
let g:pathogen_disabled = []

" bootstrap
call pathogen#infect()

" Automatically detect filetypes
filetype plugin indent on

" Indentation
set autoindent
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

" show lines numbers
set number

" enable real-time searching
set incsearch

" highlight search matches
set hlsearch

" set syntax highlighting options.
syntax on
let c_space_errors = 1
let php_sql_query = 1
let php_sync_method = 0
let php_folding=0
let g:DisableAutoPHPFolding = 1

" show TWIG highlighting
" au BufRead,BufNewFile *.twig set syntax=htmljinja

scriptencoding utf-8
set history=1000
set spell
set pastetoggle=<F12> 

" Eclim
"
map <F7> :ProjectTreeToggle <CR> 
map <F9> :TagbarToggle <CR> 
map <C-B> :LocateBuffer <CR>
map <C-T> :LocateFile <CR>

nnoremap <silent> <buffer> <cr> :PhpSearchContext<cr>
let g:EclimProjectTreeExpandPathOnOpen=1
let g:EclimProjectTreeActions = [
    \ {'pattern': '.*', 'name': 'Edit', 'action': 'edit'},
    \ {'pattern': '.*', 'name': 'Tab', 'action': 'tabnew'},
    \ {'pattern': '.*', 'name': 'Split', 'action': 'split'},
  \ ]
let g:EclimProjectKeepLocalHistory = 1
