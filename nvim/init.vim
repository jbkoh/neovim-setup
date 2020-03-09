
""""""" Plug management stuff """""""
call plug#begin('~/.config/nvim/plugged')

""""""" Common Plugs """"""""
Plug 'scrooloose/nerdtree'  " file browsing
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
Plug 'kien/ctrlp.vim'

" Neomake build tool (mapped below to <c-b>)
Plug 'benekastah/neomake'
Plug 'thirtythreeforty/lessspace.vim'

"
Plug 'crusoexia/vim-monokai'

" Status bar mods
Plug 'airblade/vim-gitgutter'

" Tab completion
Plug 'ervandew/supertab'

" syntax check
Plug 'vim-syntastic/syntastic'


""""""" Filetype-specific Plugs """"""""

" For CSV
Plug 'chrisbra/csv.vim' , { 'for': ['csv'] }

" For Go
Plug 'fatih/vim-go' , {'for': ['go']}

" For Python
Plug 'Vimjas/vim-python-pep8-indent' , {'for': ['python']}
Plug 'davidhalter/jedi-vim' , {'for': ['python']}

" For Java
Plug 'artur-shaik/vim-javacomplete2' , {'for': ['java']}

" For Latex
Plug 'LaTeX-Box-Team/LaTeX-Box' , {'for': ['latex']}
Plug 'rhysd/vim-grammarous' , {'for': ['latex']}

" After all plugins...
call plug#end()


" Common
syntax enable
syntax on
colorscheme monokai


" ## nerdtree 
let NERDTreeIgnore=['\.pyc$', '\~$']
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <C-n> :NERDTreeToggle<CR>


""""""" General coding stuff """""""
" Always show status bar
set laststatus=2
" Let plugins show effects after 500ms, not 4s
set updatetime=500
" Disable mouse click to go to position
set mouse-=a
" Don't let autocomplete affect usual typing habits
set completeopt=menuone,preview,noinsert
" Let vim-gitgutter do its thing on large files
let g:gitgutter_max_signs=10000

" If your terminal's background is white (light theme), uncomment the following
" to make EasyMotion's cues much easier to read.
" hi link EasyMotionTarget String
" hi link EasyMotionShade Comment
" hi link EasyMotionTarget2First String
" hi link EasyMotionTarget2Second Statement
"

""""""" Airline """"""
let g:airline_section_a = 0
let g:airline_section_y = 0
let g:airline_section_b = 0
let g:airline_section_x = 0


""""""" Python stuff """""""
set number showmatch
set shiftwidth=4 tabstop=4 softtabstop=4 expandtab autoindent
" Highlight 80th column


""""""" Keybindings """""""
" Set up leaders
let mapleader=","
let maplocalleader="\\"
set pastetoggle=<F3>

set noswapfile
command! -bang -range=% -complete=file -nargs=* W <line1>,<line2>write<bang> <args>
command! -bang Q quit<bang>
cmap WQ wq
cmap wQ wq
cmap Wq wq
cabbrev E edit

command Formatjson %!python -m json.tool
command DisableGit GitGutterDisable
command EnableGit GitGutterEnable


" Synstatic Setting
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

autocmd VimEnter * GitGutterDisable


set colorcolumn=100

let g:syntastic_python_checkers = ["flake8"]
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_python_exec = 'python3'
let g:syntastic_python_checkers = ['python']
let python_highlight_all = 1

" Jedi-Python
let g:jedi#show_call_signatures = "0"
let g:jedi#force_py_version=3
function! Completefunc(findstart, base)
    return "\<c-x>\<c-p>"
endfunction

