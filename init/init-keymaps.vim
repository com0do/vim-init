"======================================================================
"
" init-keymaps.vim - 按键设置，按你喜欢更改
"
"   - 快速移动
"   - 标签切换
"   - 窗口切换
"   - 终端支持
"   - 编译运行
"   - 符号搜索
"
" Created by skywind on 2018/05/30
" Last Modified: 2018/05/30 17:59:31
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


"----------------------------------------------------------------------
" INSERT 模式下使用 EMACS 键位
"----------------------------------------------------------------------
inoremap <c-a> <home>
inoremap <c-e> <end>
inoremap <c-d> <del>
inoremap <c-_> <c-k>


"----------------------------------------------------------------------
" 设置 CTRL+HJKL 移动光标（INSERT 模式偶尔需要移动的方便些）
" 使用 SecureCRT/XShell 等终端软件需设置：Backspace sends delete
" 详见：http://www.skywind.me/blog/archives/2021
"----------------------------------------------------------------------
noremap <C-h> <left>
noremap <C-j> 20<down>
noremap <C-k> 20<up>
noremap <C-l> <right>
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>


"----------------------------------------------------------------------
" 命令模式的快速移动
"----------------------------------------------------------------------
cnoremap <c-h> <left>
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-l> <right>
cnoremap <c-a> <home>
cnoremap <c-e> <end>
cnoremap <c-f> <c-d>
cnoremap <c-b> <left>
cnoremap <c-d> <del>
cnoremap <c-_> <c-k>


"----------------------------------------------------------------------
" <leader>+数字键 切换tab
"----------------------------------------------------------------------
noremap <silent><leader>1 1gt<cr>
noremap <silent><leader>2 2gt<cr>
noremap <silent><leader>3 3gt<cr>
noremap <silent><leader>4 4gt<cr>
noremap <silent><leader>5 5gt<cr>
noremap <silent><leader>6 6gt<cr>
noremap <silent><leader>7 7gt<cr>
noremap <silent><leader>8 8gt<cr>
noremap <silent><leader>9 9gt<cr>
noremap <silent><leader>0 10gt<cr>


"----------------------------------------------------------------------
" ALT+N 切换 tab
"----------------------------------------------------------------------
noremap <silent><m-1> :tabn 1<cr>
noremap <silent><m-2> :tabn 2<cr>
noremap <silent><m-3> :tabn 3<cr>
noremap <silent><m-4> :tabn 4<cr>
noremap <silent><m-5> :tabn 5<cr>
noremap <silent><m-6> :tabn 6<cr>
noremap <silent><m-7> :tabn 7<cr>
noremap <silent><m-8> :tabn 8<cr>
noremap <silent><m-9> :tabn 9<cr>
noremap <silent><m-0> :tabn 10<cr>
inoremap <silent><m-1> <ESC>:tabn 1<cr>
inoremap <silent><m-2> <ESC>:tabn 2<cr>
inoremap <silent><m-3> <ESC>:tabn 3<cr>
inoremap <silent><m-4> <ESC>:tabn 4<cr>
inoremap <silent><m-5> <ESC>:tabn 5<cr>
inoremap <silent><m-6> <ESC>:tabn 6<cr>
inoremap <silent><m-7> <ESC>:tabn 7<cr>
inoremap <silent><m-8> <ESC>:tabn 8<cr>
inoremap <silent><m-9> <ESC>:tabn 9<cr>
inoremap <silent><m-0> <ESC>:tabn 10<cr>


" MacVim 允许 CMD+数字键快速切换标签
if has("gui_macvim")
	set macmeta
	noremap <silent><d-1> :tabn 1<cr>
	noremap <silent><d-2> :tabn 2<cr>
	noremap <silent><d-3> :tabn 3<cr>
	noremap <silent><d-4> :tabn 4<cr>
	noremap <silent><d-5> :tabn 5<cr>
	noremap <silent><d-6> :tabn 6<cr>
	noremap <silent><d-7> :tabn 7<cr>
	noremap <silent><d-8> :tabn 8<cr>
	noremap <silent><d-9> :tabn 9<cr>
	noremap <silent><d-0> :tabn 10<cr>
	inoremap <silent><d-1> <ESC>:tabn 1<cr>
	inoremap <silent><d-2> <ESC>:tabn 2<cr>
	inoremap <silent><d-3> <ESC>:tabn 3<cr>
	inoremap <silent><d-4> <ESC>:tabn 4<cr>
	inoremap <silent><d-5> <ESC>:tabn 5<cr>
	inoremap <silent><d-6> <ESC>:tabn 6<cr>
	inoremap <silent><d-7> <ESC>:tabn 7<cr>
	inoremap <silent><d-8> <ESC>:tabn 8<cr>
	inoremap <silent><d-9> <ESC>:tabn 9<cr>
	inoremap <silent><d-0> <ESC>:tabn 10<cr>
endif



"----------------------------------------------------------------------
" 缓存：插件 unimpaired 中定义了 [b, ]b 来切换缓存
"----------------------------------------------------------------------
noremap <silent> <leader>bn :bn<cr>
noremap <silent> <leader>bp :bp<cr>


"----------------------------------------------------------------------
" TAB：创建，关闭，上一个，下一个，左移，右移
" 其实还可以用原生的 CTRL+PageUp, CTRL+PageDown 来切换标签
"----------------------------------------------------------------------

noremap <silent> <leader>tc :tabnew<cr>
noremap <silent> <leader>tq :tabclose<cr>
noremap <silent> <leader>tn :tabnext<cr>
noremap <silent> <leader>tp :tabprev<cr>
noremap <silent> <leader>to :tabonly<cr>


" 左移 tab
function! Tab_MoveLeft()
	let l:tabnr = tabpagenr() - 2
	if l:tabnr >= 0
		exec 'tabmove '.l:tabnr
	endif
endfunc

" 右移 tab
function! Tab_MoveRight()
	let l:tabnr = tabpagenr() + 1
	if l:tabnr <= tabpagenr('$')
		exec 'tabmove '.l:tabnr
	endif
endfunc

noremap <silent><leader>tl :call Tab_MoveLeft()<cr>
noremap <silent><leader>tr :call Tab_MoveRight()<cr>
noremap <silent><m-left> :call Tab_MoveLeft()<cr>
noremap <silent><m-right> :call Tab_MoveRight()<cr>


"----------------------------------------------------------------------
" ALT 键移动增强
"----------------------------------------------------------------------

" ALT+h/l 快速左右按单词移动（正常模式+插入模式）
noremap <m-h> b
noremap <m-l> w
inoremap <m-h> <c-left>
inoremap <m-l> <c-right>

" ALT+j/k 逻辑跳转下一行/上一行（按 wrap 逻辑换行进行跳转） 
noremap <m-j> gj
noremap <m-k> gk
inoremap <m-j> <c-\><c-o>gj
inoremap <m-k> <c-\><c-o>gk

" 命令模式下的相同快捷
cnoremap <m-h> <c-left>
cnoremap <m-l> <c-right>

" ALT+y 删除到行末
noremap <m-y> d$
inoremap <m-y> <c-\><c-o>d$


"----------------------------------------------------------------------
" 窗口切换：ALT+SHIFT+hjkl
" 传统的 CTRL+hjkl 移动窗口不适用于 vim 8.1 的终端模式，CTRL+hjkl 在
" bash/zsh 及带文本界面的程序中都是重要键位需要保留，不能 tnoremap 的
"----------------------------------------------------------------------
noremap <m-h> <c-w>h
noremap <m-l> <c-w>l
noremap <m-j> <c-w>j
noremap <m-k> <c-w>k
noremap <m-H> <c-w>H
noremap <m-L> <c-w>L
noremap <m-J> <c-w>J
noremap <m-K> <c-w>K
noremap <m-o> <c-w>o
noremap <m-=> <c-w>=
noremap <m-v> <c-w>v
noremap <m-V> <c-w>s
inoremap <m-h> <esc><c-w>h
inoremap <m-l> <esc><c-w>l
inoremap <m-j> <esc><c-w>j
inoremap <m-k> <esc><c-w>k
inoremap <m-H> <esc><c-w>H
inoremap <m-L> <esc><c-w>L
inoremap <m-J> <esc><c-w>J
inoremap <m-K> <esc><c-w>K
inoremap <m-o> <esc><c-w>o
inoremap <m-=> <esc><c-w>=
inoremap <m-v> <esc><c-w>v
inoremap <m-V> <esc><c-w>s

