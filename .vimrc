syntax on
set nu
set hlsearch

set shiftwidth=4
set tabstop=4
set softtabstop=4
set backspace=2
" set clipboard=unnamed

set nocp
set autoindent
set smartindent
set nomodeline
set splitright
set splitbelow
set pastetoggle=<C-V>
filetype indent on
filetype plugin on

set enc=utf8
colors elflord
nmap<F6> :!xelatex % && rm %<.out && rm %<.log && rm %<.aux && open %<.pdf <CR>
nmap<F7> :!gcc -g % -o %<.out && ./%<.out <CR>
nmap<F8> :!javac %<.java && java %<<CR>
" nmap<F7> :!g++ -g % -o %<.out && ./%<.out <CR>

" insert mode shortcut
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>
inoremap {<CR> {<CR>}<Esc>ko

" pathogen setting
execute pathogen#infect()
nnoremap <silent> <F5> :NERDTree<CR>
map <Leader><Leader> <Leader>c<space>
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
 " Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
 " Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" emmet setting
" let g:user_emmet_install_global = 0
" autocmd FileType html,css,php EmmetInstall
imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")



if &term =~ "xterm" || &term =~ "screen" || &term =~ "builtin_gui"
  " Ctrl-Enter
  set  <F13>=[25~
  map  <F13> <C-CR>
  map! <F13> <C-CR>

  " Shift-Enter
  set  <F14>=[27~
  map  <F14> <S-CR>
  map! <F14> <S-CR>

  " Ctrl-Space
  set  <F15>=[29~
  map  <F15> <C-Space>
  map! <F15> <C-Space>

  " Shift-Space
  set  <F16>=[30~
  map  <F16> <S-Space>
  map! <F16> <S-Space>

  " Ctrl-Backspace
  set  <F17>=[1;5P
  map  <F17> <C-BS>
  map! <F17> <C-BS>

  " Alt-Tab
  set  <F18>=[1;5Q
  map  <F18> <M-Tab>
  map! <F18> <M-Tab>

  " Alt-Shift-Tab
  set  <F19>=[1;5R
  map  <F19> <M-S-Tab>
  map! <F19> <M-S-Tab>

  " Ctrl-Up
  set  <F20>=[1;5A
  map  <F20> <C-Up>
  map! <F20> <C-Up>

  " Ctrl-Down
  set  <F21>=[1;5B
  map  <F21> <C-Down>
  map! <F21> <C-Down>

  " Ctrl-Right
  set  <F22>=[1;5C
  map  <F22> <C-Right>
  map! <F22> <C-Right>

  " Ctrl-Left
  set  <F23>=[1;5D
  map  <F23> <C-Left>
  map! <F23> <C-Left>

  " Ctrl-Tab
  set  <F24>=[31~
  map  <F24> <C-Tab>
  map! <F24> <C-Tab>

  " Ctrl-Shift-Tab
  set  <F25>=[32~
  map  <F25> <C-S-Tab>
  map! <F25> <C-S-Tab>

  " Ctrl-Comma
  set  <F26>=[33~
  map  <F26> <C-,>
  map! <F26> <C-,>

  " Ctrl-Shift-Space
  set  <F27>=[34~
  map  <F27> <C-S-Space>
  map! <F27> <C-S-Space>
endif

inoremap <C-CR> <Esc>o
inoremap <C-@> <Esc>l
