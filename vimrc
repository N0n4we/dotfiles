let mapleader = " "
set clipboard^=unnamed
set noswapfile
set nocompatible
set signcolumn=no
syntax on
filetype plugin indent on
let g:markdown_fenced_languages = [
      \ 'python',
      \ 'bash=sh',
      \ 'sh',
      \ 'javascript',
      \ 'typescript',
      \ 'go',
      \ 'rust',
      \ 'lua',
      \ 'json',
      \ 'yaml',
      \ 'html',
      \ 'css',
      \ ]
set nonumber
set norelativenumber
set wrap
set linebreak
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set breakindent
set showbreak=>>
set ambiwidth=single
set ignorecase
set smartcase
set shortmess+=I
set laststatus=0
set background=dark

autocmd VimEnter * call setreg('+', getreg('+'))
" autocmd BufWritePre * %s/\s\+$//e
" autocmd BufWritePre * %s/\n\+\%$//e

nnoremap <leader>x :bd<CR>
nnoremap <leader>X :bd!<CR>
nnoremap <Esc>w :set wrap!<CR>
vnoremap <Esc>w :<C-u>set wrap!<CR>
nnoremap <Esc>a :!alacritty msg create-window --working-directory $(pwd)<CR>
nnoremap <Esc>s :!alacritty msg create-window --working-directory $(pwd) -e bash -ic y<CR>

nnoremap <leader>e :Ex<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>Q :q!<CR>

set completeopt=menu,menuone,noselect
set complete=.,w,b,u,t,i

let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
let g:EasyMotion_smartcase = 1

let g:VM_maps = {}
let g:VM_maps["Add Cursor Down"] = '<C-j>'
let g:VM_maps["Add Cursor Up"] = '<C-k>'
let g:VM_maps["Visual Regex"] = '<C-h>'

packadd coc.nvim
let g:coc_global_extensions = ['coc-tsserver', 'coc-json', 'coc-pyright', 'coc-rust-analyzer', 'coc-go', 'coc-clangd']

set nobackup
set nowritebackup
set updatetime=300
call coc#config('suggest.noselect', v:true)

" Trigger completion with Tab and navigate the completion menu
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Diagnostics and code navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)
