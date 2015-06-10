"================================================通用设置=====================================================
"设置终端显示颜色数
set t_Co=256
"set term=xterm-256color
colorscheme zenburn
" 设置终端背景,如solarized-dark和solarized-light就需要设置此选项
"set background=dark

"设置默认shell
set shell=/bin/bash

"关闭Scratch窗口
set completeopt=menu,menuone,longest

"(缩写为gfn)设置显示字体(linespace减小行距),只对gui有效
"set guifont=Menlo\ for\ Powerline\ Bold\ 11
"set guifont=Monaco\ for\ Powerline\ 11
"set linespace=-2

"使用非兼容模式
set nocompatible

"默认不产生utf8 bom
setglobal nobomb

"禁用鼠标
set mouse=
set selection=exclusive
set selectmode=mouse,key

"覆盖文件时不备份(和nowb一样)
set nobackup

"不要生成swap文件,当buffer被丢弃的时候隐藏它
set noswapfile
set bufhidden=hide

"设置在命令行显示多少历史记录
set history=50

"在状态栏显示目前所执行的指令
set showcmd

"命令行行数
set cmdheight=1

"操作符等待时间(ms)
set timeoutlen=500

"显示状态栏,默认为0,即不显示
set laststatus=2
set statusline=%F%r%m,%{&ff}\ %=%{&fileencoding}\ \ %l,%c\ %p%%

"设置换行符识别顺序(fileformats)
set ffs=unix,dos,mac

"不自动在文件后添加空行
"set binary
"set noendofline

"当打开的文件被外部程序修改后自动重新载入
set autoread

"编辑vimrc后重新加载(有时候会卡住,建议不开启此项,直接`:so %`即可)
"autocmd bufwritepost .vimrc source $HOME/.vimrc

"编辑html、css等文件时不自动换行
autocmd! BufNewFile,BufRead *.html,*.htm,*.css,*.php,*.py setlocal nowrap

"退出时自动保存session到prev.session(可能降低vim退出速度)
"autocmd! VimLeave * :SaveSession! prev

"自动切换工作目录到打开的文件所在目录
set autochdir

"开启会话保存(session)
set sessionoptions-=curdir
set sessionoptions+=sesdir

"设置自定义按键前导键<leader>,如<leader>w :w!为保存当前文件,默认为"\"
let mapleader=";"


"=============================================字符编码语系设定================================================
"fencview自动检测文件编码设置
let g:fencview_autodetect=0
let g:fencview_auto_patterns='*,*.*'
nnoremap <leader>enc :FencView<CR>


"(缩写为fenc)Vim文件编码,打开文件时,vim会探测文件编码方式,如果编码方式与此设定不一致则调用iconv转换编码后再
"打开,无法转换的字符将被丢弃,乱码时通常设置fenc与enc相同即可
set fileencoding=utf-8 "chinese是一个别名，在unix/linux下为gb2312,在windows下为cp936亦即gb2312

"(缩写为enc)Vim内部使用的字符编码方式,包括Vim的buffer(缓冲区),菜单文本,消息文本等,默认根据系统的locale选择
set encoding=utf-8

"(缩写为fencs)自动探测的编码列表,启动时按照此列表探测文件的编码方式,并将fileencoding设置为最终探测到的编码方
"式,最好将unicode放到最前面,拉丁语系编码方式latin1放到最后面
set fileencodings=utf-8,chinese,latin1

"设置帮助文档语言
set helplang=cn

"处理consle输出乱码
language messages zh_CN.UTF-8

"=================================================文件编辑设置=================================================
"保存历史记录的条数
set history=700

"显示光标坐标
set ruler

"显示相对行号、当前行号
set relativenumber
set number

"换行设置
set linebreak

"中文换行支持
set formatoptions+=mM

"行高亮
set nocursorline

"在行和段开始处使用制表符
set smarttab
"tab缩进宽度
set tabstop=4

"在按退格键时,如果前面有4个空格,则会统一清除
set softtabstop=4

"将新增的tab转换为空格;不会对已有的tab进行转换
set expandtab

"设定<<和>>命令移动时的宽度为4
set shiftwidth=4

"自动缩进
set autoindent "继承前一行的缩进方式,多行注释时比较有用
set smartindent

"禁用代码折叠
set foldenable
"代码折叠，设置为syntax可能导致大文件处理速度很慢
"set foldmethod=syntax

"按下j/k移动时,在光标垂直方向附近保留的行数
set scrolloff=1

"搜索时忽略大小写
set ignorecase

"搜索时智能识别大小写,即搜索内容全为小写时ignorecase,当搜索内容中含大写内容时就case sensitive
set smartcase

"即时显示搜索结果
set incsearch

