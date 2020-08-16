set encoding=utf-8
set tabstop=4
set shiftwidth=4
set mouse=a
set expandtab
set autoindent
set number
set rnu
syntax on

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Eye Candy
Plugin 'chriskempson/base16-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Comment Code
Plugin 'preservim/nerdcommenter'
call vundle#end()
filetype plugin indent on

" airline
let g:airline_theme='base16_vim'
let g:airline_powerline_fonts = 1

" Colorscheme
if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" Easier split navigation
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>
