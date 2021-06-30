set nocompatible              " be iMproved, required
filetype off                  " required

syntax on

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ervandew/supertab'
Plugin 'mkitt/tabline.vim'
Plugin 'tpope/vim-eunuch'
Plugin 'davidhalter/jedi-vim'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

nnoremap <silent> <F5> :NERDTree<CR>
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" --------------------------------------------------------------------------------
" configure editor with tabs and nice stuff...
" --------------------------------------------------------------------------------
set expandtab  " enter spaces when tab is pressed
set textwidth=120  " break lines when line length increases
set tabstop=4 " use 4 spaces to represent tab
set softtabstop=4
set shiftwidth=4  " number of spaces to use for auto indent
set autoindent  " copy indent from current line when starting a new line
set hlsearch
set number
set showtabline=2  " constantly show tabline
set laststatus=2  " constantly show filepath
set cursorline  " enable cursor line position tracking
highlight clear CursorLine  " remove the underline from enabling cursorline
highlight CursorLineNR ctermbg=cyan  " set line numbering to COLOR background

" Special settings for a FileType
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Search for visual-selected text, forwards *, backwards #.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

" turn off/on 
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" go to previous position with Shift-tab
nnoremap <S-Tab> <C-o>

"let mapleader = ","
"let g:mapleader = ","
"nnoremap x "_x
"nnoremap d "_d
"nnoremap D "_D
"vnoremap d "_d

"nnoremap <leader>d ""d
"nnoremap <leader>D ""D
"vnoremap <leader>d ""d
"

" change tabs of NERD_tree
nnoremap <Esc>1 1gt
nnoremap <Esc>2 2gt
nnoremap <Esc>3 3gt
nnoremap <Esc>4 4gt
nnoremap <Esc>5 5gt
nnoremap <Esc>6 6gt
nnoremap <Esc>7 7gt
nnoremap <Esc>8 8gt
nnoremap <Esc>9 9gt
nnoremap <Esc><Left> gT
nnoremap <Esc><Right> gt

" only for python files
autocmd FileType python set colorcolumn=100

" jedi-vim
let g:jedi#show_call_signatures = "0"
