set tabstop=4
set shiftwidth=4
set mouse=a
set expandtab
set number
set autoindent
set tags=tags;/
set laststatus=2
filetype plugin on
syntax on

" Powerline
python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" vim-plug
call plug#begin('~/.vim/plugged')

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'preservim/nerdtree'

call plug#end()

" Toggle NERDTree
nmap <silent> <C-D> :NERDTreeToggle<CR>

"
nnoremap <leader>. :CtrlPTag<CR>

" Toggle Tagbar
nnoremap <silent> <leader>b :TagbarToggle<CR>

" Turn of highlighting (until next search)
nnoremap <silent> <C-L> :noh<CR><C-L>

" Use tabs for makefile
autocmd Filetype make setlocal noexpandtab

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

" Move splits
function! MarkWindowSwap()
  let g:markedWinNum = winnr()
 endfunction

 function! DoWindowSwap()
  " Mark destination
  let curnum = winnr()
  let curBut = bufnr( "%" )
  " Switch to source and shuffle dest->source
  let markedBuf = bufnr( "%" )
  " Hide and open so that we aren't prompted and keep history
  exe 'hide buf' curBuf
  " Switch to dest and shuffle source->dest
  exe curnum . "wincmd w"
  " Hide and open so that we aren't prompted and keep history
  exe 'hide buf' markedBuf
endfunction

nmap <silent> <leader>mv :call MarkWindowSwap()<CR>
nmap <silent> <leader>pw :call DoWindowSwap()<CR>

