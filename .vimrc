" Plugin management using vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

    " Declare the list of plugins.
    Plug 'tpope/vim-sensible'
    Plug 'junegunn/seoul256.vim'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
	Plug 'nvie/vim-flake8'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" NERDTree config:
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTreea

" flake8 config:
" autocmd FileType python map <buffer> <C-b> :call flake8#Flake8()<CR>
autocmd BufWritePost *.py call flake8#Flake8()
let g:flake8_cmd="/Users/vanshajlokwani/Library/Python/3.6/bin/flake8"


syntax on

" set encoding
set encoding=utf-8

" change tabs to 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set noexpandtab

" vim meta-info display properties
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set ruler

" make cursor red at 81st character
highlight ColorColumn ctermbg=red
call matchadd('ColorColumn', '\%81v', 100)

" split window options
set splitbelow
set splitright
map <C-h> <C-w><C-h><CR>
map <C-j> <C-w><C-j><CR>
map <C-k> <C-w><C-k><CR>
map <C-l> <C-w><C-l><CR>

" making moving half a screen up easier
nnoremap H Hzz<CR>
nnoremap L Lzz<CR>

" setting color scheme: seoul256[-light]
colo seoul256

" code folding
set foldmethod=indent
set foldnestmax=10
set nofoldenable " enable no folding on f-op
set foldlevel=2

" marking ending white space
au BufRead,BufNewFile * match BadWhitespace /\s\+$/
highlight BadWhitespace ctermbg=red