if has('terminal') && exists(':terminal') == 2 && has('patch-8.1.1')
	" vim 8.1 支持 termwinkey ，不需要把 terminal 切换成 normal 模式
	" 设置 termwinkey 为 CTRL 加减号（GVIM），有些终端下是 CTRL+?
	" 后面四个键位是搭配 termwinkey 的，如果 termwinkey 更改，也要改
	set termwinkey=<c-_>
	tnoremap <m-H> <c-_>h
	tnoremap <m-L> <c-_>l
	tnoremap <m-J> <c-_>j
	tnoremap <m-K> <c-_>k
	tnoremap <m-q> <c-\><c-n>
elseif has('nvim')
	" neovim 没有 termwinkey 支持，必须把 terminal 切换回 normal 模式
	tnoremap <m-H> <c-\><c-n><c-w>h
	tnoremap <m-L> <c-\><c-n><c-w>l
	tnoremap <m-J> <c-\><c-n><c-w>j
	tnoremap <m-K> <c-\><c-n><c-w>k
	tnoremap <m-q> <c-\><c-n>
endif



"----------------------------------------------------------------------
" 编译运行 C/C++ 项目
" 详细见：http://www.skywind.me/blog/archives/2084
"----------------------------------------------------------------------

" 自动打开 quickfix window ，高度为 6
let g:asyncrun_open = 6

" 任务结束时候响铃提醒
let g:asyncrun_bell = 1

noremap <silent> <m-F12> :AsyncRun -cwd=<root> ./yeelight_gen_default.sh sunfish 0 && cp -fr builds/application*.bin /mnt/d/work/hardware<cr>

" 设置 F10 打开/关闭 Quickfix 窗口
"nnoremap <F10> :call asyncrun#quickfix_toggle(6)<cr>

" F9 编译 C/C++ 文件
"nnoremap <silent> <F9> :AsyncRun gcc -Wall -O2 "$(VIM_FILEPATH)" -o "$(VIM_FILEDIR)/$(VIM_FILENOEXT)" <cr>

" F5 运行文件
"nnoremap <silent> <F5> :call ExecuteFile()<cr>

" F7 编译项目
"nnoremap <silent> <F7> :AsyncRun -cwd=<root> make <cr>

" F8 运行项目
"nnoremap <silent> <F8> :AsyncRun -cwd=<root> -raw make run <cr>

" F6 测试项目
nnoremap <silent> <F6> :AsyncRun -cwd=<root> -raw make test <cr>

" 更新 cmake
nnoremap <silent> <F4> :AsyncRun -cwd=<root> cmake . <cr>

" Windows 下支持直接打开新 cmd 窗口运行
if has('win32') || has('win64')
	nnoremap <silent> <F8> :AsyncRun -cwd=<root> -mode=4 make run <cr>
endif


"----------------------------------------------------------------------
" F5 运行当前文件：根据文件类型判断方法，并且输出到 quickfix 窗口
"----------------------------------------------------------------------
function! ExecuteFile()
	let cmd = ''
	if index(['c', 'cpp', 'rs', 'go'], &ft) >= 0
		" native 语言，把当前文件名去掉扩展名后作为可执行运行
		" 写全路径名是因为后面 -cwd=? 会改变运行时的当前路径，所以写全路径
		" 加双引号是为了避免路径中包含空格
		let cmd = '"$(VIM_FILEDIR)/$(VIM_FILENOEXT)"'
	elseif &ft == 'python'
		let $PYTHONUNBUFFERED=1 " 关闭 python 缓存，实时看到输出
		let cmd = 'python "$(VIM_FILEPATH)"'
	elseif &ft == 'javascript'
		let cmd = 'node "$(VIM_FILEPATH)"'
	elseif &ft == 'perl'
		let cmd = 'perl "$(VIM_FILEPATH)"'
	elseif &ft == 'ruby'
		let cmd = 'ruby "$(VIM_FILEPATH)"'
	elseif &ft == 'php'
		let cmd = 'php "$(VIM_FILEPATH)"'
	elseif &ft == 'lua'
		let cmd = 'lua "$(VIM_FILEPATH)"'
	elseif &ft == 'zsh'
		let cmd = 'zsh "$(VIM_FILEPATH)"'
	elseif &ft == 'ps1'
		let cmd = 'powershell -file "$(VIM_FILEPATH)"'
	elseif &ft == 'vbs'
		let cmd = 'cscript -nologo "$(VIM_FILEPATH)"'
	elseif &ft == 'sh'
		let cmd = 'bash "$(VIM_FILEPATH)"'
	else
		return
	endif
	" Windows 下打开新的窗口 (-mode=4) 运行程序，其他系统在 quickfix 运行
	" -raw: 输出内容直接显示到 quickfix window 不匹配 errorformat
	" -save=2: 保存所有改动过的文件
	" -cwd=$(VIM_FILEDIR): 运行初始化目录为文件所在目录
	if has('win32') || has('win64')
		exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=4 '. cmd
	else
		exec 'AsyncRun -cwd=$(VIM_FILEDIR) -raw -save=2 -mode=0 '. cmd
	endif
endfunc



"----------------------------------------------------------------------
" F2 在项目目录下 Grep 光标下单词，默认 C/C++/Py/Js ，扩展名自己扩充
" 支持 rg/grep/findstr ，其他类型可以自己扩充
" 不是在当前目录 grep，而是会去到当前文件所属的项目目录 project root
" 下面进行 grep，这样能方便的对相关项目进行搜索
"----------------------------------------------------------------------
if executable('rg')
	noremap <silent><F2> :AsyncRun! -cwd=<root> rg -n --no-heading 
				\ --color never -g *.h -g *.c* -g *.py -g *.js -g *.vim 
				\ <C-R><C-W> "<root>" <cr>
elseif has('win32') || has('win64')
	noremap <silent><F2> :AsyncRun! -cwd=<root> findstr /n /s /C:"<C-R><C-W>" 
				\ "\%CD\%\*.h" "\%CD\%\*.c*" "\%CD\%\*.py" "\%CD\%\*.js"
				\ "\%CD\%\*.vim"
				\ <cr>
else
	noremap <silent><F2> :AsyncRun! -cwd=<root> grep -n -s -R <C-R><C-W> 
				\ --include='*.h' --include='*.c*' --include='*.py' 
				\ --include='*.js' --include='*.vim'
				\ '<root>' <cr>
endif


"----------------------------------------------------------------------
" window control, another ctrl: CTRL-W +/-, CTRL-W <>
"----------------------------------------------------------------------
noremap <silent><space>= :resize +3<cr>
noremap <silent><space>- :resize -3<cr>
noremap <silent><space>, :vertical resize -3<cr>
noremap <silent><space>. :vertical resize +3<cr>
noremap <silent><m-left> :vertical resize -5<cr>
noremap <silent><m-right> :vertical resize +5<cr>

