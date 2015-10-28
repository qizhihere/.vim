""""""""""""""""""""""""""""""""""""""""""""""""
" style settings
""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme gruvbox
set background=dark

" font settings
"set guifont=Menlo\ for\ Powerline\ Bold\ 11
"set guifont=Monaco\ for\ Powerline\ 11
set guifont=Source\ Code\ Pro\ 13
set linespace=-4

" remove bars
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" disable mouse
set mouse=
set selection=exclusive
set selectmode=mouse,key
set cmdheight=1

" status line
set laststatus=2
set statusline=%F%r%m,%{&ff}\ %=%{&fileencoding}\ \ %l,%c\ %p%%



""""""""""""""""""""""""""""""""""""""""""""""""
" shell settings
""""""""""""""""""""""""""""""""""""""""""""""""
set t_Co=256
set term=screen-256color
set shell=/bin/bash


""""""""""""""""""""""""""""""""""""""""""""""""
" basic settings
""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

" prevent utf8 bom
setglobal nobomb
" no backup when overwrite files
set nobackup
" no swap file
set noswapfile
set bufhidden=hide
" history
set history=1000
" operator mode waiting time(ms)
set timeoutlen=400

" show position
set ruler
" show relative line number
set relativenumber
set number
set nocursorline
set scrolloff=3

set showcmd
set foldenable

" tab/indent settings
set smarttab
set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4 " tab width when using << or >> to indent
set autoindent
set smartindent

" search settings
set ignorecase
set smartcase
set incsearch
set hlsearch
set magic

" highlight parens match
set noshowmatch
set matchtime=5



""""""""""""""""""""""""""""""""""""""""""""""""
" buffer settings
""""""""""""""""""""""""""""""""""""""""""""""""
" auto change working directory to the directory of current file
set autochdir
" allow buffer switching when there are unsaved files
set hid
" auto reload file when modified
set autoread



""""""""""""""""""""""""""""""""""""""""""""""""
" file settings
""""""""""""""""""""""""""""""""""""""""""""""""
" encoding
set fileencoding=utf-8
set encoding=utf-8
set fileencodings=utf-8,chinese,latin1

" use fencview to auto detect file encoding
let g:fencview_autodetect=0
let g:fencview_auto_patterns='*,*.*'
nnoremap <leader>enc :FencView<CR>

" line break settings
set linebreak
" for chinese
set formatoptions+=mM
" priorities
set ffs=unix,dos,mac
" no newline at the end of file
"set binary
"set noendofline
" don't auto break lines when editing html,css... files
autocmd! BufNewFile,BufRead *.html,*.htm,*.css,*.php,*.py setlocal nowrap



""""""""""""""""""""""""""""""""""""""""""""""""
" compile settings
""""""""""""""""""""""""""""""""""""""""""""""""
set errorformat=%f:%l:\ %m
set makeprg=gcc\ -std=c99\ -o\ %<\ %\ -Wall\ -g



"=============================================== vundle start ================================================
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#begin()
Bundle 'gmarik/vundle'

""""""""""""""""""""""""""""""""""""""""""""""""
" basic plugins
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'mbbill/fencview'
Bundle 'jiangmiao/auto-pairs'
Bundle 'kevinw/pyflakes-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'lilydjwg/colorizer'
Bundle 'tpope/vim-surround'
Bundle 'mhinz/vim-startify'
Bundle 'DataWraith/auto_mkdir'


""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar settings
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'majutsushi/tagbar'
let g:tagbar_width = 30
let g:tagbar_zoomwidth = 0
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = 1
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_autoshowtag = 1
let g:tagbar_width=30
nnoremap <leader>tl :TagbarToggle<CR>
nnoremap <leader>ts :tselect<CR>
nnoremap <leader>tu :silent exec "!ctags -R *" <Bar> redraw! <Bar> set tags=./tags,./TAGS,tags,TAGS <CR>


""""""""""""""""""""""""""""""""""""""""""""""""
" jedi-vim: Python intelligent completion
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'davidhalter/jedi-vim'
let g:jedi#auto_initialization = 1
let g:jedi#popup_select_first = 0
let g:jedi#force_py_version = "auto"


""""""""""""""""""""""""""""""""""""""""""""""""
" git gutter: show git status on linum line
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'airblade/vim-gitgutter'
nmap <Leader>ggn <Plug>GitGutterNextHunk
nmap <Leader>ggp <Plug>GitGutterPrevHunk
nmap <Leader>ggv <Plug>GitGutterPreviewHunk


