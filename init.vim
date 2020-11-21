call plug#begin('~/.vim/plugged') 

" Install language client plugin
" Note: on windows systems that don't have bash replace the 'do' line with 'do': 'powershell install.ps1',
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

" Multi-entry selection UI for things like find all references
Plug 'junegunn/fzf'

Plug 'cespare/vim-toml'

call plug#end()

" Enable built in debugging
packadd termdebug

" Set language servers
let g:LanguageClient_serverCommands = { 'cpp': ['clangd'], 'rust': ['rls'] } " , 'javascript': ['javascript-typescript-langserver'] }

nnoremap <F4> :call LanguageClient_contextMenu()<CR>

" Get info about the symbol the cursor is on
nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>

" Go to defintion
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>

" Rename symbol (Like :%s but respects scope)
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR> 

nmap <C-g> :call LanguageClient#textDocument_references()<CR>

" Map control-f to auto complete because constrol-x, control-o is an obnoxious
" combination
imap <C-f> <C-x><C-o>

" F5 starts the debugger in visual studio, so lets make it do the same thing
" in vim!
nmap <F5> :Termdebug<CR>i

" I thing hitting Ctrl-\ followed by Ctrl-n is obnoxious for leaving terminal
" mode. Lets make it act more like insert mode
tmap <ESC> <C-\><C-n>

" Arrow operator
imap <C-l> ->

" Move lines up and down
nmap <C-j> :m+<CR>
nmap <C-k> :m-2<CR>

" Un-highlight things
nmap <C-n> :noh<CR>


" Convert tab to space; tabwidth is 4; smart indentation
set tabstop=4
set shiftwidth=4
set smartindent
set autoindent
set expandtab

" Enable mouse
set mouse=a
" Highlight search results
set hlsearch

" Smart line breaking
set linebreak
set breakindent
set breakindentopt=shift:2

" Show absolute line number for the line you're on and relative line numbers
" for surrounding lines
set number relativenumber 

" Set a colored column at column 120 to make me think about it when I cram
" too much on a single line of code
set colorcolumn=120

" Spellcheck language: English
set spelllang=en

" LaTex: spellchecking`
autocmd FileType text,tex,latex,plaintex setlocal spell

" Keep at least 8 lines on either side of the cursor visible
set scrolloff=8

