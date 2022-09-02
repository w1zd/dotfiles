set encoding=utf-8

" =====================
" =     加载插件       =
" =====================
source ~/.config/nvim/plugins.vim

" =====================
" =     编辑器设置     =
" =====================

" 设置fzf的运行时路径
" set rtp+=/usr/local/opt/fzf

" 语法高亮
syntax on

"文件在编辑器外部改变时 自动重新加载
set autoread

set hidden

" 设置undo持久化
set undofile

set nocompatible              
filetype off                  
filetype indent plugin on
set updatetime=300
set re=1
set title 
set ttyfast
set visualbell

" === Tab 缩进设置 === 
" 用空格代替tab，按下tab变成空格
set expandtab

" 更改空格数量
set softtabstop=2

" 更改< > 两个按键按下时的缩进数量
set shiftwidth=2

" 不对鼠标所在行进行高亮显示
set nocursorline

" 命令行的高度
set cmdheight=1

set tabstop=2
set autoindent

" 一直显示 signcolumn
set signcolumn=yes

" === Completion Settings === "
" Don't give completion messages like 'match 1 of 2'
" or 'The only match'
set shortmess+=c

" 编辑器UI相关设置
set guifont=FiraCode_Nerd_Font_Mono_Retina:h15
set  t_Co=256
syntax enable
""" Customize colors
func! s:my_colors_setup() abort
    " this is an example
    hi Pmenu guibg=#21252b gui=NONE
    hi PmenuSel guibg=#abb2bf gui=NONE
    hi PmenuSbar guibg=#bcbcbc
    hi PmenuThumb guibg=#585858
endfunc

augroup colorscheme_coc_setup | au!
    au ColorScheme * call s:my_colors_setup()
augroup END

set termguicolors     " enable true colors support
"let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
"let ayucolor="dark"   " for dark version of theme
" colorscheme ayu
colorscheme onedark
" colorscheme nvcode
" colorscheme one
" colorscheme material
" colorscheme synthwave84

" 高亮显示搜索结果
set hlsearch
" 让搜索行为像浏览器一样
set incsearch
" 为正则搜索开启magic
set magic
" 当文本指示符覆盖时显示匹配的括号
set showmatch
" 匹配括号时闪烁十分之几秒
set mat=2
" 禁用错误警告音
set noerrorbells
set novisualbell
set t_vb=
set tm=500


" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

" 500个字符时换行
set lbr
set tw=500
" 自动换行"
set wrap
" 开启行号  相对行号"
" set number relativenumber
set number

set laststatus=2
set showcmd

" =====================
" JavaScript 代码自动折叠
" =====================
function! JavaScriptFold()
  setl foldmethod=syntax
  setl foldlevelstart=1
  syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

  function! FoldText()
    return substitute(getline(v:foldstart), '{.*', '{...}', '')
  endfunction
  setl foldtext=FoldText()
endfunction

" au FileType javascript call JavaScriptFold()


" =====================
" =   浏览器中预览设置   =
" =====================
function! ViewInBrowser(name)
  let file = expand("%:p")
  let l:browsers = {
        \"cr":"open -a \"Google Chrome\"",
        \"ff":"open -a Firefox",
        \}
  let htdocs='/Users/leon1/'
  let strpos = stridx(file, substitute(htdocs, '\\\\', '\', "g"))
  let file = '"'. file . '"'
  exec ":update " .file
  "echo file .' ## '. htdocs
  if strpos == -1
    exec ":silent ! ". l:browsers[a:name] ." file://". file
  else
    let file=substitute(file, htdocs, "http://127.0.0.1:8090/", "g")
    let file=substitute(file, '\\', '/', "g")
    exec ":silent ! ". l:browsers[a:name] file
  endif
endfunction
nmap <Leader>cr :call ViewInBrowser("cr")<cr

" =====================
" =   emmet-vim 设置   =
" =====================
let g:user_emmet_leader_key='<C-y>'
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 1


" =====================
" = vim-prettier 设置  =
" =====================
command! -nargs=0 Prettier :CocCommand prettier.formatFile
nmap <leader>ff  <Plug>(Prettier)
" vmap <leader>f  <Plug>(coc-format-selected)
" nmap <leader>f  <Plug>(coc-format-selected)

" =====================
" =   VIM-TMUX 设置   =
" =====================
let g:tmux_navigator_no_mappings = 1
"nnoremap <silent> {Previous-Mapping} :TmuxNavigatePrevious<cr>
" Write all buffers before navigating from Vim to tmux pane
let g:tmux_navigator_save_on_switch = 2
" Disable tmux navigator when zooming the Vim pane
let g:tmux_navigator_disable_when_zoomed = 1

" =====================
" =   EasyMotion 设置  =
" =====================
let g:EasyMotion_do_mapping = 0 " Disable default mappings


" =====================
" =    gist-vim 设置   =
" =====================
" 
let g:gist_clip_command = 'pbcopy'

" =====================
" =   air-line 配置   =
" =====================
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#branch#enabled = 1

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = '☰'
let g:airline_symbols.maxlinenr = ''

" let g:airline_theme='ayu'
" let g:airline_theme='material'
let g:airline_theme='onedark'
" let g:airline_theme='nvcode'
" let g:airline_theme='one'
set background=dark " for the dark version
let g:one_allow_italics = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'


" =====================
" = nerdcommentor 设置 =
" =====================
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'javascript.jsx': { 'left': '//', 'leftAlt': '{/*', 'rightAlt': '*/}' } }
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
"let g:NERDAltDelims_java = 1

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not 
let g:NERDToggleCheckAllLines = 1


" =====================
" =   GitGutter 设置   =
" =====================
set updatetime=250
let g:gitgutter_override_sign_column_highlight = 1
let g:gitgutter_highlight_lines = 0
highlight clear SignColumn
highlight GitGutterAdd ctermfg=green guifg=green
highlight GitGutterChange ctermfg=yellow guifg=yellow
highlight GitGutterDelete ctermfg=red guifg=red
highlight GitGutterChangeDelete ctermfg=yellow guifg=yellow

let g:gitgutter_sign_added = '+'
let g:gitgutter_sign_modified = '~'
let g:gitgutter_sign_removed = '-'
" let g:gitgutter_sign_removed_first_line = '^^'
" let g:gitgutter_sign_removed_above_and_below = '{'
" let g:gitgutter_sign_modified_removed = 'ww'

" =====================
" =    fzf.vim 设置   =
" =====================
" This is the default option:
"   - Preview window on the right with 50% width
"   - CTRL-/ will toggle preview window.
" - Note that this array is passed as arguments to fzf#vim#with_preview function.
" - To learn more about preview window options, see `--preview-window` section of `man fzf`.
" let g:fzf_preview_window = ['right:50%', 'ctrl-/']

" Preview window on the upper side of the window with 40% height,
" hidden by default, ctrl-/ to toggle
" let g:fzf_preview_window = ['up:40%:hidden', 'ctrl-/']

" Empty value to disable preview window altogether
" let g:fzf_preview_window = []
" [Buffers] Jump to the existing window if possible
" let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
" let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
" let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
" let g:fzf_commands_expect = 'alt-enter,ctrl-x'


" =====================
" =  WebDevIcons 设置  =
" =====================
" 初始化资源之后重新加载 文件图标
if exists('g:loaded_webdevicons')
  call webdevicons#refresh()
endif


" =====================
" =     Coc.nvim 设置 =
" =====================
" autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'
" let g:coc_snippet_next = "<tab>"
let g:UltiSnipsExpandTrigger="<leader>io"
let g:UltiSnipsJumpForwardTrigger="<tab>"
" easymotion的时候关掉禁用coc不然lint出问题
autocmd User EasyMotionPromptBegin silent! CocDisable
autocmd User EasyMotionPromptEnd silent! CocEnable


" =====================
" =   neosnippet 设置  =
" =====================
" 
" Enable snipMate compatibility feature.
let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.config/nvim/plugged/vim-snippets/snippets'


" =====================
" =     echodoc 设置   = 
" =====================
" Enable echodoc on startup
let g:echodoc#enable_at_startup = 1
let g:echodoc_enable_at_startup = 1
" =====================
" = vim-javascript 设置= 
" =====================
" Enable syntax highlighting for JSDoc
let g:javascript_plugin_jsdoc = 1
set noshowmode

" 设置tsx和jsx的文件类型为typescriptreact
" autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact

" 设置jsx标签的颜色
" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic

let g:auto_save = 1  " enable AutoSave on Vim startup
let g:auto_save_silent = 1


" =====================
" =     加载键盘映射    =
" =====================
source ~/.config/nvim/keymaps.vim
" =====================
" =加载Prettier默认规则=
" =====================
" source ~/.config/nvim/prettier.vim

""""""
"  jsdoc"
""""""
let g:jsdoc_formatter = 'tsdoc'

""""""
"  coc 插件  "
""""""

let g:coc_global_extensions = ['coc-json', 'coc-css', 'coc-html', 'coc-prettier', 'coc-tsserver', 'coc-styled-components', 'coc-react-refactor', 'jest-snippets', 'coc-explorer']

"""
" blamer
"""
" let g:gitblame_enabled = 1
let g:doge_enable_mappings = 0

function! CloseCocExplorer()
  let isVisible = CocAction('runCommand', 'explorer.getNodeInfo', 'closest') 
  " 这里的4是dictionary类型
  if type(isVisible) == 4
    CocCommand explorer --toggle
  endif
endfunction

let g:startify_change_to_vcs_root = 1
let g:auto_session_pre_save_cmds = ["call CloseCocExplorer()"]
let g:auto_save_enabled = v:false

lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = "all", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  -- ignore_install = { "elixir" }, -- List of parsers to ignore installing
  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { "c", "rust" },  -- list of language that will be disabled
    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}
EOF

" configure nvcode-color-schemes
let g:nvcode_termcolors=256
hi LineNr ctermbg=NONE guibg=NONE
" 让背景透明
hi Normal guibg=NONE ctermbg=NONE


lua << EOF
require("toggleterm").setup{
}
EOF
