syntax on
filetype plugin indent on

set syntax=whitespace
set number
" set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:␣
" set list
set updatetime=100
set spell

" --- plugins begin ---
call plug#begin('~/.vim/plugged')
  Plug 'vim-airline/vim-airline'
  Plug 'valloric/youcompleteme'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'scrooloose/syntastic'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'alvan/vim-closetag'
  Plug 'mattn/emmet-vim'
  Plug 'lervag/vimtex'
  Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
call plug#end()
" --- plugins end ---

" --- LaTeX begin ---
let g:livepreview_previewer = 'zathura'
" --- LaTeX end ---

" --- cursor begin ---
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" Ps = 0  -> blinking block.
" Ps = 1  -> blinking block (default).
" Ps = 2  -> steady block.
" Ps = 3  -> blinking underline.
" Ps = 4  -> steady underline.
" Ps = 5  -> blinking bar (xterm).
" Ps = 6  -> steady bar (xterm).
" --- cursor end ---

" --- netrw settings begin ---
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 25
" --- netrw settings end ---

" --- syntastic begin ---
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
" --- syntastic end


" --- autocmd begin ---
augroup ProjectDrawer
  autocmd!
  autocmd VimEnter * :Vexplore
  autocmd VimEnter * silent !echo -ne "\e[2 q"
  autocmd Filetype tex setl updatetime=1
augroup END
" --- autocmd end ---
