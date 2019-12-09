let g:loaded_python3_provider = 1

 "  Note: Skip initialization for vim-tiny or vim-small.
 if !1 | finish | endif

 if has('nvim')
     nmap <BS> <C-W>h
 endif

if &compatible
  set nocompatible               " Be iMproved
endif

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'scrooloose/nerdtree'
Plugin 'airblade/vim-gitgutter'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'altercation/vim-colors-solarized'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'Valloric/YouCompleteMe'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'vim-scripts/JavaScript-Indent'
" Plugin 'marijnh/tern_for_vim'
Plugin 'gorkunov/smartpairs.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'mattn/emmet-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'dkprice/vim-easygrep'
Plugin 'mustache/vim-mustache-handlebars'
Plugin 'tpope/vim-surround'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'pangloss/vim-javascript'
Plugin 'tpope/vim-fugitive'
Plugin 'mxw/vim-jsx'
Plugin 'HerringtonDarkholme/yats.vim'
Plugin 'hashivim/vim-terraform'
Plugin 'fatih/vim-go'
Plugin 'xolox/vim-misc'
"Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'
"Plugin 'hotoo/jsgf.vim'
Plugin 'tmux-plugins/vim-tmux-focus-events'
"Plugin 'jelera/vim-javascript-syntax'
Plugin 'justinmk/vim-sneak'
Plugin 'martinda/Jenkinsfile-vim-syntax'

call vundle#end()
filetype plugin indent on
syntax enable

set number
set background=dark
set backspace=indent,eol,start
set nohlsearch
set expandtab
set autoindent
set smartindent
"set regexpengine=1
set completeopt-=preview
function! SetTabWidth(width)
    let &tabstop=a:width
    let &softtabstop=a:width
    let &shiftwidth=a:width
endfunction
call SetTabWidth(2)
autocmd filetype make setlocal noexpandtab

let delimitMate_expand_cr = 1
let g:delimitMate_expand_cr = 1
let g:delimitMate_expand_space = 1
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.'],
  \   'objc' : ['->', '.'],
  \   'cpp,objcpp' : ['->', '.', '::'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,d,vim,ruby,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }

colorscheme solarized

let mapleader = "\<Space>"
map <Leader><Leader> <Plug>(easymotion-prefix)
nnoremap <silent> <Leader>p :BufExplorer<CR>
nnoremap <Leader>n :NERDTreeToggle<CR>

"filetype plugin on
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/node_modules/*,*/bower_components/*,*/dist/*,*/content/*,*/compiled/*
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|built'

let g:airline_theme = "badwolf"
let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1

let g:gitgutter_override_sign_column_highlight = 0
highlight SignColumn ctermbg=8

set rnu!
nnoremap <silent><leader><leader>n :set rnu! rnu? <cr>

" Add vim undo history
set undofile
set undodir=$HOME/.vim/undo

set undolevels=1000
set undoreload=10000
" Fix journostack
set nofsync

" See .spv as php files
au BufRead,BufNewFile *.spv set syntax=php
au BufRead,BufNewFile *.conf set ft=nginx

let g:jsx_ext_required = 0

" Enable mouse support
if has('mouse') | set mouse=a | endif

" Tags
set autochdir
set tags=tags;

" Make Ag work from root
let g:ag_working_path_mode="r"

set autoread
au CursorHold * checktime
au FocusGained * :checktime

" Move lines
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Spelling checking for md files
autocmd BufRead,BufNewFile *.md setlocal spell spelllang=en_gb

set autowrite
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"

autocmd FileType go nmap <leader>t  <Plug>(go-test)
autocmd FileType go nmap <leader>r  <Plug>(go-run)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go nmap <Leader>cv <Plug>(go-coverage-toggle)
:
nnoremap <leader>a :cclose<CR>

" run :GoBuild or :GoTestCompile based on the go file
function! s:build_go_files()
  let l:file = expand('%')
  if l:file =~# '^\f\+_test\.go$'
    call go#test#Test(0, 1)
  elseif l:file =~# '^\f\+\.go$'
    call go#cmd#Build(0)
  endif
endfunction

autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>
map <Leader><C-n> :cnext<CR>
map <Leader><C-m> :cprevious<CR>
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
map <Leader><C-p> :GoDecls<CR>

set foldmethod=syntax
set foldcolumn=0
augroup javascript_folding
    au!
    au FileType javascript setlocal foldmethod=syntax
augroup END
set foldlevelstart=99

" Map // to search current v selection
vnoremap // y/\V<C-r>=escape(@",'/\')<CR><CR>

let g:terraform_fmt_on_save=1

" Setup easy-grep
let g:EasyGrepOpenWindowOnMatch=0
let g:EasyGrepReplaceWindowMode=2
let g:EasyGrepRecursive=1
let g:EasyGrepRoot="search:.git,.svn"

