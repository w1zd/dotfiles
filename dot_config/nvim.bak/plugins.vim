" =========================================================
" =======       Plug 插件初始化代码       ===================
" =========================================================
" 设置nvim插件安装位置
" - 推荐安装到For Neovim: ~/.local/share/nvim/plugged
"   我自己安装到~/.config/nvim/plugged文件夹
" - 尽量不要使用标准的vim目录
"   Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.config/nvim/plugged')


" === 编辑器相关工具 === 
" 这是个异步执行命令的工具, 可以配合eslint等实现文件实时格式化
"Plug 'skywind3000/asyncrun.vim'
Plug '907th/vim-auto-save'

" 这个是避免在:bd 关掉buffer后window随之关闭的插件
Plug 'qpkorr/vim-bufkill'

" 快速移动插件
Plug 'easymotion/vim-easymotion'
Plug 'chaoren/vim-wordmotion'
" vim-tmux的窗口切换整合插件 可以非常方便的在vim的split和tmux的pane之间完成切换
Plug 'christoomey/vim-tmux-navigator'

" 会话自动保存恢复插件
" Plug 'rmagatti/auto-session'

" " denite 很屌，弹窗，文件导航什么的都很好用
" " Denite is a dark powered plugin for Neovim/Vim to unite all interfaces.
" if has('nvim')
"   Plug 'Shougo/neomru.vim'
"   Plug 'Shougo/denite.nvim', { 'do': ':UpdateRemotePlugins' }
" else
"   Plug 'Shougo/denite.nvim'
"   Plug 'roxma/nvim-yarp'
"   Plug 'roxma/vim-hug-neovim-rpc'
" endif
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" emoji支持
Plug 'junegunn/vim-emoji'
" fuzzy emoji
Plug 'pocari/vim-denite-emoji'
" ZenMode 支持
Plug 'junegunn/goyo.vim'
" submode 这个和keymap设置配合之后，可以只按一次c-w 紧接着快速按 - + < > 
" 非常方便的更改split的宽和高 很爽
Plug 'kana/vim-submode'

" === Git相关插件 ===
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'
" diffgutter 差异插件
Plug 'airblade/vim-gitgutter'
" blame 插件
Plug 'f-person/git-blame.nvim'
" Plug 'APZelos/blamer.nvim'
" Gist的插件
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
" Git插件
Plug 'tpope/vim-fugitive'


" === 代码语法类 ===
" ale 语法检测
" Plug 'dense-analysis/ale'
" VIM-MarkDown Preview
Plug 'godlygeek/tabular'
Plug 'jxnblk/vim-mdx-js'
" HTML 相关
Plug 'AndrewRadev/tagalong.vim'
" yaml 语法支持
Plug 'chase/vim-ansible-yaml'
" emmet语法支持
Plug 'mattn/emmet-vim'
" JSX支持
Plug 'pangloss/vim-javascript'
" Plug 'mxw/vim-jsx'
" TypeScript支持
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'maxmellon/vim-jsx-pretty'
" styled-component 支持
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
" graphql 支持
Plug 'jparise/vim-graphql'
" Vue 支持
Plug 'posva/vim-vue'
" Node.js 支持
Plug 'moll/vim-node'

" === 代码片段插件 ===
" neo代码段插件
" Plug 'Shougo/neosnippet'
" " neo代码段库
" Plug 'Shougo/neosnippet-snippets'
" vscode代码段库
" Plug 'andys8/vscode-jest-snippets'
" vim-snippets代码段库
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'dsznajder/vscode-es7-javascript-react-snippets', { 'do': 'yarn install --frozen-lockfile && yarn compile' }



" === 代码效率类 ===
" 弹窗插件 自动补全插件
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
" 多光标，类似于sublime
Plug 'terryma/vim-multiple-cursors'
" autoPair自动配对括号什么的
Plug 'jiangmiao/auto-pairs'
" 写css用的
" Plug 'rstacruz/vim-hyperstyle'
" 用各种符号将文字包裹起来 加双引号 加标签什么的 都能用
Plug 'tpope/vim-surround'
" prettier插件
" Plug 'prettier/vim-prettier', { 'do': 'yarn install' }

" === 注释类插件 ===
" 注释插件nerdcommenter
Plug 'scrooloose/nerdcommenter'
" vim-doge 文档注释插件 
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
" 显示文档插件（api提示）
Plug 'Shougo/echodoc.vim'




" === UI相关插件 ===
" 底部状态栏插件
Plug 'vim-airline/vim-airline'
" 底部状态栏主题插件
Plug 'vim-airline/vim-airline-themes'
" vim solarized颜色主题
Plug 'altercation/vim-colors-solarized'
Plug 'christianchiarulli/nvcode-color-schemes.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" vim synthwave84 赛博朋克主题
Plug 'artanikin/vim-synthwave84'
" vim flattr颜色主题
Plug 'farseer90718/flattr.vim'
" vim ayu颜色主题
Plug 'ayu-theme/ayu-vim'
" onedark 颜色主题
" Plug 'joshdick/onedark.vim'
Plug 'rakr/vim-one'
" material 颜色主题
Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" 缩进级别 标识线
" Plug 'Yggdroot/indentLine'
" nerdtree语法高亮
" Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" 启动画面
Plug 'mhinz/vim-startify'
" 图标插件
Plug 'ryanoasis/vim-devicons'

" 终端插件
Plug 'akinsho/toggleterm.nvim', {'tag' : 'v2.*'}

" 自动更改根目录
Plug 'airblade/vim-rooter'

" 初始化插件系统Initialize plugin system
call plug#end()
