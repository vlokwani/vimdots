" Plugin management using vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

    " Declare the list of plugins.
    Plug 'tpope/vim-sensible'
    Plug 'junegunn/seoul256.vim'
    Plug 'tpope/vim-surround'
    Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
    
" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" NERDTree config: 
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

syntax on

" change tabs to 4 spaces
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab

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

" setting color scheme: seoul256[-light]
colo seoul256 

