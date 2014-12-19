set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
let g:vundle_default_git_proto = 'git'
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips/""
"let g:UltiSnipsExpandTrigger = '<s-tab>'
"let g:UltiSnipsListSnippets = '<F6>'
let g:syntastic_php_checkers=['php', 'phpmd']

call vundle#rc()

" =============================== "
" ======== Vundle Config ======== "

" Disabled but interesting ...
"Bundle 'Shougo/neocomplcache'
"Bundle 'Shougo/neosnippet'
"Bundle 'Shougo/unite.vim'
"Bundle 'tsukkee/unite-tag'
"Bundle 'tpope/vim-surround'

" Utility bundles
Bundle 'L9'
Bundle 'vim-scripts/tlib'
Bundle 'Shougo/vimproc.vim'

" Easy motion - <Leader>ww = forward, <Leader>bb = backwards
Bundle 'Lokaltog/vim-easymotion'

" Best snippets plugin
Bundle 'MarcWeber/ultisnips'

" Package manager
Bundle 'gmarik/vundle'

" Ctrlp - quickly find files, tags and buffers using fuzzy search
Bundle 'kien/ctrlp.vim'

" Twig syntax highlighting
Bundle 'evidens/vim-twig'

" Tag bar shows methods and variables of current class (uses ctags)
Bundle 'majutsushi/tagbar'

" Better javascript support
Bundle 'pangloss/vim-javascript'

" Nerdtree file browser
Bundle 'scrooloose/nerdtree'

" Easily comment - <Leader>cc
Bundle 'scrooloose/nerdcommenter'

" Syntax checking on write
Bundle 'scrooloose/syntastic'

" Powerful PHP completion (uses ctags)
Bundle 'shawncplus/phpcomplete.vim'

" Allows text replacement regardless of CaSe
Bundle 'tpope/vim-abolish'

" GiT integration: Gblame, Gread (reset to git state), Gstatus
Bundle 'tpope/vim-fugitive'

" Automatically insert use statements and expand class names to FQN
Bundle 'arnaud-lb/vim-php-namespace'

" Align anything
Bundle 'junegunn/vim-easy-align'

" Get GITHub activity
Bundle 'junegunn/vim-github-dashboard'

" PHP Documentation - hit K (shift-k) on any php function
Bundle 'mudpile45/vim-phpdoc'

" Apply a command on every file in the quickfix list :Qdo %s/Foobar/Barfoo
Bundle 'henrik/vim-qargs'

" Correct indentation .. maybe
Bundle '2072/PHP-Indenting-for-VIm.git'

" Behat plugin
Bundle 'veloce/vim-behat.git'

" =============================== "
" =========== Config ============ "

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

" Automatically write file for some commands, like cfile
set autowrite

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

hi StatusLine ctermbg=grey ctermfg=black

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
let g:phpcomplete_complete_for_unknown_classes = 0

" Settings for rst / markdown
autocmd FileType rst setlocal textwidth=78
autocmd Filetype markdown setlocal textwidth=78

" =============================== "
" ===== Keyboard Mappings ======= "

" Use "," as the <Leader> key
let mapleader=","

" Toggle NERDTree file browser
map <Leader>n :NERDTreeToggle <CR>

" Open current file in NERDTree
map <Leader>f :NERDTreeFind <CR> 

" Tagbar shows list of all methods and variables in class
map <Leader>t :TagbarToggle <CR> 

" Automatically add a use statement for class under cursor (uses ctags)
map <Leader>u :call PhpInsertUse()<CR>

" Expand the class under the cursor (uses ctags)
map <Leader>e :call PhpExpandClass()<CR>

" Fuzzy search open buffers
map <C-B> :CtrlPBuffer <CR>
" Fuzzy search tags
map <C-T> :CtrlPTag <CR>
" Fuzzy search all project filenames
map <C-P> :CtrlP <CR>

" map <C-p> :Unite file_rec/async<cr>
" map <C-b> :Unite buffer <cr>
" map <C-t> :Unite tag <cr>
" map <Leader>g :Unite grep:.<cr>

" Update ctags
map <Leader>cp :!ctags --verbose <CR>

" Reload the .vimrc config
map <Leader>vr :so ~/.vimrc<CR>

" Edit .vimrc
map <Leader>ve :tabnew ~/.vim/.vimrc<CR>

" Next quick fix item
map <Leader>= :cnext<CR>

" Previous quick fix item
map <Leader>- :cprev<CR>

" Show EOLs
map <Leader>w :set list!<CR>

" Move up and down by lines of 10
map J 10j
map K 10k

" Remap the K (contextual help) command to F5
map <F5> K
