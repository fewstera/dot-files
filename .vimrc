 "  Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if has('nvim')
     nmap <BS> <C-W>h
 endif

"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/Users/fewsta03/.dein/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/Users/fewsta03/.dein')

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

call dein#add('scrooloose/nerdtree')
call dein#add('christoomey/vim-tmux-navigator')
call dein#add('Lokaltog/vim-easymotion')
call dein#add('altercation/vim-colors-solarized')
call dein#add('terryma/vim-multiple-cursors')
call dein#add('Valloric/YouCompleteMe')
call dein#add('jlanzarotta/bufexplorer')
call dein#add('bling/vim-airline')
call dein#add('kien/ctrlp.vim')
call dein#add('rking/ag.vim')
call dein#add('scrooloose/nerdcommenter')
call dein#add('vim-scripts/JavaScript-Indent')
call dein#add('marijnh/tern_for_vim')
call dein#add('gorkunov/smartpairs.vim')
call dein#add('Raimondi/delimitMate')
call dein#add('vim-gitgutter')
call dein#add('mattn/emmet-vim')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('dkprice/vim-easygrep')
call dein#add('mustache/vim-mustache-handlebars')
call dein#add('tpope/vim-surround')
call dein#add('ntpeters/vim-better-whitespace')
call dein#add('pangloss/vim-javascript')
call dein#add('jelera/vim-javascript-syntax', {'lazy': 1, 'autoload':{'filetypes':['javascript']}})

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

filetype plugin indent on
syntax enable
set number
set background=dark
set backspace=indent,eol,start
set tabstop=4
set nohlsearch
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set regexpengine=1
set completeopt-=preview

let delimitMate_expand_cr = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:ycm_add_preview_to_completeopt = 0

colorscheme solarized
map <C-t> :NERDTreeToggle<CR>
let mapleader = "\<Space>"
map <Leader> <Plug>(easymotion-prefix)
nnoremap <silent> <Leader>p :BufExplorer<CR>

"filetype plugin on
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*,*/dist/*,*/content/*,*/compiled/*
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:airline_theme = "badwolf"
"let g:airline_powerline_fonts = 1

let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=8

nnoremap <silent><leader>n :set rnu! rnu? <cr>


" Add vim undo history
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000
