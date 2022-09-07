"Remove trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

"Adding newline at end of file is default for vim

"Set default tab width to 4
set tabstop=4
set shiftwidth=4
set softtabstop=4
"Expand tabs to spaces
set expandtab

"Show ruler at 100 character limit (change as needed)
set colorcolumn=100

set nocompatible              " be iMproved
set t_Co=256                  " 256 colors

set encoding=utf-8
set fileencoding=utf-8

filetype off                        " Required to bootstrap Vundle
set rtp+=~/.vim/bundle/Vundle.vim/  " Vundle runtime dir
call vundle#begin()                 " BEGIN Vundle config

Plugin 'gmarik/Vundle.vim'                  " let Vundle manage Vundle
Plugin 'tpope/vim-fugitive'                 " git integration
Plugin 'scrooloose/syntastic'               " syntax check
Plugin 'bling/vim-airline'                  " Status line
Plugin 'altercation/vim-colors-solarized'   " Solarized
Plugin 'majutsushi/tagbar'                  " Class - File structure
Plugin 'jmcantrell/vim-virtualenv'          " Virtual env
Plugin 'MartinBrugnara/vim-golang'          " Go
Plugin 'leafgarland/typescript-vim'
Plugin 'tomasr/molokai'
Plugin 'Lokaltog/powerline'

call vundle#end()                   " END Bundle config. (required)
filetype on
filetype plugin on
filetype plugin indent on           " (required)

" 'Interface'
set title               " set window title = filename

syntax on
colorscheme molokai " theme
set background=dark

set number
set ruler
let &colorcolumn="80,120"   " Show coding limits
" set cursorline              " highlight current row

if has('mouse')
    "set mouse=a
    "set mousemodel=extend
    set mouse=
endif

set laststatus=2		" always show the status line
set ttimeoutlen=50		" fix status bar lag when leaving insert mode

set nowrap              " (only visual) (do not) wrap lines when out of screen
set textwidth=0         " return when column > textwidth. (really format text)
set scrolloff=3         " min # of lines to keep above and below the cursor
set linebreak           " (only visual) \n @ [^a-z0-9]

set spell               " spell checking (mv ']s' '[s', add 'zg', fix 'z=')
set wildmenu            " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.


" Editing
set backspace=indent,eol,start  " Let backspace work over lines.

set tabstop=4           " <tab> width in 'spaces'
set shiftwidth=4        " indentation per level (in 'spaces')
set softtabstop=4       " use tabs + spaces to 'align' (for us all is spaces)
set expandtab           " use space instead of tab
set shiftround          " Round indent to multiple of 'shiftwidth'

set smartcase
set smartindent
set autoindent          " on paste.
" do not (out)indent lines starting by #
inoremap # #

set incsearch           " While typing, the matched string is highlighted.
set hlsearch            " highlight searched items.
set ignorecase          " do case insensitive search

let loaded_matchparen = 1
set showmatch           " highlight corresponding bracket.
set matchtime=2         " how log show match in x/10 seconds.
set matchpairs+=<:>     " The |%| command jumps from one to the other
"set NoMatchParen

set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level (marker, manual, expr, syntax, diff)


" Support files
set nobackup            " Do not save editing copies
set writebackup         " While editing keep an old copy
set swapfile            " Use swap (useful for big files).

" Speed
set lazyredraw          " do not redraw while executing macros (speed)

" Tweak specific file format
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype php setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype css setlocal ts=2 sts=2 sw=2
autocmd FileType make setlocal noexpandtab
autocmd FileType text setlocal wrap linebreak nolist textwidth=0 wrapmargin=0 formatoptions+=1
autocmd BufNewFile,BufRead *.tex set wrap linebreak nolist textwidth=0 wrapmargin=0 formatoptions+=1

au BufRead,BufNewFile *.txt set filetype=text       " txt
au Bufread,BufNewFile *.md set filetype=markdown    " know markdown
au BufRead,BufNewFile *.go set filetype=go          " know go
" au BufRead,BufNewFile *.ts set filetype=typescript
au BufRead,BufNewFile *.js set filetype=javascript
au BufRead,BufNewFile *.py set filetype=python


set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
set term=xterm-256color
set termencoding=utf-8

if has("gui_running")
   let s:uname = system("uname")
   if s:uname == "Darwin\n"
      set guifont=Inconsolata\ for\ Powerline:h15
   endif
endif

let g:airline_powerline_fonts = 1
let g:syntastic_check_on_open = 1
let g:syntastic_c_compiler="clang"          " Use clang as default
let g:syntastic_c_compiler_options="-std=c99 -pedantic"
let g:syntastic_cpp_compiler="clang++"      " Use clang as default
let g:syntastic_cpp_compiler_options="-std=c++11 -stdlib=libc++ -pedantic"
let g:syntastic_tex_checkers=['chktex']

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'

" strips trailing whitespace at the end of files. this
" is called on buffer write in the autogroup above.
function! StripTrailingWhitespaces()
    " save last search & cursor position
    let _s=@/
    let l = line(".")
    let c = col(".")
    %s/\s\+$//e
    let @/=_s
    call cursor(l, c)
endfunction

" Auto commands
augroup configgroup
    autocmd!
    autocmd VimEnter * highlight clear SignColumn
    autocmd FileType java setlocal noexpandtab
    autocmd FileType java setlocal list
    autocmd FileType java setlocal listchars=tab:+\ ,eol:-
    autocmd FileType java setlocal formatprg=par\ -w80\ -T4
    autocmd FileType php setlocal expandtab
    autocmd FileType php setlocal list
    autocmd FileType php setlocal listchars=tab:+\ ,eol:-
    autocmd FileType php setlocal formatprg=par\ -w80\ -T4
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd FileType ruby setlocal commentstring=#\ %s
    autocmd FileType python setlocal commentstring=#\ %s
    autocmd BufEnter *.cls setlocal filetype=java
    autocmd BufEnter *.zsh-theme setlocal filetype=zsh
    autocmd BufEnter Makefile setlocal noexpandtab
    autocmd BufEnter *.sh setlocal tabstop=2
    autocmd BufEnter *.sh setlocal shiftwidth=2
    autocmd BufEnter *.sh setlocal softtabstop=2
augroup END



" Fix import files. Requires golang.org/x/tools/cmd/goimports
let g:gofmt_command = "goimports"
" Fix fmt. Requires gofmt
au FileType go au BufWritepre <buffer> Fmt  " Go - format on save

let ts_blacklist = ['md', 'markdown']
" Strip white space
autocmd BufWritePre * if index(ts_blacklist, &ft) < 0 | :%s/\s\+$//e
autocmd BufNewFile,BufRead *.tex set makeprg=pdflatex\ %\ &&\ open\ %:r.pdf

" Shortcut
nmap <F8> :TagbarToggle<CR>

