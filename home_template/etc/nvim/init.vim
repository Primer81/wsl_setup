" =============================
" |         WINDOWS           |
" =============================
if has('win32') || has('win64')
  set rtp+=$HOME/.vim
end

" =============================
" |       LOAD PLUGINS        |
" =============================
call plug#begin()
" UI Addons
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
Plug 'majutsushi/tagbar',   {'on': 'TagbarToggle'}
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dadbod',    {'on': 'DB'}
Plug 'ctrlpvim/ctrlp.vim',  {'on': ['CtrlP']}

" Formatting
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish', {'on': ['Abolish', 'Subvert']}
Plug 'godlygeek/tabular', {'on': 'Tabularize'}
Plug 'editorconfig/editorconfig-vim'

" Lanugage Syntax
"Plug 'jeaye/color_coded',         {'for': 'c'}
"Plug 'arakashic/chromatica.nvim'  "{'for': 'c'}
Plug 'justinmk/vim-syntax-extra', {'for': 'c'}
"Plug 'bfrg/vim-cpp-modern',       {'for': 'cpp'}
Plug 'cespare/vim-toml',          {'for': 'toml'}
Plug 'raingo/vim-matlab',         {'for': 'matlab'}
Plug 'mechatroner/rainbow_csv',   {'for': 'csv'}
Plug 'elixir-lang/vim-elixir',    {'for': ['elixir', 'ex', 'exs', 'eex']}
"Plug 'slashmili/alchemist.vim',   {'for': ['elixir', 'ex', 'exs', 'eex']}
Plug 'pangloss/vim-javascript',   {'for': 'js'}
Plug 'derekwyatt/vim-scala',      {'for': 'scala'}
Plug 'cakebaker/scss-syntax.vim', {'for': 'scss'}
Plug 'posva/vim-vue',             {'for': 'vue'}
Plug 'mxw/vim-jsx',               {'for': ['js', 'jsx']}
Plug 'dmix/elvish.vim',           {'for': ['elvish']}
Plug 'hail2u/vim-css3-syntax',    {'for': 'css'}
"Plug 'vim-python/python-syntax',  {'for': 'python'}
Plug 'ycm-core/YouCompleteMe',    {'for': ['python', 'matlab', 'sh', 'elixir', 'ex', 'exs', 'eex']}
Plug 'PProvost/vim-ps1',          {'for': 'ps1'}
Plug 'OrangeT/vim-csharp',        {'for': 'cs'}
call plug#end()

" =============================
" |    VIM GENERAL CONFIG     |
" =============================

" | ==== BEHAVIOR ==== |
"

" -||General||-
set clipboard+=unnamedplus

set virtualedit=block " make visual blocks easier to understand"

filetype plugin on
filetype indent on

set autoread  " re-read file if changed outside
set autowrite " automatically save before commands like :next and :make"

set so=7      " keeps cursor reasonably centered

" for self-made keybindings
let mapleader   = ","
let g:mapleader = ","

" use unix as the standard file type
set ffs=unix,dos,mac

" use JSX on all js files
let g:jsx_ext_required = 0

" fix mouse issues
set mouse=r

" -||Backups||-
set noswapfile
set nowritebackup
set nobackup
set undodir=$HOME/etc/undo

" -||Formatting||-
set tabstop=2      " number of visual spaces per tab
set shiftwidth=2   " size of tab indent
set softtabstop=2  " number of visual spaces in tab when editing
set expandtab      " tabs print spaces
set autoindent     " auto tab-indent based on code postition

set lbr            " enables line breaking
set sbr=>          " symbol to indicate linebreak

set splitright          " open vsplits on the right"
set nofoldenable        " disable folding
set foldmethod=syntax   " define how to fold files in general"
set foldlevelstart=20   " only I can set the folds
set backspace=2         " fixes backspaces

set list
set listchars=tab:>- " display tabs as visible characters

" removes all trailing whitespace
" autocmd BufWritePre * %s/\s\+$//e
function! <SID>StripTrailingWhitespaces()
  let l = line(".")
  let c = col(".")
  %s/\s\+$//e
  call cursor(l, c)
