

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A minimalist Vim plugin manager
" https://github.com/junegunn/vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
  Plug 'tomasiser/vim-code-dark'
  Plug 'pangloss/vim-javascript'
  Plug 'itchyny/lightline.vim'
  Plug 'itchyny/vim-gitbranch'
  Plug 'szw/vim-maximizer'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'noahfrederick/vim-noctu'
  Plug 'kassio/neoterm'
  Plug 'tpope/vim-commentary'
  Plug 'sbdchd/neoformat'
  Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
  Plug 'junegunn/fzf.vim'
  Plug 'tpope/vim-fugitive'
  Plug 'airblade/vim-gitgutter'
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/completion-nvim'
  Plug 'janko/vim-test'
  Plug 'puremourning/vimspector'
  Plug 'pixelneo/vim-python-docstring'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" default options
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \ exe "norm g`\"" |
      \ endif
highlight BadWhitespace ctermbg=red guibg=darkred
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
set paste " 붙여넣기 계단현상 없애기
set completeopt=menuone,noinsert,noselect
set mouse=a
"set splitright
"set splitbelow
set expandtab
set tabstop=2
set shiftwidth=2
set number
set ignorecase
set smartcase
set incsearch
set diffopt+=vertical
set hidden
set nobackup
set nowritebackup
set cmdheight=1
set shortmess+=c
set signcolumn=yes
set updatetime=750
let mapleader=","
if has("syntax")
syntax on
endif
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
if (has("termguicolors"))
	set termguicolors
endif
let g:netrw_banner=0
let g:markdown_fenced_languages = ['javascript', 'js=javascript', 'json=javascript']
nnoremap <leader>v :e $MYVIMRC<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tomassier/vim-code-dark
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
colorscheme codedark
let g:lightline = {
      \ 'active' : {
      \   'left' : [ [ 'mode', 'paste'],
      \              [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function' : {
      \   'gitbranch' : 'gitbranch#name'
      \ },
      \ 'colorscheme': 'codedark',
      \ }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" szw/vim-maximier
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>m :MaximizerToggle!<CR>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" kassio/neoterm
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 let g:neoterm_default_mod = 'vertical'
 let g:neoterm_zie = 60
 let g:neoterm_autoinert = 1
 nnoremap <c-q> :Ttoggle<CR>
 inoremap <c-q> <Esc>:Tttoggle<CR>
 tnoremap <c-q> <c-\><c-n>:Ttoggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" sbdchd/neoformat
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>F :Neoformat prettier<CR>

let g:neoformat_python_autopep8 = {
            \ 'exe': 'autopep8',
            \ 'args': ['-s 4', '-E'],
            \ 'replace': 1,
            \ 'stdin': 1,
            \ 'env': ["DEBUG=1"],
            \ 'valid_exit_codes': [0, 23],
            \ 'no_append': 1,
            \ }

let g:neoformat_enabled_python = ['autopep8']
let g:neoformat_try_formatprg = 1
" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

let g:neoformat_run_all_formatters = 1

let b:neoformat_run_all_formatters = 1
let b:neoformat_basic_format_retab = 0

let g:neoformat_only_msg_on_error = 1


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" junegunn/fzf.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
 " open buffers
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>gf :GFiles<CR>
nnoremap <leader>gf? :GFiles?<CR>
nnoremap <leader>ff :Rg<CR>
inoremap <expr> <c-x><c-f> fzf#vim#complete#path(
      \ "find . -path '*/\.*' -prune -o -print \| sed '1d;s:^..::'",
      \ fzf#wrap({'dir': expand('%:p:h')}))

if has('nvim')
  au! TermOpen * tnoremap <buffer> <Esc> <c-\><c-n>
  au! FileType fzf tunmap <buffer> <Esc>
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" tpope/vim-fugitive
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>gg :G<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neovim/nvim-lspconfig and nvim-lua/completion-nvim
" https://github.com/neovim/nvim-lspconfig
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF
require'lspconfig'.pyright.setup{}
EOF
"lua require'lspconfig'.tsserver.setup{ on_attach=require'completion'.on_attach }

nnoremap <silent> gd      <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gh      <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gH      <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> gD      <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k>   <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> gr      <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gR      <cmd>lua vim.lsp.buf.rename()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" janko/vim-test
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> tt :TestNearest<CR>
nnoremap <silent> tf :TestFile<CR>
nnoremap <silent> ts :TestSuite<CR>
nnoremap <silent> t_ :TestLast<CR>

let test#strategy = 'neovim'
let test#neovim#term_position = 'vertical'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" puremourning/vimspector
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" https://github.com/puremourning/vimspector#human-mode
let g:vimspector_enable_mappings = 'HUMAN'

" for normal mode - the word under the cursor
nmap <Leader>di <Plug>VimspectorBalloonEval
" for visual mode, the visually selected text
xmap <Leader>di <Plug>VimspectorBalloonEval


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 'pixelneo/vim-python-docstring'
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <silent> doc      :Docstring<CR>
