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

" ----------- TAB CHARACTER SETTINS ---------------------------------
" method 2:
" set listchars=tab:\|\ 

" method 3: (active)
" (insert unicode character fo tight filled triangle big: '<ctrl + v>u25b6\ ')
set listchars=tab:▶\  
set list


" ----------- 20180216 cursor 'CROSSHAIR LOCATION' ------------------
set cursorline
set cursorcolumn


" ----------- 20190711 PYTHON HIGHLITING ----------------------------
" let python_highlight_all = 1			" Enable syntax highlighting for python codes
 

" ----------- status bar settup-02 ----------------------------------
" added from: https://github.com/itchyny/lightline.vim
" git clone https://github.com/itchyny/lightline.vim ~/.vim/pack/plugins/start/lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" ----------------- ABBREVIATIONS -----------------------------------
ab sbng #! /usr/bin/env bash<cr><cr>### Name:<tab>Scriptname ...<cr>### Author:<tab>Author ... <cr>### Date:<tab> <cr>### Decription:<cr>### <cr>### <cr>### <cr> 
" ab grv ${gr_} 
ab ptn3 #! /usr/bin/env python3<cr># -*- coding: utf-8 -*-<cr><cr>
"inoremap ${ ${}<Left>
inoremap ${ ${}<ESC>hli
inoremap {  {}<ESC>hli
inoremap (  ()<ESC>hli
inoremap [  []<ESC>hli

" ----------------- QUOTING: automatic ------------------------------
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


" ----------------- 20210127: TOGGLE NUMBER/RELATIVENUMBER ----------
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


" ----------------- DRACULA COLOR THEME -----------------------------
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


" ----------------- EDGE COLOR THEME --------------------------------
" let g:edge_style = 'neon'
" let g:edge_enable_italic = 1
" let g:edge_disable_italic_comment = 1
" colorscheme edge


" ----------------- SWITCH COLORSCHEMES - PREVIEV -------------------
" added: 20210127
" from https://vim.fandom.com/wiki/Switch_color_schemes
" :source ~/.vim/setcolors.vim
" :SetColors all
" :colors <colorscheme name>
" ... switch to next F8; switch to previous <shift>+F8


" ----------------- COLOR SETTINS FINAL (IF NO OTHER WORKS) ---------
" colorscheme  simple-dark
" colorscheme  nord
" colorscheme  Mustang
colorscheme wombat256mod

"
" ----------------- CUSTOM MAPPINGS ---------------------------------
" ADDED 20210226
" search for [12] or [123] troughout a file 
" and ask to deete it --> maped to ,d <comma+d> 
nnoremap ,d :%s/\[\d\+]//gc
 
" ---
" ADDED 20210308
" wildmenu and wildmode are used for command line completion.
" the command line is "expanded" vertically with a list of all the
" options available on your machine displayed in columns and an
" horizontal strip that you can navigate with <Tab> (forward) and
" <S-Tab> (backward).
set wildmenu
set wildmode=list:longest,full

" ---
"