"高亮搜索结果
set hlsearch

"设置魔术匹配控制，可以通过:h magic查看更详细的帮助信息
set magic

"插入右括号时会短暂地跳转到匹配的左括号
set noshowmatch

"(缩写为mat)匹配括号高亮的时间,单位是0.1秒,这里设置为0.5s
set matchtime=5

"配置:make命令调用gcc编译器
set errorformat=%f:%l:\ %m
set makeprg=gcc\ -std=c99\ -o\ %<\ %\ -Wall\ -g

"允许在有未保存的修改时切换缓冲区,此时的修改由切换由vim负责保存
set hid


"=================================================插件设置======================================================
""""""""""""""""""
"设置tagbar
""""""""""""""""""
let g:tagbar_width = 30
let g:tagbar_zoomwidth = 0
let g:tagbar_autofocus = 1
let g:tagbar_sort = 0
let g:tagbar_show_linenumbers = 1
let g:tagbar_iconchars = ['+', '-']
let g:tagbar_autoshowtag = 1
let g:tagbar_width=30
"打开这些后缀的文件时自动开启Tagbar
"autocmd BufReadPost *.py,*.php,*.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()


""""""""""""""""""
"设置git gutter
""""""""""""""""""
nmap ]g <Plug>GitGutterNextHunk
nmap [g <Plug>GitGutterPrevHunk
nmap <Leader>gv <Plug>GitGutterPreviewHunk

""""""""""""""""""
"设置undotree
""""""""""""""""""
"开启persistent_undo,将撤销历史通过session保存在文件中
if has('persistent_undo')
    let myUndoDir = expand("$HOME/.vim/tmp/undodir")
    " No console pops up
    call system('mkdir -p ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif
noremap <leader>un :UndotreeToggle<cr>



""""""""""""""""""
"设置incsearch
""""""""""""""""""
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


""""""""""""""""""
"设置vim-sneak
""""""""""""""""""
let g:sneak#s_next = 1


"""""""""""""""""""""""
"设置TagmaBufMgr
"""""""""""""""""""""""
let g:TagmaBufMgrLastLine = 1
let g:TagmaBufMgrLastWindow = 1
let g:TagmaBufMgrLocation = 'T'
let g:TagmaBufMgrCloseSelect = 0
let g:TagmaBufMgrMapChjkl = 0
let g:TagmaBufMgrMapChjklbuf = 1
let g:TagmaBufMgrAutoDisplay = 0

"""""""""""""""""""""""
"设置vim-session
"""""""""""""""""""""""
let g:session_autosave='no'
let g:session_autoload='no'
let g:session_default_name='default'
let g:session_default_overwrite=1
let g:session_extension='.vimsession'
let g:session_autosave_periodic=1
let g:session_default_to_last=0
let g:session_command_aliases = 1
let g:session_directory="~/.vim/sessions"

"""""""""""""""""""""""
"Doxygentoolkit注释生成
"""""""""""""""""""""""
let g:DoxygenToolkit_briefTag_pre="Desc: "
let g:DoxygenToolkit_fileTag = "Filename: "
let g:DoxygenToolkit_authorTag = "Author: "
let g:DoxygenToolkit_versionTag = "Version: "
let g:DoxygenToolkit_dateTag = "LastModified: "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader=""
let g:DoxygenToolkit_blockFooter=""
let g:DoxygenToolkit_authorName="littleqz <qizhihere@gmail.com>"
let g:doxygen_enhanced_color=1
let g:DoxygenToolkit_briefTag_funcName="yes"
nnoremap <leader><leader>/, :DoxAuthor<CR>
nnoremap <leader><leader>/. :DoxLic<CR>
nnoremap <leader><leader>// :Dox<CR>


""""""""""""""""""""""""
"配置Tabular
""""""""""""""""""""""""
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


""""""""""""""""""""""
"设置jsbeautify
""""""""""""""""""""""
"配置文件路径
let g:editorconfig_Beautifier = expand("~/") . '.vim/.editorconfig'
"按键映射
"map <C-m> :call JsBeautify()<CR>
autocmd FileType javascript noremap <leader>ff :call JsBeautify()
" for html
autocmd FileType html noremap <leader>ff :call HtmlBeautify()
" for css or scss
autocmd FileType css noremap <leader>ff :call CSSBeautify()


"""""""""""""""""""""""
"vundle配置
"注意filetype要在bundle全部载入之后再开启, 否则bundle中的ftdetect会失效.
"""""""""""""""""""""""
filetype off
set runtimepath+=~/.vim/bundle/vundle/
call vundle#begin()

"管理插件的插件
Bundle 'gmarik/vundle'

"在多窗口中切换时自动增大当前窗口
"Bundle 'zhaocai/GoldenView.Vim'

"在左侧标记git状态(添加、删除行)
Bundle 'airblade/vim-gitgutter'

"成对输入括号引号
Bundle 'jiangmiao/auto-pairs'

"使用s/S快速跳转(2个字符)
Bundle 'justinmk/vim-sneak'

"emacs-like增量搜索
Bundle 'haya14busa/incsearch.vim'

"树形的撤销历史
Bundle 'mbbill/undotree'

"快速更换配色主题
Bundle 'jdevera/vim-cs-explorer'

"在状态栏buffer列表
Bundle 'bling/vim-bufferline'

"buffer管理器(mapleader+<Tab>)
"Bundle 'JessicaKMcIntosh/TagmaBufMgr'

"快速生成html
Bundle 'mattn/emmet-vim'

"快速查找项目文件
Bundle 'kien/ctrlp.vim'

"和ctrlp差不多,不过性能好像不如ctrlp
"Bundle 'Yggdroot/LeaderF'

"代码taglist，快速跳转
Bundle 'majutsushi/tagbar'

"支持各种类型的代码语法检查
Bundle 'Syntastic'

"python语法检查
Bundle 'kevinw/pyflakes-vim'

"缓存补全代码
Bundle 'Shougo/neocomplcache'

"neocomplcache的代码段
Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neosnippet-snippets'

"行缩进辅助虚线显示，利用了vim7.3以后
"的Conceal特性。读取大文件速度慢，需要
"设置foldmethod=indent或开启faster选项
Bundle 'Yggdroot/indentLine'

"快速注释
Bundle 'scrooloose/nerdcommenter'

"直接显示颜色(支持rgb、rgba)
Bundle 'lilydjwg/colorizer'

"增强vim的代码高亮(typedef、宏等)
Bundle 'magic-dot-files/TagHighlight'

"vim的会话管理
Bundle 'xolox/vim-session'

"使vim-session支持快速命令
Bundle 'xolox/vim-misc'

"快速更改包围标签和引号、括号的神器
Bundle 'tpope/vim-surround'

"增强"."命令
Bundle 'tpope/vim-repeat'

"自动加速行移动
Bundle 'rhysd/accelerated-jk'

"替换vim的启动界面
Bundle 'mhinz/vim-startify'

"快速生成格式化的函数、文件注释
Bundle 'mrtazz/DoxygenToolkit.vim'

"成对地输入括号、引号
"Bundle 'Raimondi/delimitMate'

"保存文件时自动创建不存在的父目录
Bundle 'DataWraith/auto_mkdir'

"识别编码，以多种编码打开文件
Bundle 'mbbill/fencview'

"HTML/CSS/JS格式化
Bundle 'maksimr/vim-jsbeautify'
Bundle 'einars/js-beautify'

"支持正则的文本格式化神器
Bundle 'godlygeek/tabular'

call vundle#end()

"开启根据文件类型缩进、高亮
syntax enable
syntax on
filetype on
filetype plugin on
filetype indent on


""""""""""""""""""""""""
"Emmet配置
""""""""""""""""""""""""
"设置Emmet开启模式(n:normal,a:all,inv)
let g:user_emmet_mode='i'
"设置Emmet触发键
let g:user_emmet_expandabbr_key = '<C-y>'


""""""""""""""""""""""""
"indentline设置
""""""""""""""""""""""""
"let g:indentLine_color_term = 239
let g:indentLine_char = '┊'
"解决打开大文件卡的问题
let g:indentLine_faster = 1


""""""""""""""""""""""""
"配置Syntastic语法检查
""""""""""""""""""""""""
"在打开文件的时候检查
let g:syntastic_check_on_open=1
"phpcs，tab 4个空格，编码参考使用CodeIgniter风格
let g:syntastic_phpcs_conf = "--tab-width=4 --standard=CodeIgniter"
let makeprg = "php -l -d error_reporting=E_ALL -d display_errors=1"
"禁用Syntastic检查的文件类型
let g:syntastic_ignore_files=[".*\.py$"]
nmap <leader>syn :SyntasticToggleMode<CR>
nmap <leader>ern :lnext<CR>
nmap <leader>erp :lpre<CR>


"""""""""""""""""""""""""
"Neocomplcache自动补全设置
"""""""""""""""""""""""""
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_max_list = 10
let g:neocomplcache_max_keyword_width = 60
let g:neocomplcache_enable_auto_select = 0
let g:neocomplcache_enable_auto_delimiter = 1
let g:neocomplcache_enable_fuzzy_completion = 1


""""""""""""""""""""""""
"ctrlp配置
""""""""""""""""""""""""
let g:ctrlp_map = ',,'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.tar.gz,*.tgz,*.rar
let g:ctrlp_open_multiple_files = 'v'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git)$',
  \ 'file': '\v\.(jpg|jpeg|png)$',
  \ }


