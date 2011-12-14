call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
filetype on
filetype indent plugin on

" Basic options
set encoding=utf-8
set autoindent
set showmode
set showcmd
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set norelativenumber
set laststatus=2
set history=1000
set cpoptions+=J
" Visual characters for tabs and other non-printing chars
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
set shell=/bin/bash
set lazyredraw
set matchtime=3
set showbreak=↪
set splitbelow
set splitright
set fillchars=diff:⣿
set autowrite
set shiftround
set autoread
set title
set dictionary=/usr/share/dict/words
syntax enable
set autochdir
set undofile " Persistent undo history, see undodir below 
set undoreload=1000
set hidden
set ignorecase
set smartcase " Only match case with / if there's a capital in the search term
set scrolloff=3 " Scroll before the cursor hits the border
set sidescroll=1
set sidescrolloff=10
set ruler
set hlsearch " Hilight search terms
set incsearch " ...as they're typed
set showmatch " Show matching parens/brackets
set gdefault " Substitute all matches on a line by default
set virtualedit+=block

" Wildmenu customizations
set wildchar=<Tab>
set wildmenu
set wildmode=list:full

set wildignore+=.hg,.git,.svn " Version control
set wildignore+=*.aux,*.out,*.toc " LaTeX intermediate files
set wildignore+=*.jpg,*.bmp,*.png,*.gif,*.jpeg " Image binaries
set wildignore+=*.o " Compiled C/C++ files
set wildignore+=*.spl " Compiled spelling word files
set wildignore+=*.sw? " Vim swap files
set wildignore+=*.pyc " Python bytecode files
set wildignore+=*.fasl " Lisp bytecode files

" Clojure/Leiningen stuff
set wildignore+=classes,lib

" Appearance options
set guifont=Inconsolata\ Medium\ 12

" Solarized colors
"For light scheme:
"set background=light

if has('gui_running')
	set background=light
else
	set background=dark
endif
colorscheme solarized

" disable menubar
set guioptions-=m
" disable toolbar
set guioptions-=T
" display line numbers
" set number

" Save when focus is lost
au FocusLost * :wa
" Resize splits when the window is resized
au VimResized * exe "normal! \<c-w>="

" Set indentation options for all files identified as Python
au FileType python setlocal tabstop=8 expandtab shiftwidth=4 softtabstop=4

set wrap
set textwidth=80
set formatoptions=qrnl
set colorcolumn=+1

" Backup options
set undodir=~/.vim/tmp/undo// 
set backupdir=~/.vim/tmp/backup// 
set directory=~/.vim/tmp/swap// " Swap directory set backup

" More useful leader key
let mapleader = ","
let maplocalleader = "\\"

" Key mappings
" Clear hlsearch entries
noremap <leader><space> :noh<cr>:call clearmatches()<cr>
nmap <silent> <leader>s :silent :set nolist!<CR> " toggle visible whitespace
" to them.

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Statusline customization
augroup ft_statuslinecolor
    au!

    au InsertEnter * hi StatusLine ctermfg=196 guifg=#FF3145
    au InsertLeave * hi StatusLine ctermfg=130 guifg=#CD5907
augroup END

" Statusline
set statusline=%f	" Path
set statusline+=%m	" Modified flag
set statusline+=%r	" Readonly flag
set statusline+=%w	" Preview window
set statusline+=\ 	" Space
set statusline+=%#redbar#	" Display the next thing like an error msg
set statusline+=%{SyntasticStatuslineFlag()} " Syntax errors
set statusline+=%*	" Reset highlighting

" Right align
set statusline+=%=
" file format, encoding, type e.g. (unix/utf-8/python)
set statusline+=(
set statusline+=%{&ff} " Format
set statusline+=/
set statusline+=%{strlen(&fenc)?&fenc:&enc} " Encoding
set statusline+=/
set statusline+=%{&ft}
set statusline+=)

" Line, col, and position counts
set statusline+=\ (line\ %l\/%L,\ col\ %03c)
