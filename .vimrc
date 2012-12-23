let mapleader=","

" Pathogen !
let g:pathogen_disabled = []

" diable some plugins
call add(g:pathogen_disabled, 'vim-symfony')
" call add(g:pathogen_disabled, 'riv.vim')

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
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = ''
" let g:ctrlp_custom_ignore = '\v[\/](\.git|\.hg|\.svn|\.cache\.php|\.cache)$'
" let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files']


set wildignore+=*/.git/*,*.cache,*.cache.php,*.swp,*.swo,**/cache/**

let g:w3m#option_use_cookie = 1
let g:w3m#option_accept_cookie = 1

" Detect twig filetype
au BufNewFile,BufRead *.twig      setf htmljinja
"
" " Make sure help set properly for PHP files
autocmd FileType php set kp=:help

" mappings
map <F7> :NERDTreeFind <CR> " Eclimd toggle project tree
map <F8> :NERDTreeToggle <CR> " Eclimd toggle project tree
map <C-B> :CtrlPBuffer <CR>
map <C-D> :CtrlPTag <CR>
imap <C-B> <ESC>:CtrlPBuffer

inoremap <C-P> <ESC>:call PhpDocSingle()<CR>i
nnoremap <C-P> :call PhpDocSingle()<CR>
vnoremap <C-P> :call PhpDocRange()<CR> 
map <Leader>u :call PhpInsertUse()<CR>
map <Leader>t :TagbarToggle<CR>

map <F1> : echo "You've pressed the wrong key, right?"<CR>  

" Hide buffers
set hidden

" neocachecomplconfig
let g:neocomplcache_enable_at_startup=1

" Jump to Symfony view

" first set path
set path+=**

" jump to a twig view in symfony
function! s:SfJumpToView()
    mark C
    normal! ]M
    let end = line(".")
    normal! [m
    try
        call search('\v[^.:]+\.html\.twig', '', end)
        normal! gf
    catch
        normal! g`C
        echohl WarningMsg | echomsg "Template file not found" | echohl None
    endtry
endfunction
com! SfJumpToView call s:SfJumpToView()

" create a mapping only in a Controller file
autocmd BufEnter *Controller.php nmap <buffer><leader>v :SfJumpToView<CR>
