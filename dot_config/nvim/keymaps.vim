" =====================
" =   Vim自身键盘映射   =
" =====================
" 按键设置开始
let mapleader=','
" map <F3> <C-W>w
map <F10> :sh<CR>

" 窗口切换快捷键mapping
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-h> <C-w>h
map <C-l> <C-w>l

" 禁用上下左右方向键·
map <Left> <Nop>
map <Right> <Nop>
map <Up> <Nop>
map <Down> <Nop>

" buffer 导航
map gbn :bnext<CR>
map gbp :bprevious<CR>

" 代码行上下移动快捷键设置  本来应该是<A-j> <A-k>
" 但是在mac下Alt和字母按键会产生新的字符，所以设置快捷键需要使用特殊的字符
" 在window及其他平台下，需要修改此项配置
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" 字体放大缩小快捷键设置
nmap <leader>=  :resize +3<CR>
nmap <leader>-  :resize -3<CR>

" =====================
" =   粘贴模式键盘映射   =
" =====================
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-O>:set invpaste paste?<CR>
set pastetoggle=<F2>


" =====================
" =  NerdTree键盘映射  =
" =====================
" map <leader>n :NERDTreeToggle<cr>
" map <leader>f :NERDTreeFind<cr>

:nnoremap <leader>e :CocCommand explorer<CR>

" =====================
" =  NerdCommenter键盘映射  =
" =====================
map <c-_> :call NERDComment(0,"toggle")<cr>

" =====================
" =  Prettier键盘映射  =
" =====================
nmap <Leader>ff :Prettier<cr>


" =====================
" =TmuxNavigate键盘映射=
" =====================
nnoremap <silent> <c-w>h :TmuxNavigateLeft<cr>
nnoremap <silent> <c-w>j :TmuxNavigateDown<cr>
nnoremap <silent> <c-w>k :TmuxNavigateUp<cr>
nnoremap <silent> <c-w>l :TmuxNavigateRight<cr>kk


" =====================
" = easymotion键盘映射 =
" =====================
" 配置prefix按键为leader键
map <Leader> <Plug>(easymotion-prefix)
" 配置默认搜索使用easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
" 配置jkhl不用再重复按好多次
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" map  <Leader>w <Plug>(easymotion-bd-w)


" =====================
" =    fzf键盘映射     =
" =====================
" 配置fzf按键
" Mapping selecting mappings
"nmap <leader><tab> <plug>(fzf-maps-n)
"xmap <leader><tab> <plug>(fzf-maps-x)
"omap <leader><tab> <plug>(fzf-maps-o)
"nmap <leader>f :Files<CR>
"nmap <leader>b :Buffers<CR>


"" Insert mode completion
"imap <c-x><c-k> <plug>(fzf-complete-word)
"imap <c-x><c-f> <plug>(fzf-complete-path)
"imap <c-x><c-j> <plug>(fzf-complete-file-ag)
"imap <c-x><c-l> <plug>(fzf-complete-line)

"" Advanced customization using autoload functions
"inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})


" =====================
" = fzf.vim 键盘映射  = 
" =====================
nmap <Leader>p :GFiles<CR>
nmap ; :Buffers<CR>
nmap <Leader><Leader> :Commands<CR>
command! -bang -nargs=* RgExact
  \ call fzf#vim#grep(
  \   'rg -F --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)

nmap <Leader>d :execute 'RgExact ' . expand('<cword>') <Cr>

nnoremap <silent> <Leader>w :call fzf#run(fzf#wrap({'source': 'find $HOME/Code/ -maxdepth 3 -type d'}))<CR>

" =====================
" = Coc.nvim 键盘映射  = 
" =====================
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :coc#pum#confirm():
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

let g:coc_snippet_next = '<tab>'

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-i>'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

nmap <silent> <leader>gd <Plug>(coc-definition)
nmap <silent> <leader>gr <Plug>(coc-references)
nmap <silent> <leader>gi <Plug>(coc-implementation)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
      " \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

hi! link CocErrorSign WarningMsg
hi! link CocWarningSign Number
hi! link CocInfoSign Type

" nnoremap <silent> K :call CocAction('doHover')<CR>

