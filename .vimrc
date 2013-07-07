let mapleader=","

set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
let g:vundle_default_git_proto = 'git'
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips/""

call vundle#rc()

Bundle 'L9'
Bundle 'Lokaltog/vim-easymotion'
"Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neosnippet'
"Bundle 'Shougo/unite.vim'
"Bundle 'tsukkee/unite-tag'
Bundle 'vim-scripts/tlib'
Bundle 'Shougo/vimproc.vim'
Bundle 'MarcWeber/ultisnips'
Bundle 'gmarik/vundle'
Bundle 'kien/ctrlp.vim'
Bundle 'evidens/vim-twig'
Bundle 'majutsushi/tagbar'
Bundle 'pangloss/vim-javascript'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/syntastic'
Bundle 'sumpygump/php-documentor-vim'
Bundle 'shawncplus/phpcomplete.vim'
Bundle 'tpope/vim-abolish'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'arnaud-lb/vim-php-namespace'
Bundle 'junegunn/vim-easy-align'
Bundle 'junegunn/vim-github-dashboard'
Bundle 'mudpile45/vim-phpdoc'
"Bundle 'spf13/vim-autoclose'

" show TWIG highlighting
au BufRead,BufNewFile *.twig set syntax=htmljinja

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
set nospell
set pastetoggle=<F12> 

" status lines
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

" Ignore files
set wildignore+=*/.git/*,*.cache,*.cache.php,*.swp,*.swo,**/cache/**

" Allow hidden buffers
set hidden

" CtrlP 
let g:ctrlp_max_files = 20000
let g:ctrlp_max_depth = 80
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_working_path_mode = ''

" neocachecomplconfig
let g:neocomplcache_enable_at_startup=0

" Ultisnip
let g:snips_author="Daniel Leech <daniel@dantleech.com>"

" Only get tags from CWD
set tags=tags;
set tags+=/usr/share/php/PHPUnit/tags
let g:phpcomplete_parse_docblock_comments = 1

" Settings for rst / markdown
autocmd FileType rst setlocal textwidth=78
autocmd Filetype markdown setlocal textwidth=78

" Mappings

map <Leader>n :NERDTreeToggle <CR>
map <Leader>f :NERDTreeFind <CR> 
map <Leader>t :TagbarToggle <CR> 
map <Leader>u :call PhpInsertUse()<CR>
map <Leader>e :call PhpExpandClass()<CR>

map <C-B> :CtrlPBuffer <CR>
map <C-T> :CtrlPTag <CR>
map <C-P> :CtrlP <CR>

" map <C-p> :Unite file_rec/async<cr>
" map <C-b> :Unite buffer <cr>
" map <C-t> :Unite tag <cr>
map <Leader>g :Unite grep:.<cr>
map <Leader>cu :!ctags --verbose <CR>
map <Leader>t :TagbarToggle<CR>
map <Leader>vr :so ~/.vimrc<CR>
map <Leader>ve :tabnew ~/.vim/.vimrc<CR>
map <F1> : echo "You've pressed the wrong key, right?"<CR>  
au BufRead,BufNewFile *.php inoremap <Leader>db :call PhpDoc()<CR>
au BufRead,BufNewFile *.php nnoremap <Leader>db :call PhpDoc()<CR>
au BufRead,BufNewFile *.php vnoremap <Leader>db :call PhpDocRange()<CR>

au BufRead,BufNewFile *.xml map <Leader>xe :!xmlcopyeditor %<CR>


