" Fugitive
command Gq :Gwrite <bar> q
command Gd :Gdiff

" Pathogen
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
syntax on
filetype plugin indent on

" Color scheme
set background=dark
let g:solarized_termtrans = 1
"colorscheme solarized
"colorscheme gotham
colorscheme alduin
"colorscheme dracula

" various
set nu
set shiftwidth=4 tabstop=4
set expandtab
set smarttab
set scrolloff=3
set incsearch
set backspace=2
set breakindent

let mapleader = ","

" vim-go
au FileType go nmap <leader>r <Plug>(go-run)
au FileType go nmap <leader>b <Plug>(go-build)
au FileType go nmap <leader>t <Plug>(go-test)
au FileType go nmap <leader>c <Plug>(go-coverage)

" LaTeX-Box
" let g:LatexBox_latexmk_preview_continuously=1
" let g:LatexBox_latexmk_async=1

" vimtex
" let g:vimtex_latexmk_progname = 'nvr'
" let g:vimtex_view_general_viewer
"       \ = '/Applications/Skim.app/Contents/SharedSupport/displayline'
" let g:vimtex_view_general_options = '-r @line @pdf @tex'
" 
" " This adds a callback hook that updates Skim after compilation
" let g:vimtex_latexmk_callback_hooks = ['UpdateSkim']
" function! UpdateSkim(status)
"   if !a:status | return | endif
" 
"   let l:out = b:vimtex.out()
"   let l:tex = expand('%:p')
"   let l:cmd = [g:vimtex_view_general_viewer, '-r']
"   if !empty(system('pgrep Skim'))
"     call extend(l:cmd, ['-g'])
"   endif
"   if has('nvim')
"     call jobstart(l:cmd + [line('.'), l:out, l:tex])
"   elseif has('job')
"     call job_start(l:cmd + [line('.'), l:out, l:tex])
"   else
"     call system(join(l:cmd + [line('.'), shellescape(l:out), shellescape(l:tex)], ' '))
"   endif
" endfunction

set mouse=a
" set mouse=
" map <ScrollWheelUp> <C-Y>
" map <ScrollWheelDown> <C-E>

" Commenting blocks of code.
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
autocmd FileType haskell          let b:comment_leader = '-- '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>

" vim-airline
set laststatus=2
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

"au BufEnter *.hs compiler ghc

" haskellmode-vim
au BufEnter *.hs compiler ghc
" OS X specific
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
" use `gq` to reformat
autocmd BufEnter *.hs set formatprg=xargs\ pointfree

" tagbar
map <Leader>p :TagbarToggle

" neco-ghc
let g:necoghc_enable_detailed_browse = 1

" neocomplcache
let g:neocomplcache_enable_at_startup = 1

" fast-tags
au BufWritePost *.hs            silent !init-tags %
au BufWritePost *.hsc           silent !init-tags %

" make vimdiff ignore whitespace while normal vim doesn't
if &diff
    " diff mode
    set diffopt+=iwhite
endif

" tabularize
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif
