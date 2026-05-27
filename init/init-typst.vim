"======================================================================
"
" init-typst.vim - Typst 文件类型专属配置
"
"   - 文件类型识别 (*.typ / *.typst → filetype=typst)
"   - tinymist LSP（通过 coc-settings.json 的 languageserver.tinymist 启动）
"   - vim-table-mode 自动启用（配合 tablem 包写 markdown 风管道表格）
"   - <leader>tc 编译 / <leader>tw watch / <leader>tp 打开 PDF
"   - gd/gr/K/<leader>f/<leader>rn 用 coc 接管 LSP 标准动作
"   - <C-x><C-k> 数学符号字典补全（typst-math.txt）
"
" 依赖：
"   - kaarmu/typst.vim (init-plugins.vim filetypes 组里已加)
"   - vim-table-mode (init-plugins.vim markdown 组，已扩展到 typst)
"   - tinymist 二进制（~/.local/bin/tinymist）
"   - coc.nvim + coc-settings.json 里 languageserver.tinymist 配置块
"
"======================================================================
" vim: set ts=4 sw=4 tw=78 noet :


let s:home = fnamemodify(resolve(expand('<sfile>:p')), ':h:h')

"----------------------------------------------------------------------
" 文件类型识别（kaarmu/typst.vim 也会自动加，这里加一层保险）
"----------------------------------------------------------------------
augroup TypstFileType
	autocmd!
	autocmd BufNewFile,BufRead *.typ,*.typst setfiletype typst
augroup END


"----------------------------------------------------------------------
" Typst 文件打开时执行的初始化
" 用 silent! 包住所有依赖外部插件的命令，避免插件未加载时报错
"----------------------------------------------------------------------
function! s:typst_setup() abort
	"--- 缩进与折行 ---
	setlocal expandtab
	setlocal tabstop=2
	setlocal shiftwidth=2
	setlocal softtabstop=2
	setlocal textwidth=0
	setlocal wrap
	setlocal linebreak
	setlocal conceallevel=0

	"--- 数学符号字典补全（<C-x><C-k>） ---
	execute 'setlocal dictionary+='.s:home.'/spell/typst-math.txt'
	setlocal complete+=k

	"--- vim-table-mode 自动启用（写管道表格即时对齐）---
	" 用 exists() 检测，比 silent! 更明确——
	" 如果用户禁用了 markdown bundle 导致 table-mode 没装，提示一次
	if exists(':TableModeEnable')
		let b:table_mode_corner = '|'
		let b:table_mode_corner_corner = '|'
		let b:table_mode_header_fillchar = '-'
		" 用 silent 抑制 "Table Mode Enabled" 提示，避免触发 hit-enter prompt
		silent TableModeEnable
	endif

	"--- coc LSP 快捷键（仅当 coc 加载时绑） ---
	if exists('*CocActionAsync')
		nmap <silent> <buffer> gd <Plug>(coc-definition)
		nmap <silent> <buffer> gy <Plug>(coc-type-definition)
		nmap <silent> <buffer> gi <Plug>(coc-implementation)
		nmap <silent> <buffer> gr <Plug>(coc-references)
		nmap <silent> <buffer> <leader>f <Plug>(coc-format)
		nmap <silent> <buffer> <leader>rn <Plug>(coc-rename)
		nnoremap <silent> <buffer> K :call CocActionAsync('doHover')<CR>
	endif

	"--- 编译 / watch / 预览（用 asyncrun 跟韦神风格一致） ---
	if exists(':AsyncRun')
		nnoremap <silent> <buffer> <leader>tc :AsyncRun -cwd=$(VIM_FILEDIR) typst compile %<CR>
		nnoremap <silent> <buffer> <leader>tw :AsyncRun -mode=async typst watch %<CR>
	else
		nnoremap <silent> <buffer> <leader>tc :!typst compile %<CR>
		nnoremap <silent> <buffer> <leader>tw :!typst watch % &<CR>
	endif

	"--- 用系统默认 viewer 打开 PDF（Linux: xdg-open / macOS: open） ---
	if has('mac')
		nnoremap <silent> <buffer> <leader>tp :!open %:r.pdf<CR>
	elseif has('unix')
		nnoremap <silent> <buffer> <leader>tp :!xdg-open %:r.pdf &<CR>
	elseif has('win32') || has('win64')
		nnoremap <silent> <buffer> <leader>tp :!start "" "%:r.pdf"<CR>
	endif
endfunction


"----------------------------------------------------------------------
" 用 augroup 挂到 FileType typst（韦神风格：所有 ft 钩子都用 augroup）
"----------------------------------------------------------------------
augroup TypstSetup
	autocmd!
	autocmd FileType typst call s:typst_setup()
augroup END
