" Turn vi compatible mode off
set nocompatible

" Activate the bundle loader
call pathogen#infect() 

" Don't redraw when running macros
set lazyredraw								

" Fast local tty
set ttyfast									

" Share the clipboard accross vim instances
set clipboard=unnamed	

" keep at least this many lines above/below cursor
set scrolloff=8								

" Do not wrap lines
set nowrap

" Colorscheme anotherdark
colorscheme asu1dark

" No toolbar
set guioptions-=T

"show line numbers
set number

"mark column 120
set cc=120

set mouse=a

"< > keep marked region
vnoremap < <gv
vnoremap > >gv

" Searching
set incsearch
set hlsearch
set smartcase		" if I put case variation in my search, it's cause I care
set showmatch		" show matching brackets

" When closing a block, show the matching bracket.
set showmatch
" Include angle brackets in matching.
set matchpairs+=<:>

" Save files before performing certain actions.
set autowrite

" Status line settings
set laststatus=2 
if has("statusline")
	 set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif
" Show current mode in the status line.
set showmode
" Show the command in the status line.
set showcmd

" foldiing
let g:php_folding = 3

" turn syntax highlight alwas on
syntax enable
:if version >= 600
	syntax enable
	filetype on
	filetype plugin on
	filetype indent on
:endif

" my Function Keys
map <F2>      :BufExplorer<CR>
map <F3>      :b#<CR>
nnoremap <silent> <F4> :TlistToggle<CR>
nnoremap <silent> <F5> :NERDTree<CR>Toggle
map <silent> <F6> :set nolist!<CR>:set nolist?<CR>
nmap <F8> :TagbarToggle<CR>

" some other shortcuts to make editing in vim more easy

" start of line
"noremap <C-A>      i<Home>
inoremap <C-A>      <Home>
cnoremap <C-A>      <Home>
" end of line
noremap <C-E>       i<End>
inoremap <C-E>      <End>

" Switching between windows by pressing one time the tab key
noremap <Tab> <C-W><C-W>



set ignorecase
set smartcase
set tabstop=4
set shiftwidth=4



if has('autocmd')
  " Source .vimrc when I write it.  The nested keyword allows 
  " autocommand ColorScheme to fire when sourcing ~/.vimrc.
  au! BufWritePost .vimrc nested source %

  " Change color of cursor in terminal:
  " - red in normal mode.
  " - orange in insert mode.
  " Tip found there:
  "   http://forums.macosxhints.com/archive/index.php/t-49708.html
  " It works at least with: xterm rxvt eterm
  " But do nothing with: gnome-terminal terminator konsole xfce4-terminal
  if version >= 700
    if &term =~ "xterm\\|rxvt"
      :silent !echo -ne "\033]12;red\007"
      let &t_SI = "\033]12;orange\007"
      let &t_EI = "\033]12;red\007"
      au VimLeave * :sil !echo -ne "\033]12;red\007"
    endif
  endif

  au BufRead,BufNewFile *.module		set filetype=php
  au BufRead,BufNewFile *.tt		set filetype=tt2html
endif

" autocomplete funcs and identifiers for languages
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

set wildmenu