endfun
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" -||Searching||-
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set ignorecase          " ignore case when searching
set smartcase           " case only helps search

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" | ==== DISPLAY ==== |

" -||General||-
syntax on               " display syntax coloring
set t_Co=256            " 256 colors
set termguicolors       " true colors
let g:quantum_black=1
colorscheme quantum
set background=dark
"call one#highlight('Normal', '', '212121', 'none')
"call one#highlight('Comment', '707070', '', 'none')

set number              " show line numbers
set cursorline          " highlight current line
set showmatch           " highlight matching [{()}]
set wildmenu            " visual autocomplete for command menu

set showcmd             " show command in bottom bar
set laststatus=2        " the status line always displayed

set lazyredraw          " redraw only when we need to.
set encoding=utf-8      " use UTF-8 for file/term encoding"
set modeline            " modelines are vim settings for a specfic file
" set noeb vb t_vb=

" fixes vue syntax issue
autocmd FileType vue syntax sync fromstart

" Popup menu colors
"highlight Pmenu ctermfg=4 ctermbg=8

" Cursor highlight colors
" hi CursorLine term=bold cterm=bold guibg=White
"hi Variable guifg='#bdbdbd'
"hi Variable guifg='#cfd8dc'
hi Variable  guifg='#aebbc5'
hi Member    guifg='#aebbc5'
"hi Member   guifg='#cfd8dc'

" | ==== KEY BINDINGS ==== |

" Disables Highlight
nmap <F3> :set hlsearch!<CR>

" CTRL-Tab is next tab
nmap <C-Tab> :<C-U>bnext<CR>

" CTRL-SHIFT-Tab is previous tab
nmap <C-S-Tab> :<C-U>bprev<CR>

" Sets Buffer Keys
nmap <C-n> :bnext<CR>
nmap <C-p> :bprevious<CR>

" Space open/closes folds
nnoremap <space> za

" Disable Arrow Keys
nmap <Up> <NOP>
nmap <Down> <NOP>
nmap <Left> <NOP>
nmap <Right> <NOP>

" Fix st F1 issue
map <F1> <del>
map! <F1> <del>

" Disable shift + k
nmap <S-k> <NOP>

" Treat broken lines as multiple lines with j/k
map j gj
map k gk

" Center the cursor on the search word when using 'n'
nmap n nzz
nmap N Nzz

" Pressing leader+ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" ctag stuff
nmap <F8> :TagbarToggle<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


" =============================
" |         PLUGINS           |
" =============================

" | ==== Lightbar ==== |
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night',
      \ 'component': {
      \   'readonly': '%{&readonly?"⭤":""}',
      \ }
      \ }


" | ==== NERD Tree ==== |
" Close Tree if its the only buffer left
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" ^Map ctrl + n to nerdTree toggle
map <F2> :NERDTreeToggle<CR>
" Ignore garbled windows shit
let NERDTreeIgnore =
  \split(
    \system("cat ${HOME}/var/lib/lw/filter")
  \)

" | === Editor Config ===|
let g:EditorConfig_disable_rules = ['max_line_length']

" | === Python Syntax === |
let g:python_highlight_all = 1

" | === Delimit Mate === |
let g:delimitMate_smart_quotes = 0
let g:delimitMate_quotes = ""

" | === Rainbow CSV === |
"let g:rcsv_colorpairs = [
" \ ['red', 'red'],
" \ ['blue', 'blue'],
" \ ['magenta', 'magenta'],
" \ ['green', 'green'],
" \ ['NONE', 'NONE'],
" \ ['darkred', 'darkred'],
" \ ['darkblue', 'darkblue'],
" \ ['darkgreen', 'darkgreen'],
" \ ['darkmagenta', 'darkmagenta'],
" \ ['darkcyan', 'darkcyan']
" \ ]

function! LongestLine()
  let lines = map(getline(1, '$'), 'len(v:val)')
  return index(lines, max(lines))+1
endfunction

" Chromatica
"let g:chromatica#libclang_path='/usr/lib/llvm-6.0/lib/libclang.so'
"let g:chromatica#enable_at_startup=1
"let g:chromatica#responsive_mode=1