"=================================================快捷键设置====================================================
"快速保存、退出
noremap <silent> <leader>w :w!<CR>
noremap <silent> <leader>ww :w !sudo tee > /dev/null %<CR>
noremap <silent> <leader>wa :wa!<CR>
noremap <silent> <leader>q :q!<CR>
noremap <silent> <leader>qa :qa!<CR>

"快速打开文件
nnoremap ,e :e $HOME/.vimrc<CR>

"快速查看vim帮助
noremap <leader>h :h <C-r><C-w><CR>

"打开/关闭Tagmabufmgr
"nnoremap <leader><Tab> :MgrToggle<CR>

"快速切换工作目录到当前文件所在的目录
nnoremap cd :cd %:p:h<CR>

"更改<Esc>键的映射
inoremap jk <Esc>
"注：下面这个映射可能导致插入模式下方向键无法使用的问题，原因未知
"inoremap <Esc> <Nop>

"可视模式下常用映射
vnoremap <expr> I ForceBlockwiseVisual('I')
vnoremap <expr> A ForceBlockwiseVisual('A')
vnoremap y y`]
vnoremap h <Left>
vnoremap l <Right>
vnoremap j <Down>
vnoremap k <Up>

"搜索映射(search)
nnoremap \/ :nohlsearch<CR>

"系统剪贴板复制、粘贴、删除
noremap <leader>y "+y
noremap <leader>yy "+yy
noremap <leader>P "+P
noremap <leader>p "+p
noremap <leader>pp "+pp
noremap <leader>d "+d
noremap <leader>dd "+dd
noremap <leader>x "+x
noremap <leader>Y "+y$

"快速块移动
vnoremap < <gv
vnoremap > >gv

"buffer标签页操作
nnoremap <C-L> :bn!<CR>
nnoremap <C-H> :bp!<CR>
nnoremap <leader>bd :bdelete! %<CR>
nnoremap <leader>bo :bdelete!

"保存和读取默认会话
nnoremap <leader><leader>sd :SaveSession! default<CR>
nnoremap <leader><leader>ld :OpenSession! default<CR>
nnoremap <leader><leader>sp :SaveSession! prevsess<CR>
nnoremap <leader><leader>lp :OpenSession! prevsess<CR>
nnoremap <leader><leader>ll :SessionTabOpen<CR>
nnoremap <leader><leader>s :SaveSession!
nnoremap <leader><leader>l :OpenSession!
nnoremap <leader><leader>c :CloseSession!<CR>
nnoremap <leader><leader>d :DeleteSession!
nnoremap <leader><leader>dd :DeleteSession! default
nnoremap <leader><leader>qr :RestartVim<CR>

"分屏窗口最大化与复原
nnoremap <C-W>o :call MaximizeToggle()<CR>

"显示Tagbar窗口
nnoremap <leader>tl :TagbarToggle<CR>
nnoremap <leader>ts :tselect<CR>
map <F10> :silent exec "!ctags -R *" <Bar> redraw! <Bar> set tags=./tags,./TAGS,tags,TAGS <CR>

""""""""""""""""""""
"命令补全
""""""""""""""""""""
"insert模式
iabbrev time,, Date: <Esc>:read !date "+%Y/%m/%d %H:%M:%S"<CR>kJ$a
iabbrev py,, #!/usr/bin/env python2.7<CR># -*- coding: utf-8 -*-
iabbrev php,, <?php<CR>
iabbrev sh,, #!/usr/bin/env bash<CR>jkxa

"行尾增加分号
nnoremap ;; mzg_a;<Esc>`z

"在行首插入行号
nnoremap <leader>l :g/^/exec "s/^/".strpart(line(".")." ", 0, 4)<CR>

"插入数字序列
"1.使用seq命令，格式：:r!seq start step end,step可以是负数
"2.使用echo命令,格式：:r!echo {start..end..step}，start可以比end大
"3.插入序列树，可用命令(如下).可以考虑写成插件，以函数的方式调用
":r!for i in {1..4};do echo $i. && echo -e "\r  ("{1..3}")\n";done

"删除行内/行尾/行首空格
nnoremap <leader>d<Space> :s/ //g<CR>:nohlsearch<CR>
nnoremap d<Space> mzg_ldD`z
nnoremap d<Space><Space> :s/\v^\s+//g<CR>:nohlsearch<CR>

"================================================函数部分========================================================
"visual mode下使用I或A时自动转为visual block mode
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
