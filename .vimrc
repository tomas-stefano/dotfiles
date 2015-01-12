" ┌──────────────────────────────────────┐
" │      VimFiles - Tomás Stefano        │
" ├──────────────────────────────────────┤
" │ http://github.com.br/tomas-stefano   │
" │ http://www.twitter.com/tomas_stefano │
" └──────────────────────────────────────┘

" ┌────────────────────┐
" │    Neo Bundle      │
" └────────────────────┘

if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" ┌────────────────────┐
" │    Vim Plugins     │
" └────────────────────┘

NeoBundle 'mileszs/ack.vim'
NeoBundle 'chriskempson/base16-vim'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'rizzatti/dash.vim'
NeoBundle 'natw/keyboard_cat.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'msanders/snipmate.vim'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'godlygeek/tabular'
NeoBundle 'tpope/vim-fugitive'

" ┌────────────────────────────────────────────────────────┐
" │    Vim Plugins Program Languages or Pre-processors     │
" └────────────────────────────────────────────────────────┘

NeoBundle 'kchmck/vim-coffee-script'
NeoBundle 'tpope/vim-fireplace'
NeoBundle 'tpope/vim-haml'
NeoBundle 'fatih/vim-go'
NeoBundle 'nono/vim-handlebars'
NeoBundle 'pangloss/vim-javascript'
NeoBundle 'groenewege/vim-less.git'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'tpope/vim-rake.git'
NeoBundle 'vim-ruby/vim-ruby.git'
NeoBundle 'rodjek/vim-puppet'

" ┌────────────────────┐
" │    NeoBundle end   │
" └────────────────────┘

call neobundle#end()
filetype plugin indent on

NeoBundleCheck

" ┌───────────────────────────────────┐
" │               Theme               │
" └───────────────────────────────────┘

syntax on

" ┌─────────────────────────────┐
" │       Vim Settings          │
" └─────────────────────────────┘

" Line numbers on
set number
set numberwidth=5

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

" Autoindent with two spaces and always expand tabs
set tabstop=2
set shiftwidth=2
set expandtab

" stricter rules for C programs
set cindent

" does the right thing (mostly) in programs
set smartindent

" Command line completion similar to bash
set wildmode=list:longest

set ruler " Ruler on

set wrap " Line wrapping on

" Never ever let Vim write a backup file! They did that in the 70’s.
" Use modern ways for tracking your changes (like git), for God’s sake
set nobackup
set noswapfile
set nowritebackup

" highlight current line
set cursorline

set history=50
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

set nofoldenable    " disable folding

set textwidth=80
set colorcolumn=+1

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" ┌────────────────────┐
" │    Functions       │
" └────────────────────┘

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" RENAME CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

" Rename files with '\n' shortcut
map <leader>n :call RenameFile()<cr>

