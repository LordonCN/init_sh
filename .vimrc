""""""""""""""""""""""
" Author:Lordon 
" nBlog: http://Tcloser.github.io
" Version: v2.4
" Update Time: 2020-04-17
" Details: change coc config for easy to use.
""""""""""""""""""""""

" 设置leader按键为空格
let mapleader = "\<space>"
set visualbell
set autoread


""""""""""""""""""""""
" normal mode 
"""""""""""""""""""""""
nmap <leader>w :w!<cr>
nmap <leader>q :q!<cr> 
nmap <leader>s :Startify<cr>
nmap <leader>t :NERDTreeToggle<cr>
"coc bookmark config
nmap <leader>b :CocList bookmark<cr>
nmap <leader>bn :CocCommand bookmark.annotate <cr>
"开新标签
nmap <leader>n :tabnew<cr>        
 

""""""""""""""""""""""
" INSERT model 
""""""""""""""""""""""
"快捷生成TODO
imap <C-t> <!--TODO--> <cr>
"exit  insert  to normal use jj 
imap jj <Esc>`^


""""""""""""""""""""""
" 设置vim scheme
""""""""""""""""""""""
"highlight Comment ctermbg=Black  ctermfg=White
highlight Normal ctermbg=Black
" this next line is needed to enable your custom colors:
colorscheme pablo
syntax enable
syntax on
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
"智能缩进
set smartindent
set foldmethod=indent
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
set nowrap "禁止折行
filetype indent on
set list lcs=tab:>-
set tabstop=4
set t_Co=128

""""""""""""""""""""""
" ---------Plug-------------
""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree' 						"左侧目录树
Plug 'mhinz/vim-startify' 						"welcome
Plug 'tpope/vim-fugitive' 						"Git 插件
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'luochen1990/rainbow'  					"括号不同颜色
Plug 'dense-analysis/ale' 						"语法检查
Plug 'Yggdroot/LeaderF', {'do': './install.sh'} "模糊搜索
Plug 'nathanaelkane/vim-indent-guides' 			"智能缩进插件 
Plug 'skywind3000/asyncrun.vim' 				"F5运行当前程序
Plug 'itchyny/vim-cursorword' 					"检测同名单词用下划线标出
Plug 'neoclide/coc.nvim', {'branch': 'release'} "补全指令插件 移步好用
Plug 'iamcco/markdown-preview.vim' 				"markdown prewiew ontime
call plug#end()


let airline#extensions#coc#error_symbol = 'Error:'
let airline#extensions#coc#warning_symbol = 'Warning:'
let g:airline#extensions#tabline#enabled = 1

function! AccentDemo()
  let keys = ['a','b','c','d','e','f','g','h']
  for k in keys
    call airline#parts#define_text(k, k)
  endfor
  call airline#parts#define_accent('a', 'red')
  call airline#parts#define_accent('b', 'green')
  call airline#parts#define_accent('c', 'blue')
  call airline#parts#define_accent('d', 'yellow')
  call airline#parts#define_accent('e', 'orange')
  call airline#parts#define_accent('f', 'purple')
  call airline#parts#define_accent('g', 'bold')
  call airline#parts#define_accent('h', 'italic')
  let g:airline_section_a = airline#section#create(keys)
endfunction
autocmd VimEnter * call AccentDemo()


""""""""""""""""""""""
" Plug----leaderF
""""""""""""""""""""""
nnoremap <leader>h vy:Leaderf rg -e /Users/Lordon/ path<CR>
let g:Lf_ReverseOrder = 1
let g:Lf_ShortcutF = '<C-P>'
let g:Lf_PreviewInPopup = 1
" Show icons, icons are shown by default
let g:Lf_ShowDevIcons = 1
let g:Lf_HideHelp = 1
let g:Lf_UseCache = 0
let g:Lf_UseVersionControlTool = 0
let g:Lf_IgnoreCurrentBufferName = 1
let g:Lf_WorkingDirectoryMode = 1

""""""""""""""""""""""
" Plug----nerdtree
" nerdtree settings leader+f :search for files
""""""""""""""""""""""
nnoremap <leader>f :nerdtreefind<cr>
" leader+t :open nerdtree
"nnoremap <leader>t :nerdtreetoggle<cr>
let nerdtreewinsize=30


""""""""""""""""""""""
" Plug-----缩进可视化插件 Indent Guides
" 从第二层开始可视化显示缩进
""""""""""""""""""""""
let g:indent_guides_start_level=2
" 色块宽度
let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
nmap <silent> <Leader>i <Plug>IndentGuidesToggle


""""""""""""""""""""""
"Plug asyncrun
"Quickly Run
""""""""""""""""""""""
" 任务结束时候响铃提醒
let g:asyncrun_bell = 1



"F5运行当前程序
map <F5> :call CompileRun()<CR>
    func! CompileRun()
	exec "w"
	if &filetype == 'sh'
        "    :!clear && time bash %
		exec "AsyncRun bash %"
		exec "copen"
	elseif &filetype == 'python'
		exec "AsyncRun -raw python %"
		exec "copen"
	elseif &filetype == 'cpp'
		exec "!g++ % -o %<"
		exec "!./%<"

	endif
	endfunc


" source的时候这段会报错 不过没关系 
filetype plugin indent on 
"新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.sh exec ":call SetTitle()" 
""定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\#########################################################################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: Lordon") 
        call append(line(".")+2, "\# mail: xunjtech@gmail.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c")) 
        call append(line(".")+4, "\#########################################################################") 
        call append(line(".")+6, "") 
    endif
    if &filetype == 'cpp'
        call setline(1, "/*************************************************************************")  
        call setline(2, "\ @Author: lordon")  
        call setline(3, "\ @Created Time : ".strftime("%c"))  
        call setline(4, "\ @Description:")  
        call setline(5, " ************************************************************************/")  
        call setline(6,"")  
        call setline(7, "#include<iostream>")
        call setline(8, "#include<cmath>")
        call setline(9, "#include<vector>")
        call setline(10,"#include<string>")
        call setline(11,"#include<algorithm>")
        call setline(12,"")  
        call setline(13,"using namespace std;")
        call setline(14,"")  
        call setline(15,"int main(){")  
        call setline(16,"")  
        call setline(17,"return 0;")  
        call setline(18,"}")  
    endif
   "新建文件后，自动定位到文件末尾
   autocmd BufNewFile * normal G
endfunc 