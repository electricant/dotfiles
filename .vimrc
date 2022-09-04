" general behaviour
set nocompatible
set encoding=utf8
set ttyfast

filetype on
filetype indent on
filetype plugin on

set autoread
set modeline

" Keep cursor 8 lines from window borders when scrolling
set scrolloff=6

" Syntax and colors
syntax on
colors darkblue

" Indentation and tab beahviour (indent using mixed tabs and spaces)
" see: https://vim.fandom.com/wiki/Indenting_source_code
set shiftwidth=6
set tabstop=6
set softtabstop=6
set noexpandtab
set autoindent

" Search tweaks
set ignorecase
set smartcase
set incsearch

" Turn magic on for regex
set magic

" Linebreak settings
set linebreak
let &showbreak = '↳ '
set textwidth=80 "gq at the beginning wraps automatically
"set formatoptions+=a
nnoremap wp gq}

" Competion settings
set complete=.,w,b,u,t,i,kspell

" Hilight search results
set hlsearch

" Show matching brackets when text indicator is over them
set showmatch

" put vim in paste mode using F2
set pastetoggle=<F2>

" Quick toggle spell check
map <F3>i :set spell! spelllang=it<CR>
map <F3>e :set spell! spelllang=en<CR>
map <F4> :set spell!<CR>
map <F5> :SyntasticToggleMode<CR>
map <F6> :w \| :make!<CR>

" remap '.' as ':' when in normal mode and ',' to '.' 
nnoremap . :
nnoremap , .

" syntastic plugin
let g:syntastic_check_on_open=0
let g:syntastic_check_on_wq=1
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_jump=2
let g:syntastic_warning_symbol="W>"
let g:syntastic_error_symbol="E>"

let g:syntastic_c_compiler_options='-Wall -Wpedantic -Wextra'
let g:syntastic_cpp_compiler_options='-Wall -Wpedantic -Wextra -std=c++11'
let g:syntastic_d_compiler='gdc'
let g:syntastic_d_compiler_options='-Wall'
let g:syntastic_tex_checkers=['lacheck'] " ChkTeX is too strict and chatty

" vim-lastplace plugin (default settings)
let g:lastplace_ignore = "gitcommit,gitrebase,svn,hgcommit"
let g:lastplace_ignore_buftype = "quickfix,nofile,help"

" Remove arrow keys in order to be forced to use hjkl
nnoremap <Left> :echo "No left for you!"<CR>
vnoremap <Left> :<C-u>echo "No left for you!"<CR>
"inoremap <Left> <C-o>:echo "No left for you!"<CR>

nnoremap <Right> :echo "No right for you!"<CR>
vnoremap <Right> :<C-u>echo "No right for you!"<CR>
"inoremap <Right> <C-o>:echo "No right for you!"<CR>

nnoremap <Up> :echo "No up for you!"<CR>
vnoremap <Up> :<C-u>echo "No up for you!"<CR>
"inoremap <Up> <C-o>:echo "No up for you!"<CR>

nnoremap <Down> :echo "No down for you!"<CR>
vnoremap <Down> :<C-u>echo "No down for you!"<CR>
"inoremap <Down> <C-o>:echo "No down you!"<CR>

" This clears search higliting by hitting return
nnoremap <CR> :noh<CR><CR>

" Appearance settings for gVim
if has("gui_running")
	" increase font size
	set guifont=Monospace\ 12
	" Set sensible initial window size
	set lines=50 columns=80
endif

" Reload .vimrc automagically if something is changed
if has ('autocmd') " Remain compatible with earlier versions
	augroup vimrc
		au!
    	au! BufWritePost $MYVIMRC so % | echom "Reloaded " . $MYVIMRC 
  augroup END
endif

