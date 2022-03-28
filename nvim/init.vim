"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""     
"                                                                               
"     ███████╗██╗   ██╗██╗   ██╗███████╗██╗                                     
"     ██╔════╝╚██╗ ██╔╝██║   ██║██╔════╝██║           _   _  _ __ __ ___  ___   
"     █████╗   ╚████╔╝ ██║   ██║█████╗  ██║          | \ / || |  V  | _ \/ _/   
"     ██╔══╝    ╚██╔╝  ██║   ██║██╔══╝  ██║        _ `\ V /'| | \_/ | v / \__   
"     ███████╗   ██║   ╚██████╔╝███████╗███████╗  |_|  \_/  |_|_| |_|_|_\\__/   
"     ╚══════╝   ╚═╝    ╚═════╝ ╚══════╝╚══════╝                                
"                                                                               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Fundamentals -----------------------------------------------------------{{{

" Disable compatibility with vi which can cause unexpected issues.
set nocompatible

filetype on             "detect the type of file is use.
filetype plugin on      " Enable plugins and load plugin for the detected file type.
filetype indent on      " Load an indent file for the detected file type.
syntax on               " Turn syntax highlighting on.
set number              " Add numbers to the file.
set shell=powershell

syntax enable
set fileencodings=utf-8,sjis,euc-jp,latin
set encoding=utf-8
set title
set autoindent
set background=dark
set ai                  "Auto indent
set si                  "Smart indent

"set nowrap "No Wrap lines

" Highlight cursor line underneath the cursor ...
set cursorline  " horizontally
set cursorcolumn " vertically

set shiftwidth=4        " Set shift width to 4 spaces.
set tabstop=4           " Set tab width to 4 columns.

" set expandtab          " Use space characters instead of tabs.
" set nobackup           " Do not save backup files.

set scrolloff=10        " Do not let cursor scroll below or above N number of lines when scrolling.
set incsearch           " highlight matching characters as you type.
set hlsearch            " Use highlighting when doing a search.
set ignorecase          " Ignore capital letters during search.
set smartcase           " Override the ignorecase option if searching for capital letters.
set showcmd             " Show partial command you type in the last line of the screen.
set showmode            " Show the mode you are on the last line.
set showmatch           " Show matching words during a search.
set history=500         " commands to save in history.
set wildmenu            " Enable auto completion menu by pressing TAB.
set wildmode=list:longest   " Make wildmenu behave like similar to Bash completion.

" Wildmenu will ignore files with these extensions.
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx
"}}}

" PLUGINS ---------------------------------------------------------------- {{{

call plug#begin('~/AppData/Local/nvim/plugged')
  Plug 'EdenEast/nightfox.nvim'
  Plug 'kyoz/purify', { 'rtp': 'vim' }
  Plug 'preservim/nerdtree'
call plug#end()

" }}}

" MAPPINGS --------------------------------------------------------------- {{{

" Set the backslash as the leader key.
let mapleader = '\'
nnoremap <leader>\ ``       " Press \\ to jump back to the last cursor position.
inoremap ii <Esc>           " Type ii to exit insert mode quickly.
nnoremap <space> :          " Press spacebar to type the : character.
nnoremap o o<esc>           " open new line below the current one.
nnoremap O O<esc>           " exit insert mode after reating new line
nnoremap Y y$               " Yank from cursor to the end of line.

" Map the F5 key to run a Python script inside Vim.
" We map F5 to a chain of commands here.
" :w saves the file.
" <CR> (carriage return) is like pressing the enter key.
" !clear runs the external clear screen command.
" !python3 % executes the current file with Python.
nnoremap <f5> :w <CR>:!clear <CR>:!python3 % <CR>

" move split panes to left/bottom/top/right
nnoremap <A-h> <C-W>H
nnoremap <A-j> <C-W>J
nnoremap <A-k> <C-W>K
nnoremap <A-l> <C-W>L

" You can split the window in Vim by typing :split or :vsplit.
" move between panes to left/bottom/top/right
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Resize split windows using arrow keys by pressing:
" CTRL+UP, CTRL+DOWN, CTRL+LEFT, or CTRL+RIGHT.
noremap <c-up> <c-w>+
noremap <c-down> <c-w>-
noremap <c-left> <c-w>>
noremap <c-right> <c-w><

" NERDTree specific mappings.
" Map the F3 key to toggle NERDTree open and close.
nnoremap <F3> :NERDTreeToggle<cr>

" Have nerdtree ignore certain files and directories.
let NERDTreeIgnore=['\.git$', '\.jpg$', '\.mp4$', '\.ogg$', '\.iso$', '\.pdf$', '\.pyc$', '\.odt$', '\.png$', '\.gif$', '\.db$']

" }}}

" VIMSCRIPT -------------------------------------------------------------- {{{

" Enable the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" If the current file type is HTML, set indentation to 2 spaces.
autocmd Filetype html setlocal tabstop=2 shiftwidth=2 expandtab

" If Vim version is equal to or greater than 7.3 enable undofile.
" This allows you to undo changes to a file even after saving it.
if version >= 703
    set undodir=./backup
    set undofile
    set undoreload=10000
endif

" You can split a window into sections by typing `:split` or `:vsplit`.
" Display cursorline and cursorcolumn ONLY in active window.
augroup cursor_off
    autocmd!
    autocmd WinLeave * set nocursorline nocursorcolumn
    autocmd WinEnter * set cursorline cursorcolumn
augroup END

" If GUI version of Vim is running set these options.
if has('gui_running')
    set background=dark         " Set the background tone.
    colorscheme molokai         " Set the color scheme.

    " Set a custom font you have installed on your computer.
    " Syntax: <font_name>\ <weight>\ <size>
    set guifont=Monospace\ Regular\ 12
    set guioptions-=T           " Hide the toolbar.
    set guioptions-=L           " Hide the the left-side scroll bar.
    set guioptions-=r           " Hide the the left-side scroll bar.
    set guioptions-=m           " Hide the the menu bar.
    set guioptions-=b           " Hide the the bottom scroll bar.

    " Map the F4 key to toggle the menu, toolbar, and scroll bar.
    " <Bar> is the pipe character.
    " <CR> is the enter key.
    nnoremap <F4> :if &guioptions=~#'mTr'<Bar>
        \set guioptions-=mTr<Bar>
        \else<Bar>
        \set guioptions+=mTr<Bar>
        \endif<CR>

endif

" true color
if exists("&termguicolors") && exists("&winblend")
  syntax enable
  set termguicolors
  set winblend=0
  set wildoptions=pum
  set pumblend=5
  set background=dark
  " Use NeoSolarized
  let g:neosolarized_termtrans=1
  runtime ./colors/NeoSolarized.vim
  colorscheme NeoSolarized
endif

" colorscheme evening
" colorscheme nightfox
colorscheme purify

" open new split panes to right and below
set splitright
set splitbelow

" }}}

" STATUS LINE ------------------------------------------------------------ {{{

set statusline=             " Clear status line when vimrc is reloaded.
set statusline+=\ %F\ %M\ %Y\ %R    " Status line left side.
set statusline+=%=          " Use a divider to separate the left side from the right side.

" Status line right side.
set statusline+=\ ascii:\ %b\ hex:\ 0x%B\ row:\ %l\ col:\ %c\ percent:\ %p%%
set laststatus=2            " Show the status on the second to last line.

" }}}