noremap <silent><space>hh :nohl<cr>
noremap <silent><bs> :nohl<cr>:redraw!<cr>
noremap <silent><tab>, :call Tab_MoveLeft()<cr>
noremap <silent><tab>. :call Tab_MoveRight()<cr>
" noremap <silent><tab>6 :VinegarOpen leftabove vs<cr>
" noremap <silent><tab>7 :VinegarOpen vs<cr>
" noremap <silent><tab>8 :VinegarOpen belowright sp<cr>
" noremap <silent><tab>9 :VinegarOpen tabedit<cr>
noremap <silent><tab>0 :exe "NERDTree ".fnameescape(expand("%:p:h"))<cr>
noremap <silent><tab>y :exe "NERDTree ".fnameescape(asclib#path#get_root("%"))<cr>
noremap <silent><tab>g <c-w>p
noremap <silent><tab>q :q<cr>
noremap <silent><tab>t :%!xxd<cr>
noremap <silent><tab>r :%!xxd -r<cr>

noremap <silent><space>ha :GuiSignRemove
			\ errormarker_error errormarker_warning<cr>

" replace
noremap <space>p viw"0p
noremap <space>y yiw

" fast save
"noremap <C-S> :w<cr>
"inoremap <C-S> <ESC>:w<cr>

"noremap <silent><m-t> :tab term<cr>
noremap <silent><m-t> :vert term<cr>
inoremap <silent><m-t> <ESC>:vert term<cr>
noremap <silent><m-T> :tab term<cr>
inoremap <silent><m-T> <ESC>:tab term<cr>
noremap <silent><m-w> :tabnew<cr>
inoremap <silent><m-w> <ESC>:tabnew<cr>
noremap <silent><m-c> :bdelete %<cr>
inoremap <silent><m-c> <esc>:bdelete %<cr>
noremap <m-s> :w<cr>
inoremap <m-s> <esc>:w<cr>


"----------------------------------------------------------------------
" tasks
"----------------------------------------------------------------------
noremap <space>te :AsyncTaskEdit<cr>
noremap <space>tg :AsyncTaskEdit!<cr>
noremap <space>tt :AsyncTask file-build<cr>
noremap <space>tfr :AsyncTask file-run<cr>
noremap <space>tfd :AsyncTask file-debug<cr>
noremap <space>tpi :AsyncTask project-init<cr>
noremap <space>tpb :AsyncTask project-build<cr>
noremap <space>tpr :AsyncTask project-run<cr>
noremap <space>tpd :AsyncTask project-debug<cr>


nnoremap <m-z> za
nnoremap <m-Z> zA



"----------------------------------------------------------------------
" space + s : svn
"----------------------------------------------------------------------
noremap <space>sc :AsyncRun svn co -m "update from vim"<cr>
noremap <space>su :AsyncRun svn up<cr>
noremap <space>st :AsyncRun svn st<cr>

" editing commands
noremap <space>aa ggVG

"----------------------------------------------------------------------
" text-objects
"----------------------------------------------------------------------
"onoremap e :<c-u>normal! ggVG<cr>
vnoremap e ogg0oG$
onoremap il :<c-u>normal! v$o^oh<cr>
vnoremap il $o^oh
vnoremap // y/<c-r>"<cr>

"----------------------------------------------------------------------
" space + j : make
"----------------------------------------------------------------------
noremap <silent><space>j1  :AsyncRun -mode=term -pos=tab -cwd=<~/install/work/tmp/esp32_mi2x/miio_project> export PATH="/home/carlos/Work/xtensa-esp32-elf/bin:$PATH"; ./yeelight_gen_default.sh enzo 0<cr>
noremap <silent><space>j1  :AsyncRun -mode=term -pos=tab -cwd=<~/install/work/tmp/esp32_mi2x/miio_project> export PATH="/home/carlos/Work/xtensa-esp32-elf/bin:$PATH"; ./yeelight_gen_default.sh enzo 1<cr>
"noremap <silent><space>jc  :AsyncRun -cwd=<root> make clean<cr>
"noremap <silent><space>jk  :AsyncRun -mode=4 -cwd=<root> make run<cr>
"noremap <silent><space>jl  :AsyncRun -mode=4 -cwd=<root> make test<cr>
"noremap <silent><space>j1  :AsyncRun -mode=4 -cwd=<root> make t1<cr>
"noremap <silent><space>j2  :AsyncRun -mode=4 -cwd=<root> make t2<cr>
"noremap <silent><space>j3  :AsyncRun -mode=4 -cwd=<root> make t3<cr>
"noremap <silent><space>j4  :AsyncRun -mode=4 -cwd=<root> make t4<cr>
"noremap <silent><space>j5  :AsyncRun -mode=4 -cwd=<root> make t5<cr>
"noremap <silent><space>k1  :AsyncRun -cwd=<root> make t1<cr>
"noremap <silent><space>k2  :AsyncRun -cwd=<root> make t2<cr>
"noremap <silent><space>k3  :AsyncRun -cwd=<root> make t3<cr>
"noremap <silent><space>k4  :AsyncRun -cwd=<root> make t4<cr>
"noremap <silent><space>k5  :AsyncRun -cwd=<root> make t5<cr>


"----------------------------------------------------------------------
" space + t : toggle plugins
"----------------------------------------------------------------------
noremap <silent><S-F10> :call quickmenu#toggle(0)<cr>
inoremap <silent><S-F10> <ESC>:call quickmenu#toggle(0)<cr>
noremap <silent><M-;> :PreviewTag<cr>
noremap <silent><M-:> :PreviewClose<cr>
noremap <silent><tab>; :PreviewGoto edit<cr>
noremap <silent><tab>: :PreviewGoto tabe<cr>

noremap  <silent><M-u> :PreviewScroll -1<cr>
noremap  <silent><M-d> :PreviewScroll +1<cr>
inoremap <silent><M-u>  <c-\> <co>:PreviewScroll -1<cr>
inoremap <silent><M-d>  <c-\> <co>:PreviewScroll +1<cr>

if has('autocmd')
	function! s:quickfix_keymap()
		if &buftype != 'quickfix'
			return
		endif
		nnoremap <silent><buffer> p :PreviewQuickfix<cr>
		nnoremap <silent><buffer> P :PreviewClose<cr>
		nnoremap <silent><buffer> q :close<cr>
		setlocal nonumber
	endfunc
	function! s:insert_leave()
		if get(g:, 'echodoc#enable_at_startup') == 0
			set showmode
		endif
	endfunc
	augroup AscQuickfix
		autocmd!
		autocmd FileType qf call s:quickfix_keymap()
		autocmd InsertLeave * call s:insert_leave()
		" autocmd InsertLeave * set showmode
	augroup END
endif

nnoremap <silent><m-a> :PreviewSignature<cr>
inoremap <silent><m-a> <c-\><c-o>:PreviewSignature<cr>


"----------------------------------------------------------------------
" GUI/Terminal
"----------------------------------------------------------------------
noremap <silent><M-[> :call Tools_QuickfixCursor(2)<cr>
noremap <silent><M-]> :call Tools_QuickfixCursor(3)<cr>
noremap <silent><M-{> :call Tools_QuickfixCursor(4)<cr>
noremap <silent><M-}> :call Tools_QuickfixCursor(5)<cr>
"noremap <silent><M-u> :call Tools_PreviousCursor(6)<cr>
"noremap <silent><M-d> :call Tools_PreviousCursor(7)<cr>

inoremap <silent><M-[> <c-\><c-o>:call Tools_QuickfixCursor(2)<cr>
inoremap <silent><M-]> <c-\><c-o>:call Tools_QuickfixCursor(3)<cr>
inoremap <silent><M-{> <c-\><c-o>:call Tools_QuickfixCursor(4)<cr>
inoremap <silent><M-}> <c-\><c-o>:call Tools_QuickfixCursor(5)<cr>
"inoremap <silent><M-u> <c-\><c-o>:call Tools_PreviousCursor(6)<cr>
"inoremap <silent><M-d> <c-\><c-o>:call Tools_PreviousCursor(7)<cr>


"----------------------------------------------------------------------
" space + f + num: session management
"----------------------------------------------------------------------
set ssop-=options    " do not store global and local values in a session
" set ssop-=folds      " do not store folds

for s:index in range(5)
	exec 'noremap <silent><space>f'.s:index.'s :mksession! ~/.vim/session.'.s:index.'<cr>'
	exec 'noremap <silent><space>f'.s:index.'l :so ~/.vim/session.'.s:index.'<cr>'
endfor


"----------------------------------------------------------------------
" leader + b/c : buffer
"----------------------------------------------------------------------
noremap <silent><leader>bc :BufferClose<cr>
noremap <silent><leader>cw :call Change_DirectoryToFile()<cr>


"----------------------------------------------------------------------
" space + h : fast open files
"----------------------------------------------------------------------
noremap <space>hp :FileSwitch tabe ~/hss/5g_core/.note<cr>
noremap <space>hl :FileSwitch tabe ~/.vim/cloud/Documents/agenda.otl<cr>
noremap <space>hf <C-W>gf
noremap <space>he :call Show_Explore()<cr>
noremap <space>hb :FileSwitch tabe ~/.vim/bundle.vim<cr>
noremap <space>hq :FileSwitch tabe ~/.vim/quicknote.txt<cr>
noremap <space>hg :FileSwitch tabe ~/.vim/scratch.txt<cr>
noremap <space>hd :FileSwitch tabe ~/Dropbox/Documents/notes.txt<cr>
noremap <space>ho :FileSwitch tabe ~/.vim/cloud/Documents/cloudnote.txt<cr>
noremap <space>hi :FileSwitch tabe ~/.vim/tasks.ini<cr>
noremap <space>h; :call asclib#nextcloud_sync()<cr>

if (!has('nvim')) && (has('win32') || has('win64'))
	noremap <space>hr :FileSwitch tabe ~/_vimrc<cr>
elseif !has('nvim')
	noremap <space>hr :FileSwitch tabe ~/.vimrc<cr>
	noremap <space>hk :FileSwitch tabe ~/.vim/vim-init/init/init-keymaps.vim<cr>
else
	noremap <space>hr :FileSwitch tabe ~/.config/nvim/init.vim<cr>
endif


"----------------------------------------------------------------------
" visual mode
"----------------------------------------------------------------------
vnoremap <space>gp :!python<cr>
" vmap <space>gs y/<c-r>"<cr>
vmap <space>vs y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
vmap <space>vr y:%s/<C-R>=escape(@", '\\/.*$^~[]')<CR>//gc<Left><Left><Left>


autocmd BufWritePre *.c,*.cc,*.cpp,*.h,*.hpp  :%s/\s\+$//e
augroup mk_file
    autocmd!
    autocmd BufReadPost *.c,*.cc,*.cpp,*.cxx,*.h,*.hpp,.bash_aliases :set expandtab
augroup END
augroup log_file
    autocmd!
    "autocmd BufWinEnter NGC_* silent exec 'lv /Event\ Triggered\ \:/gj % '| lop | normal <c-w>k
augroup END
autocmd FileType qf wincmd L
autocmd BufEnter *.tsv lcd %:p:h
autocmd FileType xml nnoremap <buffer> <Leader>f :%!xmllint --format -<CR>
autocmd FileType json nnoremap <buffer> <Leader>f :%!jq .<CR>

noremap Q :qa<CR>
noremap <space>cp :set nonumber norelativenumber <bar> SignifyDisable<CR>
noremap <silent>cc :ApcEnable <cr>
nnoremap <leader>lv :lv /Event\ Triggered\ \:/gj % <cr> :lop<cr> \| <c-w>k
noremap <leader>v :set expandtab <bar> :retab<cr>
nnoremap <space>mtl :exe "e " . trim(system("ls -t $HOME/hss/ims_mt/logs/TC_IMS* \| head -1 \| xargs realpath"))<CR>
noremap <leader>p <ESC>"0p

command LV :exec 'lv /' . expand("<cword>") . '/gj ' . expand('%') | lop
command! Difft NERDTreeCLose | windo diffthis
command! Diffo windo diffoff
