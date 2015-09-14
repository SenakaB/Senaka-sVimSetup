colorscheme PerfectDark
"wombat

syntax on

set nocompatible

set backspace=indent,eol,start

set autoindent

set showmatch

set hlsearch

set incsearch

set number

set nowrap



filetype on

call pathogen#infect() 
filetype plugin indent on

au BufNewFile,BufRead *.hql set filetype=sql

command! -nargs=1 -range SuperRetab <line1>,<line2>s/\v%(^ *)@<= {<args>}/\t/g


augroup filetypedetect
	au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END 


autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


"For coloring autocmplpop menu
hi Pmenu ctermfg=darkblue ctermbg=grey
hi PmenuSel ctermfg=black ctermbg=green

"TList
let Tlist_Inc_Winwidth = 0
let Tlist_Ctags_Cmdi = '/usr/local/Cellar/ctags/5.8/bin/ctags'

"For CtrlP utility key mapping
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

"Gundo
nnoremap <F5> :GundoToggle<CR>
let g:gundo_right = 1
let g:gundo_preview_bottom = 1

"NERDTree
nnoremap <F2> :NERDTreeToggle<CR>

set laststatus=2
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04v,%04l][%p%%]\ [LINES=%L]
set tw=0

" Map window switching to g+<arrow_key>
nmap <silent> g<Up> :wincmd k<CR>
nmap <silent> g<Down> :wincmd j<CR>
nmap <silent> g<Left> :wincmd h<CR>
nmap <silent> g<Right> :wincmd l<CR>

set showtabline=2  " 0, 1 or 2; when to use a tab pages line

nmap <silent> <F3> :tabnew<CR>:NERDTree<CR><C-w><Right>:q<CR>
