set nocompatible              " be iMproved
filetype off                  " required!
set t_Co=256                  " 256 colors

set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/Vundle.vim'

set encoding=utf-8
set fileencoding=utf-8

" git integration
Bundle 'tpope/vim-fugitive'

" syntax check
Bundle 'scrooloose/syntastic'

" Stauts line
Plugin 'bling/vim-airline'


set background=dark
colorscheme jellybeans

filetype on
filetype plugin on
filetype plugin indent on     " required!

" Additional stuff
sy on
set number
set laststatus=2		" always show the status line
set ttimeoutlen=50		" fix status bar lag when leaving insert mode
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set shiftround
set matchpairs+=<:>
set ai
set si
set smartcase
set incsearch
set hlsearch
set backspace=indent,eol,start
set title
set scrolloff=3
set nowrap
set linebreak

" like  a pro
" spell checking
set spell 
" Use ']s' and '[s' to move between mistakes, 
" 'zg' adds to the dictionary, 'z=' suggests correctly spelled words

set ruler
let &colorcolumn="80,120"

" do not outdent #
inoremap # #

" file specific mods
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype php setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2

" c
let g:syntastic_c_compiler="clang"
" c++
let g:syntastic_cpp_compiler="clang++"
let g:syntastic_cpp_compiler_options="-std=c++11 -stdlib=libc++"
