let mapleader = " "
set clipboard^=unnamed
set noswapfile
set nocompatible
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

autocmd VimEnter * call setreg('+', getreg('+'))
autocmd BufWritePre * %s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

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