function! ShowDocIfNoDiagnostic(timer_id)
  try
    if (coc#float#has_float() == 0 && (&ft == 'javascript' || &ft == 'typescript' || &ft == 'javascriptreact' || &ft == 'typescriptreact'))
      silent call CocActionAsync('doHover')
    endif
  catch
    echo "COC没装吧，兄弟"
  endtry
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

nmap <leader>. <Plug>(coc-codeaction)
nmap <leader>rn <Plug>(coc-rename)

nnoremap <silent> <space>d :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>


"   <Space> - PageDown
"   -       - PageUp
" noremap <Space> <PageDown>
" noremap - <PageUp>


" =====================
" = vim-jsdoc 键盘映射 = 
" =====================
nmap <leader>z :Goyo<CR>

" =====================
" =    ale键盘映射     = 
" =====================
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
" nmap sp <Plug>(ale_previous_wrap)
" nmap sn <Plug>(ale_next_wrap)
"<Leader>s触发/关闭语法检查
" nmap <Leader>a :ALEToggle<CR>
"<Leader>d查看错误或警告的详细信息
" nmap <Leader>ad :ALEDetail<CR>

map <Leader> <Plug>(easymotion-prefix)

" =====================
" =coc-react-refactor 键盘映射     = 
" =====================
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)


" =====================
" = GitGutter 键盘映射     = 
" =====================
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)


" =====================
" = submode 键盘映射     = 
" =====================

" A message will appear in the message line when you're in a submode
" and stay there until the mode has existed.
let g:submode_always_show_submode = 1

" We're taking over the default <C-w> setting. Don't worry we'll do
" our best to put back the default functionality.
call submode#enter_with('window', 'n', '', '<C-w>')

" Note: <C-c> will also get you out to the mode without this mapping.
" Note: <C-[> also behaves as <ESC>
call submode#leave_with('window', 'n', '', '<ESC>')

" Go through every letter
for key in ['a','b','c','d','e','f','g','h','i','j','k','l','m',
      \           'n','o','p','q','r','s','t','u','v','w','x','y','z']
  " maps lowercase, uppercase and <C-key>
  call submode#map('window', 'n', '', key, '<C-w>' . key)
  call submode#map('window', 'n', '', toupper(key), '<C-w>' . toupper(key))
  call submode#map('window', 'n', '', '<C-' . key . '>', '<C-w>' . '<C-'.key . '>')
endfor
" Go through symbols. Sadly, '|', not supported in submode plugin.
for key in ['=','_','+','-','<','>']
  call submode#map('window', 'n', '', key, '<C-w>' . key)
endfor
" I don't like <C-w>q, <C-w>c won't exit Vim when it's the last window.
call submode#map('window', 'n', '', 'q', '<C-w>c')
call submode#map('window', 'n', '', '<C-q>', '<C-w>c')

" <lowercase-pipe> sets the width to 80 columns, pipe (<S-\>) by default
" maximizes the width.
call submode#map('window', 'n', '', '\', ':vertical resize 80<CR>')

" Resize faster
call submode#map('window', 'n', '', '+', '3<C-w>+')
call submode#map('window', 'n', '', '-', '3<C-w>-')
call submode#map('window', 'n', '', '<', '10<C-w><')
call submode#map('window', 'n', '', '>', '10<C-w>>')


nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>8 <Plug>AirlineSelectTab8
nmap <leader>9 <Plug>AirlineSelectTab9
" 设置切换tab的快捷键 <\> + <-> 切换到前一个 tab
nmap J <Plug>AirlineSelectPrevTab
" 设置切换tab的快捷键 <\> + <+> 切换到后一个 tab
nmap K <Plug>AirlineSelectNextTab

let g:wordmotion_nomap = 1
nmap w          <Plug>WordMotion_w
nmap b          <Plug>WordMotion_b
nmap gE         <Plug>WordMotion_gE
omap aW         <Plug>WordMotion_aW
cmap <C-R><C-W> <Plug>WordMotion_<C-R><C-W>

noremap <Leader>s :update<CR>

nmap <Leader>tr <Plug>(coc-translator-p)

" set
autocmd TermEnter term://*toggleterm#*
      \ tnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>

" By applying the mappings this way you can pass a count to your
" mapping to open a specific window.
" For example: 2<C-t> will open terminal 2
nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>
inoremap <silent><c-t> <Esc><Cmd>exe v:count1 . "ToggleTerm"<CR>
lua << EOF
function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
EOF

