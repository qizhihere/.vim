""""""""""""""""""""""""""""""""""""""""""""""""
" style settings
""""""""""""""""""""""""""""""""""""""""""""""""
set background=dark
function! s:load_color()
    if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
        let g:solarized_termcolors=256
        let g:solarized_termtrans=1
        let g:solarized_contrast="normal"
        let g:solarized_visibility="low"
        color solarized
        hi clear SignColumn
        hi clear LineNr
        hi DiffAdd ctermbg=NONE guibg=NONE
        hi DiffChange ctermbg=NONE guibg=NONE
        hi DiffDelete ctermbg=NONE guibg=NONE
        hi DiffText ctermbg=NONE guibg=NONE
        hi VertSplit ctermbg=NONE guibg=NONE
        hi Pmenu  guifg=#000000 guibg=#F8F8F8 ctermfg=black ctermbg=Lightgray
        hi PmenuSbar  guifg=#8A95A7 guibg=#F8F8F8 gui=NONE ctermfg=darkcyan ctermbg=lightgray cterm=NONE
        hi PmenuThumb  guifg=#F8F8F8 guibg=#8A95A7 gui=NONE ctermfg=lightgray ctermbg=darkcyan cterm=NONE
    endif
endfunction

" font settings
set guifont=Source\ Code\ Pro\ 13

" remove bars
set guioptions-=m
set guioptions-=T
set guioptions-=r
set guioptions-=L

" fix fillchars and listchars errors
scriptencoding utf-8

" set default window split position
set splitright
set splitbelow

" set split separator
set fillchars+=vert:│

" disable mouse
set mouse=
set selection=exclusive
set selectmode=mouse,key
set cmdheight=1

