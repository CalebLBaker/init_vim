call plug#begin('~/.vim/plugged') 

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" (Optional) Multi-entry selection UI.
Plug 'junegunn/fzf'

call plug#end()

let g:LanguageClient_serverCommands = { 'cpp': ['clangd'], }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR> 

imap <C-l> ->

" Move lines up and down
nmap <C-j> :m+<CR>
nmap <C-k> :m-2<CR>

" Un-highlight things
nmap <C-n> :noh<CR>
nmap <C-c> :set norelativenumber!<CR>

" Convert tab to space; tabwidth is 4; smart indentation
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent

set mouse=a					" Enable mouse
set hlsearch				" Highlight search results

" Smart line breaking
set linebreak
set breakindent
set breakindentopt=shift:2

set number relativenumber 

set colorcolumn=120

" Spellcheck language: English
set spelllang=en

" LaTex: spellchecking`
autocmd FileType text,tex,latex,plaintex setlocal spell
