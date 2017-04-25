set nocompatible

filetype plugin indent on

set backspace=indent,eol,start
set history=1024
set number
set ruler
set showcmd
set incsearch
set linebreak
set scrolloff=3
set splitright
set timeoutlen=100
set fillchars=fold:\ ,
set tildeop
set listchars=tab:␉·,trail:␠,nbsp:⎵
set list

fun! TrimWhitespace()
    let l:save = winsaveview()
    %s/\s\+$//e
    call winrestview(l:save)
endfun

nnoremap <silent> <Leader>w :call TrimWhitespace()<CR>

if exists('&breakindent')
    set breakindent
endif

set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

set mouse=a

hi clear SignColumn

nnoremap <silent> <c-_> :let @/=""<CR>




execute pathogen#infect()

" Solarized Color Scheme
syntax enable
set background=dark
hi! Folded cterm=NONE term=NONE
colorscheme solarized

" Airline
set laststatus=2
let g:airline_powerline_fonts = 1
let g:airline_detect_paste = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='solarized'

" Syntastic
let g:syntastic_error_symbol='✘'
let g:syntastic_warning_symbol="▲"
augroup mySyntastic
    au!
    au FileType tex let b:syntastic_mode = "passive"
augroup END

" Easy Tags
set tags=./tags;,~/.vimtags
let g:easytags_events = ['BufReadPost', 'BufWritePost']
let g:easytags_async = 1
let g:easytags_dynamic_files = 2
let g:easytags_resolve_links = 1
let g:easytags_suppress_ctags_warning = 1

" Tag Bar
nmap <silent> <leader>b :TagbarToggle<CR>

" Git Gutter
let g:airline#extensions#hunks#non_zero_only = 1



" Don't create netrwhist files
let g:netrw_dirhistmax = 0
