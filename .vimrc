 "  Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if has('nvim')
     nmap <BS> <C-W>h
 endif

 if has('vim_starting')
   if &compatible
     set nocompatible               " Be iMproved
   endif

   " Required:
   set runtimepath+=~/.vim/bundle/neobundle.vim/
 endif

 " Required:
 call neobundle#begin(expand('~/.vim/bundle/'))

 " Let NeoBundle manage NeoBundle
 " Required:
 NeoBundleFetch 'Shougo/neobundle.vim'

 " My Bundles here:
 " Refer to |:NeoBundle-examples|.
 " Note: You don't set neobundle setting in .gvimrc!
 NeoBundle 'scrooloose/nerdtree'
 NeoBundle 'christoomey/vim-tmux-navigator'
 NeoBundle 'Lokaltog/vim-easymotion'
 NeoBundle 'altercation/vim-colors-solarized'
 NeoBundle 'terryma/vim-multiple-cursors'
 NeoBundle 'Valloric/YouCompleteMe'
 NeoBundle 'jlanzarotta/bufexplorer'
 NeoBundle 'bling/vim-airline'
 NeoBundle 'kien/ctrlp.vim'
 NeoBundle 'mileszs/ack.vim'
 NeoBundle 'scrooloose/nerdcommenter'
 NeoBundle 'vim-scripts/JavaScript-Indent'
 NeoBundle 'marijnh/tern_for_vim'
 NeoBundle 'gorkunov/smartpairs.vim'
 NeoBundle 'Raimondi/delimitMate'
 NeoBundle 'pangloss/vim-javascript'
 NeoBundle 'vim-gitgutter'
 NeoBundleLazy 'jelera/vim-javascript-syntax', {'autoload':{'filetypes':['javascript']}}

 call neobundle#end()

 " Required:
 filetype plugin indent on

 " If there are uninstalled bundles found on startup,
 " this will conveniently prompt you to install them.
 NeoBundleCheck

syntax enable
set number
set background=dark
set backspace=indent,eol,start
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set regexpengine=1
let delimitMate_expand_cr = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1

colorscheme solarized
map <C-t> :NERDTreeToggle<CR>
let mapleader = ","
map <Leader> <Plug>(easymotion-prefix)

"filetype plugin on
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'
let g:airline_theme = "badwolf"
"let g:airline_powerline_fonts = 1

let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=8
