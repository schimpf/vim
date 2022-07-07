call plug#begin('~/.vim/plugged')
  Plug 'preservim/nerdtree'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'MattesGroeger/vim-bookmarks'
  Plug 'kshenoy/vim-signature'
  Plug 'altercation/vim-colors-solarized'
  Plug 'JulioJu/neovim-qt-colors-solarized-truecolor-only'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-rails'
  Plug 'ngmy/vim-rubocop'
  Plug 'thoughtbot/vim-rspec'
  Plug 'mhinz/vim-startify'
  Plug 'tpope/vim-fugitive'
  Plug 'dense-analysis/ale'
  Plug 'preservim/vimux'
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'tbodt/deoplete-tabnine', { 'do': './install.sh' }
  Plug 'https://tpope.io/vim/fugitive.git'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'http://github.com/tpope/vim-surround'
  Plug 'http://github.com/tpope/vim-repeat'
  Plug 'thoughtbot/vim-rspec'
call plug#end()

set guioptions+=a
set termguicolors
set background=dark
set number
set autowriteall

set expandtab
set tabstop=2
set shiftwidth=2
colorscheme solarized_nvimqt

" RSpec.vim mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
"map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>
let g:rspec_command = "term bundle exec rspec {spec}"


" My custom keymapping
nnoremap <leader>sv :source $MYVIMRC<CR>
noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>l
vnoremap <c-s> <Esc>:w<CR>



" NERDtree
map <F2> :NERDTreeToggle<CR>
map <F3> :NERDTreeFind<CR>

" FZF
map <C-P> :Files<CR>
map <C-e> :Buffers<CR>

