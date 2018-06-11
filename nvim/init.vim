" initial setup
set wildignore+=*/build/**,*/tmp/*,*.so,*.swp,*.zip,*.aux
call plug#begin('~/.config/nvim/plugged')
Plug 'chriskempson/base16-vim'
Plug 'wting/rust.vim'
Plug 'derekwyatt/vim-scala'
Plug 'cespare/vim-toml'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'adimit/prolog.vim'
Plug 'JuliaEditorSupport/julia-vim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'Raimondi/delimitMate'
Plug 'majutsushi/tagbar'
Plug 'eugen0329/vim-esearch'
Plug 'tpope/vim-abolish'
call plug#end()

" swapfiles etc.
set backupdir=~/.config/nvim/backup//
set directory=~/.config/nvim/swp//
set undodir=~/.config/nvim/undo//

" aesthetics
syntax enable
set background=light
let base16colorspace=256
colorscheme base16-solarflare
let g:airline_theme='base16'
hi Normal ctermbg=none
hi LineNr ctermbg=none cterm=bold
hi NonText ctermbg=none
set colorcolumn=80
set number
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
match ColorColumn /\s\+$/

" splits
set splitbelow
set splitright
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" airline
set laststatus=2
set noshowmode
let g:airline_left_sep=""
let g:airline_right_sep=""

" syntastic
let g:syntastic_java_checkers = ['checkstyle']

" esearch
let g:esearch = {
            \ 'adapter': 'ag',
            \ 'backend': 'nvim',
            \ 'out': 'win',
            \ 'batch_size': 1000,
            \ 'use': ['visual', 'hlsearch', 'last'],
            \}

" misc
set nowrap
set omnifunc=syntaxcomplete#Complete

" recognize pandoc syntax
let g:pandoc#syntax#conceal#use = 0
augroup pandoc_syntax
    au! BufNewFile,BufFilePRe,BufRead *.md set filetype=markdown.pandoc
augroup END

" Use enter to clear the highlighting of :set hlsearch.
nnoremap <CR> :noh<CR><CR>

" maps
nnoremap <leader>m :silent make\|redraw!\|cc<CR>
nnoremap <leader>x :!%:p<CR>
nmap <leader>d :NERDTreeToggle<CR>
nmap <leader>t :TagbarToggle<CR>

" focus mode
function! ToggleFocusMode()
    if (&foldcolumn != 12)
        set laststatus=0
        set numberwidth=10
        set foldcolumn=12
        set noruler
        hi FoldColumn ctermbg=none
        hi LineNr ctermfg=0 ctermbg=none cterm=none
        hi NonText ctermfg=0
    else
        set laststatus=2
        set numberwidth=4
        set foldcolumn=0
        set ruler
        execute 'colorscheme ' . g:colors_name
        hi LineNr ctermbg=none cterm=bold
    endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>

" Enable project-specific configs
set exrc
set secure