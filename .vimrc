set tabstop=4
set shiftwidth=4
set mouse=a
set expandtab
set number
set autoindent
set tags=tags;/
filetype plugin on
syntax on

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
set background=dark
colorscheme base16-3024

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