" status line
set laststatus=2
set statusline=%<%f\                     " Filename
set statusline+=%w%h%m%r                 " Options
set statusline+=%{fugitive#statusline()} " Git Hotness
set statusline+=\ [%{&ff}/%Y]            " Filetype
set statusline+=\ [%{getcwd()}]          " Current dir
set statusline+=%=%-14.(%l,%c%V%)\ %p%%  " Right aligned file nav info
let g:airline_theme="solarized"


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

" set leader key of custom maps
let mapleader=";"

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
set timeoutlen=600

" show position
set ruler
" show relative line number
set relativenumber
set number
set nocursorline
set scrolloff=3

set showcmd
set foldenable

" show invisible whitespace chars
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

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

" show quotes when editing json files
set conceallevel=0


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

" File Explorer
let g:netrw_liststyle=3


""""""""""""""""""""""""""""""""""""""""""""""""
" file type settings
""""""""""""""""""""""""""""""""""""""""""""""""
" don't auto break lines when editing html,css... files
autocmd! BufNewFile,BufRead *.html,*.htm,*.css,*.php,*.py setlocal nowrap
" automatically change directory to current work dir
autocmd BufEnter * if bufname("") !~ "^\[A-Za-z0-9\]*://" | lcd %:p:h | endif

autocmd FileType c,cpp,java,go,php,javascript,puppet,python,rust,twig,xml,yml,perl,sql autocmd BufWritePre <buffer> if !exists('g:spf13_keep_trailing_whitespace') | call StripTrailingWhitespace() | endif
"autocmd FileType go autocmd BufWritePre <buffer> Fmt
autocmd BufNewFile,BufRead *.html.twig set filetype=html.twig
autocmd FileType haskell,puppet,ruby,yaml,yml setlocal expandtab shiftwidth=2 tabstop=2
" preceding line best in a plugin but here for now.

autocmd BufNewFile,BufRead *.coffee set filetype=coffee

" Workaround vim-commentary for Haskell
autocmd FileType haskell setlocal commentstring=--\ %s
" Workaround broken colour highlighting in Haskell
autocmd FileType haskell,rust setlocal nospell


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
Bundle 'altercation/vim-colors-solarized'
Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'mbbill/fencview'
Bundle 'jiangmiao/auto-pairs'
Bundle 'kevinw/pyflakes-vim'
Bundle 'scrooloose/nerdcommenter'
Bundle 'tpope/vim-surround'
Bundle 'mhinz/vim-startify'
Bundle 'DataWraith/auto_mkdir'
Bundle 'bling/vim-bufferline'
Bundle 'mhinz/vim-signify'

""""""""""""""""""""""""""""""""""""""""""""""""
" fugitive settings
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'tpope/vim-fugitive'
nnoremap <silent> <leader>gs :Gstatus<CR>
nnoremap <silent> <leader>gid :Gdiff<CR>
nnoremap <silent> <leader>gic :Gcommit<CR>
nnoremap <silent> <leader>gib :Gblame<CR>
nnoremap <silent> <leader>gil :Glog<CR>
nnoremap <silent> <leader>gip :Git push<CR>
nnoremap <silent> <leader>gir :Gread<CR>
nnoremap <silent> <leader>giw :Gwrite<CR>
nnoremap <silent> <leader>gie :Gedit<CR>
" Mnemonic _i_nteractive
nnoremap <silent> <leader>gia :Git add -p %<CR>
nnoremap <silent> <leader>gig :SignifyToggle<CR>


""""""""""""""""""""""""""""""""""""""""""""""""
" tagbar settings
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'majutsushi/tagbar'
let g:tagbar_width = 30
let g:tagbar_zoomwidth = 0
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = 0
let g:tagbar_iconchars = ['▸', '▾']
let g:tagbar_autoshowtag = 1
let g:tagbar_width=30
nnoremap <leader>tl :TagbarToggle<CR>
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
let g:gitgutter_override_sign_column_highlight = 0


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
noremap <leader>u :UndotreeToggle<cr>


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
" Emmet
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'mattn/emmet-vim'
let g:user_emmet_mode='i'
let g:user_emmet_expandabbr_key = '<C-j>'


""""""""""""""""""""""""""""""""""""""""""""""""
" formatting code
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'Chiel92/vim-autoformat'
noremap <F3> :Autoformat<CR>


""""""""""""""""""""""""""""""""""""""""""""""""
" indentline
""""""""""""""""""""""""""""""""""""""""""""""""
Bundle 'Yggdroot/indentLine'
let g:indentLine_color_term = 239
let g:indentLine_char = '┊'
" fix vim stuck when opening big files
let g:indentLine_faster = 1
let g:indentLine_conceallevel = 0


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
call s:load_color()


""""""""""""""""""""""""""""""""""""""""""""""""
" key settings
""""""""""""""""""""""""""""""""""""""""""""""""
au BufEnter * setlocal noreadonly
noremap <leader>w :call WriteDwim()<CR>
noremap <silent> <leader>q :qa!<CR>

" open terminal
noremap <f6> :Silent !$SHELL<CR>

" quickly switch buffer
noremap <silent> <C-h> :bp!<CR>
noremap <silent> <C-l> :bn!<CR>

" quickly switch buffer
noremap <silent> <leader>[ :bp!<CR>
noremap <silent> <leader>] :bn!<CR>

" quickly open files
nnoremap ,e :e $HOME/.vim/vimrc<CR>

" switch to current directory
nnoremap cd :cd %:p:h<CR>

" stop using `jk`, use `C-[` instead
" " remap default escape key
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
imap <C-a> <C-o>:call <SID>home()<CR>

" command line mode
cmap <C-p> <Up>
cmap <C-n> <Down>
cmap <C-b> <Left>
cmap <C-f> <Right>
cmap <C-a> <Home>
cmap <C-e> <End>
cnoremap <C-d> <Del>
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

" maximize/restore window
nnoremap <C-W>o :call MaximizeToggle()<CR>

" add a modeline(magical line)
nnoremap <silent> <leader>ml :call AppendModeline()<CR>

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
command! -nargs=+ Silent execute 'silent <args>' | redraw!

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
    else
        return a:key
    endif
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

function! WriteDwim()
    let file = expand('%')
    if filewritable(file)
        write
    else
        execute ':silent w !sudo tee % > /dev/null'
        edit!
    endif
endfunction

" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
    let modeline = printf(" vim: set ft=%s ts=%d sw=%d tw=%d %set :",
                \ &filetype, &tabstop, &shiftwidth, &textwidth, &expandtab ? '' : 'no')
    let modeline = substitute(&commentstring, "%s", modeline, "")
    call append(line("$"), modeline)
endfunction

function! StripTrailingWhitespace()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
"=============================================== function end ================================================
