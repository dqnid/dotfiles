set nu rnu
syntax on
set expandtab
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
set spelllang=es,cjk
set t_Co=256
set encoding=UTF-8
set updatetime=300

set signcolumn=yes

call plug#begin(system('echo -n "${XDG_CONFIG_HOME:-$HOME/.config}/nvim/plugged"'))
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }
Plug 'emakman/nvim-latex-previewer'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'frazrepo/vim-rainbow'
Plug 'itchyny/vim-cursorword'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-sandwich'
Plug 'ryanoasis/vim-devicons'

" Themes
Plug 'EdenEast/nightfox.nvim'
Plug 'bluz71/vim-moonfly-colors', { 'branch': 'cterm-compat' }
Plug 'projekt0n/github-nvim-theme'
Plug 'tomasiser/vim-code-dark'

" Folder tree
Plug 'nvim-tree/nvim-web-devicons'
Plug 'nvim-tree/nvim-tree.lua'

" Git comparison
Plug 'nvim-lua/plenary.nvim'
Plug 'sindrets/diffview.nvim'

" FZF mid screen
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }

" Modern tabs
Plug 'romgrk/barbar.nvim'
call plug#end()

inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"
nnoremap <C-n> :NvimTreeToggle<CR>
nmap <C-f> :Telescope find_files<CR>
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l
nmap <C-t> :tabnew<CR>
nmap <C-q> :BufferClose<CR>
nmap <Tab> :BufferNext<CR>
nmap <C-e> :DiffviewOpen<CR>
nmap <C-p> :LatexPreviewToggle<CR>

" Completar con tab
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Completar con intro
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
\:"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Resaltar símbolo y sus referencias con cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:livepreview_previewer = 'mupdf'
let g:livepreview_engine = 'pdflatex'

let g:rainbow_active = 0
let g:rainbow_load_separately = [
    \ [ '*' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.tex' , [['(', ')'], ['\[', '\]']] ],
    \ [ '*.cpp' , [['(', ')'], ['\[', '\]'], ['{', '}']] ],
    \ [ '*.{html,htm}' , [['(', ')'], ['\[', '\]'], ['{', '}'], ['<\a[^>]*>', '</[^>]*>']] ],
    \ ]

let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

let g:airline_theme='minimalist'
colorscheme moonfly

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 1

let g:ale_linters = {
    \ 'python': ['pylint'],
    \ 'vim': ['vint'],
    \ 'cpp': ['clang'],
    \ 'c': ['clang'],
\}

" ctrl-space para abrir completar
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" launch file tree
lua vim.g.loaded_netrw = 1
lua vim.g.loaded_netrwPlugin = 1
lua require("nvim-tree").setup()

" Old options
"
" Plug 'preservim/nerdTree'
"
"colorscheme codedark
"colorscheme github_dark_default
"let g:NERDTreeDirArrowExpandable = ''
"let g:NERDTreeDirArrowCollapsible = ''
" enable line numbers
" make sure relative line numbers are used
"autocmd FileType nerdtree setlocal relativenumber