""""""""""""""""""""""""""""""""""""""""""""""""
" undotree
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'mbbill/undotree'
if has('persistent_undo')
    let myUndoDir = expand("$HOME/.vim/tmp/undodir")
    " No console pops up
    call system('mkdir -p ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
noremap <leader>un :UndotreeToggle<cr>


""""""""""""""""""""""""""""""""""""""""""""""""
" incsearch: emacs-style search
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'haya14busa/incsearch.vim'
let g:incsearch#auto_nohlsearch = 1
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map n  <Plug>(incsearch-nohl-n)
map N  <Plug>(incsearch-nohl-N)
map *  <Plug>(incsearch-nohl-*)
map #  <Plug>(incsearch-nohl-#)
map g* <Plug>(incsearch-nohl-g*)
map g# <Plug>(incsearch-nohl-g#)


""""""""""""""""""""""""""""""""""""""""""""""""
" vim-sneak: quick jump with two chars
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'justinmk/vim-sneak'
let g:sneak#s_next = 1


""""""""""""""""""""""""""""""""""""""""""""""""
" Tabular: format text with regex
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'godlygeek/tabular'
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


""""""""""""""""""""""""""""""""""""""""""""""""
" Emmet
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'mattn/emmet-vim'
let g:user_emmet_mode='i'
let g:user_emmet_expandabbr_key = '<C-j>'


""""""""""""""""""""""""""""""""""""""""""""""""
" jsbeautify: formatting web files
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'
"配置文件路径
let g:editorconfig_Beautifier = expand("~/") . '.vim/.editorconfig'
"按键映射
"map <C-m> :call JsBeautify()<CR>
autocmd FileType javascript noremap <leader>ff :call JsBeautify()
" for html
autocmd FileType html noremap <leader>ff :call HtmlBeautify()
" for css or scss
autocmd FileType css noremap <leader>ff :call CSSBeautify()


""""""""""""""""""""""""""""""""""""""""""""""""
" indentline
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char = '┊'
" fix vim stuck when opening big files
let g:indentLine_faster = 1


""""""""""""""""""""""""""""""""""""""""""""""""
" Syntastic: syntax check
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'Syntastic'
let g:syntastic_check_on_open=1
let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter"
let makeprg = "php -l -d error_reporting=E_ALL -d display_errors=1"
let g:syntastic_ignore_files=[".*\.py$"]
nnoremap <leader>ern :lnext<CR>
nnoremap <leader>erp :lpre<CR>


""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplcache: cache completion
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'Shougo/neocomplcache'
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 10
let g:neocomplcache_max_keyword_width = 60
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_enable_fuzzy_completion = 1


""""""""""""""""""""""""""""""""""""""""""""""""
" ctrlp: quick file navigation
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'kien/ctrlp.vim'
let g:ctrlp_map = ',,'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar.gz,*.tgz,*.rar
let g:ctrlp_open_multiple_files = 'v'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(jpg|jpeg|png)$',
  \ }



"=============================================== vundle end ================================================
call vundle#end()
syntax enable
syntax on
filetype on
filetype plugin on
filetype indent on




""""""""""""""""""""""""""""""""""""""""""""""""
" key settings
""""""""""""""""""""""""""""""""""""""""""""""""
" set leader key of custom maps
let mapleader=";"

noremap <silent> <leader>w :w !sudo tee > /dev/null %<CR>
noremap <silent> <leader>q :qa!<CR>

" quickly open files
nnoremap ,e :e $HOME/.vim/vimrc<CR>

" switch to current directory
nnoremap cd :cd %:p:h<CR>

" remap default escape key
inoremap jk <Esc>
cnoremap jk <Esc>
vnoremap jk <Esc>
snoremap jk <Esc>

" Emacs style keybindings
noremap <C-x>l <C-g>
cnoremap <C-g> <C-c>
inoremap <C-r> <Esc>?
inoremap <C-s> <Esc>/

" insert mode
imap <C-b> <Left>
imap <C-f> <Right>
imap <C-e> <End>
imap <C-d> <Del>
imap <C-h> <BS>
imap <C-a> <C-o>:call <SID>home()<CR>

" command line mode
cmap <C-p> <Up>
cmap <C-n> <Down>
cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-a> <Home>
cmap <C-e> <End>
cnoremap <C-d> <Del>
cnoremap <C-h> <BS>
cnoremap <C-k> <C-f>D<C-c><C-c>:<Up>

" visual mode
vnoremap <expr> I ForceBlockwiseVisual('I')
vnoremap <expr> A ForceBlockwiseVisual('A')
vnoremap y y`]
vnoremap h <Left>
vnoremap l <Right>
vnoremap j <Down>
vnoremap k <Up>

" system clipboard
noremap <leader>y "+y
noremap <leader>yy "+yy
noremap <leader>P "+P
noremap <leader>p "+p
noremap <leader>pp "+pp
noremap <leader>d "+d
noremap <leader>dd "+dd
noremap <leader>x "+x
noremap <leader>Y "+y$

" move block
vnoremap < <gv
vnoremap > >gv

" buffer switching
nnoremap <C-L> :bn!<CR>
nnoremap <C-H> :bp!<CR>

" maximize/restore window
nnoremap <C-W>o :call MaximizeToggle()<CR>


" abbrevs
iabbrev time,, Date: <Esc>:read !date "+%Y/%m/%d %H:%M:%S"<CR>kJ$a
iabbrev py,, #!/usr/bin/env python2.7<CR># -*- coding: utf-8 -*-
iabbrev php,, <?php<CR>
iabbrev sh,, #!/usr/bin/env bash<CR>jkxa

"在行首插入行号
"nnoremap <leader>l :g/^/exec "s/^/".strpart(line(".")." ", 0, 4)<CR>

"插入数字序列
"1.使用seq命令，格式：:r!seq start step end,step可以是负数
"2.使用echo命令,格式：:r!echo {start..end..step}，start可以比end大



"=============================================== function start ================================================
function! s:home()
  let start_col = col('.')
  normal! ^
  if col('.') == start_col
    normal! 0
  endif
  return ''
endfunction

function! ForceBlockwiseVisual(key)
    if mode() == 'v'
    return "\<C-v>" . a:key
    elseif mode() == 'V'
    return "\<C-v>0o$" . a:key
    else | return a:key |endif
endfunction

function! MaximizeToggle()
  if exists("s:maximize_session")
    exec "source " . s:maximize_session
    call delete(s:maximize_session)
    unlet s:maximize_session
    let &hidden=s:maximize_hidden_save
    unlet s:maximize_hidden_save
  else
    let s:maximize_hidden_save = &hidden
    let s:maximize_session = tempname()
    set hidden
    exec "mksession! " . s:maximize_session
    only
  endif
endfunction
"=============================================== function end ================================================
