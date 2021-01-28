" ---------------------------------- DEFAULT SETTINGS -----------------------------------------
set nocompatible					" This must be first, because it changes other options as a side effect.
set backspace=indent,eol,start		" allow backspacing over everything in insert mode
set history=50						" keep 50 lines of command line history
set ruler							" show the cursor position all the time
set showcmd							" display incomplete commands
set incsearch						" do incremental searching
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smartindent
set laststatus=2
set t_Co=256
set nohlsearch
syntax on
set background=dark
set number
set relativenumber
set ignorecase

if has('mouse')						" In many terminal emulators the mouse works just fine, thus enable it.
  set mouse=a
endif


" method 2: --------------------------
" set listchars=tab:\|\ 

" (insert unicode character fo tight filled triangle big: '<ctrl + v>u25b6\ ')
set listchars=tab:▶\  
set list


" 20180216 cursor 'CROSSHAIR LOCATION' -----------------
set cursorline
set cursorcolumn
" 20190711 ---------------------------------------------
" let python_highlight_all = 1			" Enable syntax highlighting for python codes
 
" status bar settup-02 ----------------------------------
" added from: https://github.com/itchyny/lightline.vim
" git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" ----------------- ABBREVIATIONS -----------------------
ab sbng #! /usr/bin/env bash<cr><cr>### Name:<tab>Scriptname ...<cr>### Author:<tab>Author ... <cr>### Date:<tab> <cr>### Decription:<cr>### <cr>### <cr>### <cr> 
ab grv ${gr_} 
ab ptn3 #! /usr/bin/env python3<cr># -*- coding: utf-8 -*-<cr><cr>
"inoremap ${ ${}<Left>
inoremap ${ ${}<ESC>hli
inoremap {  {}<ESC>hli
inoremap (  ()<ESC>hli
inoremap [  []<ESC>hli

" 20201224: add/remove quotes arround the word:
" Quote a word consisting of letters from iskeyword.
nnoremap <silent> qd :call Quote('"')<CR>
nnoremap <silent> qs :call Quote("'")<CR>
nnoremap <silent> wq :call UnQuote()<CR>
function! Quote(quote)
	normal mz
	exe 's/\(\k*\%#\k*\)/' . a:quote . '\1' . a:quote . '/'
	normal `zl
endfunction

function! UnQuote()
	normal mz
	exe 's/["' . "'" . ']\(\k*\%#\k*\)[' . "'" . '"]/\1/'
	normal `z
endfunction




" ADDED 20210127
" <ctrl+n> to toggle between just number and number+relativenumber
" from: https://superuser.com/questions/339593/vim-toggle-number-with-relativenumber
"Relative with start point or with line number or absolute number lines
function! NumberToggle()
    if(&number == 1)
        " set number!
        set relativenumber!
      elseif(&relativenumber==1)
        set relativenumber
        set number
      else
        set norelativenumber
        set number                                                  
    endif
endfunction

nnoremap <C-n> :call NumberToggle()<CR>


" ################ COLORS SETTUP ######################
" colorscheme  simple-dark
colorscheme  nord


" --------- DRACULA COLOR THEME -----------------------
" ADDED 20210127
" from: https://draculatheme.com/vim
" 
" Install (Vim):
" These are the default instructions using Vim 8's |packages| feature. See sections below, if you use other plugin managers.
"     Create theme folder (in case you don't have yet):
" mkdir -p ~/.vim/pack/themes/start
" If you use vim 8.0 (and not 8.2), you may need to use ~/.vim/pack/themes/opt instead.
"     Navigate to the folder above:
" cd ~/.vim/pack/themes/start
"     Clone the repository using the "dracula" name:
" git clone https://github.com/dracula/vim.git dracula
"     Create configuration file (in case you don't have yet):
" touch ~/.vimrc
"     Edit the ~/.vimrc file with the following content:
" packadd! dracula
" syntax enable
" colorscheme dracula
" ---
" literal:
" packadd! dracula
" syntax enable
" colorscheme dracula


" ------------ SWITCH COLORSCHEMES - PREVIEV --------------------
" added: 20210127
" from https://vim.fandom.com/wiki/Switch_color_schemes
" :source ~/.vim/setcolors.vim
" :SetColors all
" ... switch to next F8; switch to previous <shift>+F8
" 

