" getset templates
let s:phpgetset_getterTemplate = 
    \ "\n" .
    \ "/**\n" .
    \ " * Get %varname%.\n" .
    \ " *\n" .
    \ " * @return %varname%.\n" .
    \ " */\n" .
    \ "public function %funcname%()\n" .
    \ "{\n" .
    \ "    return $this->%varname%;\n" .
    \ "}"

let s:phpgetset_setterTemplate = 
  \ "\n" .
  \ "/**\n" .
  \ " * Set %varname%.\n" .
  \ " *\n" .
  \ " * @param %varname% the value to set.\n" . 
  \ " */\n" .
  \ "public function %funcname%($%varname%)\n" .
  \ "{\n" .
  \ "    $this->%varname% = $%varname%;\n" .
  \ "}"

" Pathogen !
let g:pathogen_disabled = []

" diable some plugins
call add(g:pathogen_disabled, 'neocompcache')
call add(g:pathogen_disabled, 'supertab')
call add(g:pathogen_disabled, 'vim-twig')
call add(g:pathogen_disabled, 'command-t')
call add(g:pathogen_disabled, 'FuzzyFinder')

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
syntax sync fromstart

" show TWIG highlighting
au BufRead,BufNewFile *.twig set syntax=htmljinja

scriptencoding utf-8
set history=1000
set spell
set pastetoggle=<F12> 

" appearance
let g:solarized_termtrans=1
let g:solarized_termcolors=16
set background=dark
color solarized

if has('statusline')
    set laststatus=2

    " Broken down into easily includeable segments
    set statusline=%<%f\ " Filename
    set statusline+=%w%h%m%r " Options
    set statusline+=%{fugitive#statusline()} " Git Hotness
    set statusline+=\ [%{&ff}/%Y] " filetype
    set statusline+=\ [%{getcwd()}] " current dir
    set statusline+=%=%-14.(%l,%c%V%)\ %p%% " Right aligned file nav info
endif

let g:ctrlp_map = '<c-t>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_max_files = 20000
let g:ctrlp_max_depth = 80
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']

" mappings
map <F7> :NERDTreeFind <CR> " Eclimd toggle project tree
map <F8> :NERDTreeToggle <CR> " Eclimd toggle project tree
map <C-B> :CtrlPBuffer
imap <C-B> <ESC>:CtrlPBuffer

inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 
map <F1> : echo "You've pressed the wrong key, right?"<CR>  
