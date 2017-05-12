" Plugins {{{

" required by vundle {{{

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

"}}}

" utility
Plugin 'mattn/webapi-vim'
Plugin 'wesQ3/vim-windowswap'
" git
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'mattn/gist-vim'

" searching
Plugin 'kien/ctrlp.vim'

" completion
Plugin 'ervandew/supertab'

" editing
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'

" helpers
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-projectionist'

" html
Plugin 'mattn/emmet-vim'

" clojure
Plugin 'tpope/vim-fireplace'
Plugin 'guns/vim-sexp'
Plugin 'tpope/vim-sexp-mappings-for-regular-people'
Plugin 'guns/vim-clojure-static'
Plugin 'guns/vim-clojure-highlight'
Plugin 'rkneufeld/vim-boot'
" Plugin 'calebsmith/vim-lambdify'

" coffeescript
Plugin 'kchmck/vim-coffee-script'

" editor extras
Plugin 'bling/vim-airline'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'guns/xterm-color-table.vim'

" color schemes
Plugin 'vim-scripts/wombat256.vim'
Plugin 'micha/vim70style'

" required by vundle {{{

call vundle#end()
filetype plugin indent on

"}}}

"}}}
" Vim Options {{{

set autoindent
set backspace=indent,eol,start
set backup
set backupdir=~/.vim-tmp
set complete-=i
set colorcolumn=132
set directory=~/.vim-tmp
set encoding=utf-8
set expandtab
set foldmethod=marker
set history=200
set hidden
set ignorecase
set incsearch
set laststatus=2
set listchars=trail:•
set nrformats-=octal
set number
set pastetoggle=<C-p>
set relativenumber
set shell=/bin/bash
set shiftwidth=2
set shiftround
set showcmd
set showmatch
set smartcase
set smarttab
set swapfile
set t_Co=256
set tabstop=2
set timeoutlen=1200
set ttimeoutlen=50
set wildignore+=*/target/*,*.class,*.lst
set wildmenu
set wildmode=longest:full,full

set noshowmode
set nowrap

" color scheme
syntax on
colorscheme vim70style

" leaders
let mapleader="a"
let maplocalleader=","

" whitespace at end of line
highlight ExtraWhitespace ctermbg=red
match ExtraWhitespace /\s\+$/

"}}}
" Plugin Options "{{{

" CtrlP
let g:ctrlp_map = '<C-x>'                            " Open CtrlP

" Airline
let g:airline_theme = 'wombat'                       " Airline colorscheme
let g:airline_powerline_fonts = 1                    " Fancy symbols
let g:airline#extensions#tabline#enabled = 1         " Enable the list of buffers
let g:airline#extensions#tabline#fnamemod = ':t'     " Show just the filename
let g:airline#extensions#tabline#tab_nr_type = 1     " Show buffer #, not # of splits
let g:airline#extensions#tabline#show_tab_nr = 1     " Show buffer # in tabline
let g:airline#extensions#tabline#show_tab_type = 1   " Show the tab type
let g:airline#extensions#tabline#buffer_idx_mode = 1 " Show buffer index

" Indent Guides
let g:indent_guides_enable_on_vim_startup = 1        " doit when vim starts
let g:indent_guides_auto_colors = 0                  " guide colors set by colorscheme
let g:indent_guides_exclude_filetypes = ['help']     " don't doit to these

"}}}
" Key Mappings "{{{

" navigate around buffers
nmap <leader>a :b#<CR>
nmap <leader>l :bnext<CR>
nmap <leader>h :bprevious<CR>

" navigate to specific buffers
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9

" create, kill, and list buffers
nmap <leader>C :enew<cr>
nmap <leader>K :bp <BAR> bd #<CR>
nmap <leader>bl :ls<CR>

" editing
nmap <C-j> i<CR><ESC>w

" redraw all things
nmap <C-l> :redraw<CR>:AirlineRefresh<CR>:b#<CR>:b#<CR>

" find the cursor
nmap <leader>cc :set nocursorcolumn!<CR>:set nocursorline!<CR>

" toggle highlighted search results
nnoremap <CR> :set nohlsearch!<CR>

nnoremap th  :tabfirst<CR>
nnoremap tk  :tabnext<CR>
nnoremap tj  :tabprev<CR>
nnoremap tp  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap te  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

"}}}
" Auto Commands "{{{

augroup micha
  autocmd!
  autocmd BufNewFile,BufRead  *.cljs.hl,*.boot,*.cljc set filetype=clojure
  autocmd BufNewFile,BufRead  *.html.hl        set filetype=html
  autocmd BufNewFile,BufRead  *.md             set filetype=markdown
  autocmd BufWritePost        ~/.vimrc         so ~/.vimrc
  autocmd BufWritePre *.hl,*.clj,*.cljs,*.html :%s/\s\+$//e
augroup END

"}}}
