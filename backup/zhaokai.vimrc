"
"基础设置
set shell=/bin/sh
set number
set noshowmode
set cindent
set expandtab              " Use spaces instead of tabs.
set softtabstop =4         " Tab key indents by 4 spaces.
set shiftwidth  =4         " >> indents by 4 spaces
set showmatch
set cursorline
set autoindent
set hidden                 " Switch between buffers without having to save first.
syntax enable
set encoding=utf-8
set signcolumn=yes
set showcmd
set updatetime=300
set termguicolors
set clipboard=unnamed


colorscheme material


highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

"Remap Key

noremap ; :
let mapleader=" "
inoremap jk <ESC>

" Symbol renaming.
nmap <leader>n <Plug>(coc-rename)

"Plug
call plug#begin(get(g:,'bundle_home', '~/.vim/bundles'))
Plug 'mhinz/vim-signify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
Plug 'jackguo380/vim-lsp-cxx-highlight'
Plug 'morhetz/gruvbox'
Plug 'puremourning/vimspector',
call plug#end()

""""lightline
let g:lightline = {
            \ 'colorscheme': 'material_vim'
            \ }

""""COC
autocmd CursorHold * silent call CocActionAsync('highlight')

inoremap <silent><expr> <TAB>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<TAB>" :
            \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position.
" " Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <leader>d <Plug>(coc-definition)
nmap <leader>y <Plug>(coc-type-definition)
" nmap <leader>i <Plug>(coc-implementation)
nmap <leader>r <Plug>(coc-references)

nnoremap <silent><nowait> <space>s  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <leader>S  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <leader>e  :<C-u>CocCommand explorer<cr>
nnoremap <silent><nowait> <leader>h  :<C-u>CocCommand clangd.switchSourceHeader<cr>

"highlight CocErrorSign guifg=#b16286
"highlight CocInfoSign guifg=#8fa1b3
"highlight CocWarningSign guifg=#ebcb8b
"highlight CocHintSign guifg=#8fa1b3

""LeaderF

let g:Lf_ShortcutF = '<c-p>'
let g:Lf_ShortcutB = '<m-n>'
noremap <c-n> :LeaderfMru<cr>
noremap <m-p> :LeaderfFunction!<cr>
noremap <m-j> :<C-U><C-R>=printf("Leaderf! rg -e %s -g !*.json", expand("<cword>"))<CR><CR>
noremap <m-m> :LeaderfTag<cr>
noremap <m-n> :LeaderfBuffer<cr>


let g:Lf_WindowPosition = 'popup'
let g:Lf_PreviewInPopup = 1

let g:Lf_ShowDevIcons = 1
let g:Lf_StlSeparator = { 'left': '', 'right': '', 'font': '' }
let g:Lf_RootMarkers = ['.porject']
let g:Lf_GtagsAutoGenerate = 1
let g:Lf_Gtagslabel = 'native-pygments'
let g:Lf_WorkingDirectoryMode = 'Ac'
let g:Lf_WindowHeight = 0.30
let g:Lf_CacheDirectory = expand('~/.vim/cache')
let g:Lf_ShowRelativePath = 0
let g:Lf_HideHelp = 1
let g:Lf_StlColorscheme = 'powerline'
let g:Lf_PreviewResult = {'Function':0, 'BufTag':0}

let g:Lf_WildIgnore = {
            \ 'dir': ['.svn','.git','.hg','.vscode','.wine','.deepinwine','.oh-my-zsh','.clangd','.cache','build','builds'],
            \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','*.json','*.d','*.map','*.idx']
            \ }



let g:vimspector_enable_mappings = 'HUMAN'
"noremap <C-F5>:VimspectorReset<cr>
