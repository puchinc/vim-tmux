 "General
if !exists("g:syntax_on")
    syntax enable
endif

set hlsearch
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=2
set autoindent
set smartindent
set clipboard+=unnamed " unnamed register "
set noeb vb t_vb= " disable sound
set nomodeline
set noshowmode " do not display current mode

set nocp
set splitright
set splitbelow
set ignorecase
"set smartcase
set enc=utf8
set mouse=a " click to change cursor

set background=dark
colors solarized
"colors elflord

" line numbers
set number " show line numbers
set rnu " show relative line numbers
set numberwidth=4 " line numbers width
hi LineNr term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE 
hi CursorLineNr term=bold ctermfg=white 

set ruler
set rulerformat=%40(%=%1*%m%r%w\ %t%)
hi User1 term=NONE cterm=bold ctermfg=white ctermbg=NONE 

"set laststatus=2
set statusline=
set statusline+=%2*
set statusline+=%3*%=%m%r%w\ %t
hi User2 term=NONE cterm=NONE ctermfg=black ctermbg=cyan 
hi User3 term=NONE cterm=NONE ctermfg=black ctermbg=cyan
"hi User2 term=bold cterm=bold ctermfg=NONE ctermbg=white 
"hi StatusLine term=bold cterm=bold ctermfg=NONE ctermbg=white 

" how many characters in a line
"set textwidth=80 " make it obvious where 80 characters is
"set colorcolumn=+1 " color column after 'textwidth

set nobackup " no back up file
set noswapfile " you can open the same file in different places

"set tmux window name automatically 
if exists('$TMUX')
    autocmd BufEnter * call system("tmux rename-window " . expand("%:t"))
    autocmd VimLeave * call system("tmux setw automatic-rename")
endif

"ctags
"autocmd BufEnter * silent! lcd %:p:h
set tags+=tags;/

map <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" insert mode shortcut
inoremap <C-CR> <Esc>o
inoremap { {}<ESC>i
inoremap {<CR> {<CR>}<Esc>O
inoremap <C-h> <Left>
inoremap <C-j> <Down>
inoremap <C-k> <Up>
inoremap <C-l> <Right>

" Yank text to the OS X clipboard" 
"noremap <leader>y "*y
"noremap <leader>yy "*Y
" Preserve indentation while pasting text from the OS X clipboard 
"noremap <leader>p :set paste<CR>:put *<CR>:set nopaste<CR>
" normal mode shortcut
"nmap <C-]>r :!ctags -R .<CR>
nmap <Leader>n :set invnumber<CR>
nmap <C-@> :call Compile()<CR>

" fold setting
set foldmarker={{,}} foldlevel=0 
autocmd FileType vim setlocal foldmethod=marker

" Vundle
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
" Incsearch {{
    Plugin 'haya14busa/incsearch.vim'
    map /  <Plug>(incsearch-forward)
    map ?  <Plug>(incsearch-backward)
    map g/ <Plug>(incsearch-stay)

    " :h g:incsearch#auto_nohlsearch
    set hlsearch
    let g:incsearch#auto_nohlsearch = 1
    map n  <Plug>(incsearch-nohl-n)
    map N  <Plug>(incsearch-nohl-N)
    map *  <Plug>(incsearch-nohl-*)
    map #  <Plug>(incsearch-nohl-#)
    map g* <Plug>(incsearch-nohl-g*)
    map g# <Plug>(incsearch-nohl-g#)

    Plugin 'haya14busa/incsearch-fuzzy.vim'
    map z/ <Plug>(incsearch-fuzzy-/)
    map z? <Plug>(incsearch-fuzzy-?)
    map zg/ <Plug>(incsearch-fuzzy-stay)

"}}
"Nerd commenter/tree {{
    Plugin 'scrooloose/nerdcommenter'
    " nerdcommenter
    map <Leader><Leader> <Leader>c<space>
    Plugin 'scrooloose/nerdtree'
    " NERDTree
    map ,, :NERDTreeToggle<CR>
"}}
"Emmet {{
    Plugin 'mattn/emmet-vim'
    " emmet
    let g:user_emmet_install_global = 0
    autocmd FileType html,css,php,js EmmetInstall
    autocmd FileType html,css,php,js imap <expr> <tab> emmet#expandabbrintelligent("\<tab>")
"}}
" Multi-Cursors{{
    Plugin 'terryma/vim-multiple-cursors'
    " vim-multiple-cursors 
    "let g:multi_cursor_next_key='<c-n>'
    let g:multi_cursor_prev_key='<c-b>'
    "let g:multi_cursor_skip_key='<c-x>'
    "let g:multi_cursor_quit_key='<esc>'
    nnoremap <silent> <m-j> :multiplecursorsfind <c-r>/<cr>
    vnoremap <silent> <m-j> :multiplecursorsfind <c-r>/<cr>
"}}
"Easy Motion {{
    Plugin 'easymotion/vim-easymotion'
    " easymotion
    map <leader> <plug>(easymotion-prefix)
    " <leader>f{char} to move to {char}
    map  <leader>f <plug>(easymotion-bd-f)
    nmap <leader>f <plug>(easymotion-overwin-f)
    " s{char}{char} to move to {char}{char}
    nmap s <plug>(easymotion-overwin-f2)
    " move to line
    map <leader>l <plug>(easymotion-bd-jk)
    nmap <leader>l <plug>(easymotion-overwin-line)
    " move to word
    map  <leader>w <plug>(easymotion-bd-w)
    nmap <leader>w <plug>(easymotion-overwin-w)
"}}
Plugin 'Valloric/YouCompleteMe', { 'do': './install.py' } " completion
call vundle#end()            " required
filetype plugin indent on    " required
