" Turn vi compatible mode off
set nocompatible
set expandtab

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

" Show line numbers
set number

" Mark column 120
set cc=120

set mouse=a

"< > keep marked region
vnoremap < <gv
vnoremap > >gv

" Search options
set incsearch
set hlsearch
" If I put case variation in my search, it's cause I care
set ignorecase
set smartcase		
" Show matching brackets
set showmatch		

" When closing a block, show the matching bracket.
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

" folding
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
nnoremap <silent> <F4> :NERDTree<CR>Toggle
map <silent> <F6> :set nolist!<CR>:set nolist?<CR>
nmap <F8> :TagbarToggle<CR>

" :autocmd FileType php noremap <F12> :w!<CR>:!/usr/bin/php -f %<CR>

" some other shortcuts to make editing in vim more easy

" start of line
noremap <C-A>      i<Home>
inoremap <C-A>      <Home>
cnoremap <C-A>      <Home>
" end of line
noremap <C-E>       i<End>
inoremap <C-E>      <End>

" Switching between windows by pressing one time the tab key
noremap <Tab> <C-W><C-W>


set tabstop=4
set shiftwidth=4

if has('autocmd')
  au! BufWritePost .vimrc nested source %

  " Some more filetypes which are not recogneized 
  au BufRead,BufNewFile *.module	set filetype=php
  au BufRead,BufNewFile *.tpl		set filetype=smarty
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

" ctrlp excludes, add all the files you don't
" want to be listed when you use the ctrl+p search
set wildignore+=*/templates_c/*,*.log


" MY GIM EXTENSIONS

"Git branch
function! GitBranch()
    let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
    if branch != ''
        return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
    en
    return ''
endfunction

function! CurDir()
    return substitute(getcwd(), '/Users/amir/', "~/", "g")
endfunction

function! HasPaste()
    if &paste
        return 'PASTE MODE  '
    en
    return ''
endfunction

func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc

autocmd BufWrite *.php :call DeleteTrailingWS()
autocmd BufWrite *.tpl :call DeleteTrailingWS()

" Format the statusline
set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%{GitBranch()}

