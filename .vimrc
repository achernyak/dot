:imap fd <Esc>
let mapleader = " "
let g:mapleader = " "

" general
set noerrorbells
set backspace=indent,eol,start   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set noshowmode
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands
set lazyredraw
set hidden
set ttyfast
set smarttab
set wildmenu
set spell spelllang=en_us

" folds
set foldmethod=syntax
set nofoldenable
nnoremap zA za
nnoremap za zA

" speed up syntax highlighting
syntax on
set nocursorcolumn
set nocursorline

" softwrap
set wrap
set linebreak
set nolist
set formatoptions=qrn1
set textwidth=79
set colorcolumn=+1

set autoindent
set complete-=i
set showmatch
set smarttab

" Softtabs, 4 spaces
set et
set tabstop=4
set shiftwidth=4
set shiftround
set expandtab

" Time out on key codes but no mappings.
set notimeout
set ttimeout
set ttimeoutlen=10

" Use one space, not two, after punctuation.
set nojoinspaces

" Numbers
set number
set numberwidth=5

" Better Completion
set complete=.,w,b,u,t

" Switch between the last two files
nnoremap <Leader>b <c-^>

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
nnoremap <silent> <Leader>gt :TestVisit<CR>

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
nnoremap <BS> <C-w>h
nnoremap <C-l> <C-w>l

" Open file relative to the current file
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Better CTRL-U
inoremap <C-U> <C-G>u<C-U>

" search
set gdefault
set incsearch     " do incremental searching
set ignorecase    " Search case insensitive...
set smartcase     " ... but not when search pattern contains upper case chars
nnoremap ,, :nohlsearch<CR>

" NetRW
let g:netrw_liststyle = 1
let g:netrw_sizwstyle = "H"
let g:netrw_banner = 0

if has('mouse')
  set mouse=a
endif

" Backup, Swap and Undo
set undofile
set directory=~/.vim/swap,/tmp
set backupdir=~/.vim/backup,/tmp
set undodir=~/.vim/undo,/tmp

" If linux then set ttymouse
let s:uname = system("echo -n \"$(uname)\"")
if !v:shell_error && s:uname == "Linux" && !has('nvim')
  set ttymouse=xterm
endif

if &history < 1000
  set history=50
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

call plug#begin('~/.vim/plugged')
    " Basics
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    Plug 'tpope/vim-unimpaired'
    Plug 'sheerun/vim-polyglot'

    " General Functionality
    Plug 'ervandew/supertab'
    Plug 'tpope/vim-surround'
    Plug 'w0rp/ale'
    Plug 'jiangmiao/auto-pairs'
    Plug 'sjl/gundo.vim'
    Plug 'godlygeek/tabular'
    Plug 'tpope/vim-commentary'
    Plug 'chiel92/vim-autoformat'
    Plug 'vimwiki/vimwiki'

    " Utils
    Plug 'jaawerth/nrun.vim'

    " Visual
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
    Plug 'altercation/vim-colors-solarized'

    " FZF
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
    Plug 'junegunn/fzf.vim'

    " Snippets
    Plug 'SirVer/ultisnips'
    Plug 'honza/vim-snippets'

    " Git
    Plug 'airblade/vim-gitgutter'
    Plug 'tpope/vim-fugitive'

    " Markdown
    Plug 'plasticboy/vim-markdown'
    Plug 'mzlogin/vim-markdown-toc'

    " Python
    Plug 'davidhalter/jedi-vim'

    " Go
    Plug 'fatih/vim-go'

    " Rails
    Plug 'tpope/vim-rails'

    " Rust
    Plug 'racer-rust/vim-racer'
call plug#end()

set background=light
let g:solarized_termcolors=256
let g:solarized_termtrans=1
colorscheme solarized

" Only do this part when compiled with support for autocommands.
if has("autocmd")

    " Enable file type detection.
    " Use the default filetype settings, so that mail gets 'tw' set to 72,
    " 'cindent' is on in C files, etc.
    " Also load indent files, to automatically do language-dependent indenting.
    filetype plugin indent on

    runtime macros/matchit.vim

    " Put these in an autocmd group, so that we can delete them easily.
    augroup vimrcEx
        au!

        " Line wrapping for mutt
        autocmd BufRead /tmp/mutt-* setlocal tw=72

        " When editing a file, always jump to the last known cursor position.
        " Don't do it when the position is invalid or when inside an event handler
        " (happens when dropping a file on gvim).
        " Also don't do it when the mark is in the first line, that is the default
        " position when opening a file.
        autocmd BufReadPost *
            \ if line("'\"") > 1 && line("'\"") <= line("$") |
            \	exe "normal! g`\"" |
            \ endif

    augroup END

else
endif " has("autocmd")

" Markdown
let g:markdown_folding = 1
let g:vim_markdown_no_default_key_mappings = 0

" JavaScript
let g:jsx_ext_required = 0

" Go
if fnamemodify(expand('%'), ':e') == "go"
  let b:SuperTabDefaultCompletionType = "<C-x><C-o>"
endif
let g:go_fmt_command = "goimports"

" Rust
let g:racer_cmd = "racer"
let g:racer_experimental_completer = 1
let g:ale_rust_cargo_use_check = 1

" Vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]
let g:vimwiki_global_ext = 0
let g:vimwiki_table_mappings = 0

" UltiSnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

"Airline
let g:airline#extensions#tabline#enable=1
let g:airline_powerline_fonts=1
let g:airline_theme='solarized'

" Ale
let g:ale_lint_on_text_changed = 0
let g:ale_lint_on_save = 1

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'python': ['pycodestyle'],
\   'rust': ['cargo'],
\}

let g:ale_fixers = {
\   'javascript': ['eslint'],
\   'python': ['autopep8'],
\   'rust': ['cargo'],
\}

let g:ale_linter_aliases = {
\   'javacript.jsx': 'javascript',
\   'jsx': 'javascript'
\}

" Ale keybindings
nmap <Leader>o :lopen<CR>
nmap <Leader>c :lclose<CR>
nmap <Leader>, :ll<CR>
nmap <Leader>n :lnext<CR>
nmap <Leader>p :lprev<CR>

"FZF
nmap <C-p> :Files<CR>
nmap gb :Buffers<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }
let g:fzf_layout = { 'down': '~40%' }
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
let g:fzf_history_dir = '~/.local/share/fzf-history'
let g:fzf_files_options =
  \ '--preview "(highlight -O ansi {} || cat {}) 2> /dev/null | head -'.&lines.'"'
let g:fzf_buffers_jump = 1
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'
let g:fzf_tags_command = 'ctags -R'
let g:fzf_commands_expect = 'alt-enter,ctrl-x'

command! -bang Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)

command! -bang -nargs=* Find 
  \ call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
