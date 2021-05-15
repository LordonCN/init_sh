""""""""""""""""""""""
" Author:Lordon 
" Blog: http://Tcloser.github.io
" Version: v3.4
" Update Time: 2020-05-26
" Details: add popup terminal plug
""""""""""""""""""""""
"🌟设置leader按键为空格
let mapleader = "\<space>"
set visualbell
set autoread

nmap <leader>s :Startify<cr>
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr> 
" past the copy content in 0 regester
nmap 0p "0p
""""""""""""""""""""""
"💻copy content to systerm copyboard
" command: "+yw 或者 
"visual选中"+y 
""""""""""""""""""""""
vmap -= "+y
"🌟ve(visual select word) It's to difficult to reach
"nmap <leader>m ve

" copy file at right
nmap <leader>r :vs<cr>
" fuzzy search in home path
nmap <leader>f :LeaderfFile /home/wxy/<cr>
" fuzzy search in now path
let g:Lf_ShortcutF = '<C-P>'
"🌟change buffer tabe
nmap <leader>n :bn<cr> 
"🌟打开目录树 y定位到当前目录
nmap <leader>t :NERDTreeToggle<cr>
nnoremap <silent> <Leader>y :NERDTreeFind<CR>
"🌟coc bookmark config
nmap <leader>b :CocList bookmark<cr>
"开新标签
"nmap <leader>n :tabnew<cr>        
"🌟exit  insert model to normal use jj 
imap jj <Esc>`^
"快捷生成TODO change todo and to insert mode
"imap <C-t> <!--TODO--> jj7hdwi
imap <C-t>m <!--TODO(Lordon):--> jj3hi
imap <C-t>p # TODO(Lordon):
""""""""""""""""""""""
" 设置vim scheme
""""""""""""""""""""""
" this next line is needed to enable your custom colors:
colorscheme gruvbox
set background=dark
syntax enable
syntax on
" no swap
set noswapfile
set autoread
"搜索高亮
set hlsearch
"设置行号
set number
set relativenumber
"设置右下角光标位置
set ruler
"搜索所有相关
set incsearch
"不区分大小写搜索
set ignorecase
"显示出输入的命令
set showcmd 
set encoding=utf-8
"当前行加下标
"set cursorline 
"使用鼠标功能
set mouse=a
set mousehide 
"设置命令保存历史
set history=100
"命令行高度加1
set cmdheight=1 
"vim命令模式tab预选提示
set wildmenu
"禁止折行
set nowrap 

filetype indent on

set list lcs=tab:>-
set tabstop=4
set t_Co=256
set autochdir
autocmd BufEnter * silent! lcd %:p:h

""""""""""""""""""""""
" ---------Plug box-------------
""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree' 						"左侧目录树
Plug 'mhinz/vim-startify' 						"welcome
Plug 'tpope/vim-fugitive' 						"Git 插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'  					"括号不同颜色
Plug 'itchyny/vim-cursorword' 					"检测同名单词用下划线标出
Plug 'Yggdroot/LeaderF',{'do':':LeaderfInstallCExtension'}
call plug#end()


let airline#extensions#coc#error_symbol = 'Error:'
let airline#extensions#coc#warning_symbol = 'Warning:'
let g:airline#extensions#tabline#enabled = 1

""""""""""""""""""""""
" Show the name
""""""""""""""""""""""
function! AccentDemo()
  let keys = ['N','E','U','L','o','r','d','o','n']
  for k in keys
    call airline#parts#define_text(k, k)
  endfor
  call airline#parts#define_accent('N', 'bold')
  call airline#parts#define_accent('E', 'green')
  call airline#parts#define_accent('U', 'blue')
  call airline#parts#define_accent('L', 'purple')
  call airline#parts#define_accent('o', 'orange')
  call airline#parts#define_accent('r', 'purple')
  call airline#parts#define_accent('d', 'bold')
  call airline#parts#define_accent('o', 'green')
  call airline#parts#define_accent('n', 'italic')
  let g:airline_section_a = airline#section#create(keys)
endfunction
autocmd VimEnter * call AccentDemo()

""""""""""""""""""""""
" Plug-----缩进可视化插件 Indent Guides
" 从第二层开始可视化显示缩进
""""""""""""""""""""""
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle


