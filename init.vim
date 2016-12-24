:imap fd <Esc>

" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Use one space, not two, after punctuation.
set nojoinspaces

" Make it obvious where 80 characters is
set textwidth=80
set colorcolumn=+1

" Numbers
set number
set numberwidth=5

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :TestFile<CR>
nnoremap <silent> <Leader>s :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l

" Quicker buffer movement
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>

call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'neomake/neomake'

Plug 'sheerun/vim-polyglot'

Plug 'Valloric/YouCompleteMe'

Plug 'xolox/vim-misc'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'majutsushi/tagbar'

Plug 'tpope/vim-surround'

Plug 'MarcWeber/vim-addon-mw-utils'

Plug 'tomtom/tlib_vim'

Plug 'SirVer/ultisnips'

Plug 'honza/vim-snippets'

Plug 'altercation/vim-colors-solarized'

Plug 'vim-airline/vim-airline'

Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-fugitive'

Plug 'easymotion/vim-easymotion'

Plug 'airblade/vim-gitgutter'

" Go
Plug 'fatih/vim-go'

" Javascript
Plug 'ternjs/tern_for_vim'

Plug 'benjie/neomake-local-eslint.vim'

call plug#end()

set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Neomake makers
let g:neomake_jsx_enabled_makers = ['eslint']

" Neomake
autocmd! BufEnter,BufWritePost * Neomake
let g:neomake_warning_sign = {
  \ 'text': 'W',
  \ 'texthl': 'WarningMsg',
  \}

let g:neomake_error_sign = {
  \ 'text': 'E',
  \ 'texthl': 'ErrorMsg',
  \}

" Neomake keybindings
nmap <Leader>o :lopen<CR>
nmap <Leader>c :lclose<CR>
nmap <Leader>, :ll<CR>
nmap <Leader>n :lnext<CR>
nmap <Leader>p :lprev<CR>

" Configure CtrlP to ingore git ignored files
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-strandard']

" Tern
let g:tern_map_keys=1
let g:tern_show_argument_hints='on_hold'

"Airline
let g:airline#extensions#tabline#enable = 1


