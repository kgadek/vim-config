" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

" Color scheme
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized

" various
set nu
set shiftwidth=2 tabstop=2
set expandtab
set smarttab
set scrolloff=3
set incsearch
set backspace=2

let mapleader = ","

set mouse=a
map <ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>

" vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"au BufEnter *.hs compiler ghc

" haskellmode-vim
au BufEnter *.hs compiler ghc
let g:haddock_browser = "open"
let g:haddock_browser_callformat = "%s %s"

" ghcmod-vim
"autocmd BufWritePost *.hs GhcModCheckAndLintAsync
map <Leader>t :GhcModType
map <Leader>T :GhcModTypeInsert
map <Leader>y :GhcModTypeClear

" vim-slime
let g:slime_target = "tmux"

" pointfree
autocmd BufEnter *.hs set formatprg="xrgs pointfree"

" tagbar
map <Leader>p :TagbarToggle

" neco-ghc
let g:necoghc_enable_detailed_browse = 1

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" fast-tags
au BufWritePost *.hs            silent !init-tags %
au BufWritePost *.hsc           silent !init-tags %
