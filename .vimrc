if !exists("g:syntax_on")
    syntax enable
endif

" fold setting
set foldmarker={{,}} foldlevel=0
autocmd FileType vim setlocal foldmethod=marker
let mapleader = " "

" VUNDLE{{
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'lifepillar/vim-solarized8'
Plugin 'rking/ag.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'motus/pig.vim'
Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'
"Markdown"{{
nmap <silent> <leader>m <Plug>MarkdownPreview
nmap <silent> <leader>s <Plug>StopMarkdownPreview
"nmap <silent> <leader>s " for normal mode
let g:mkdp_path_to_chrome = ""
let g:mkdp_auto_start = 0
" set to 1, the vim will open the preview window once enter the markdown
" buffer
"}}
" Autotag "{{
Plugin 'craigemery/vim-autotag'
"let g:autotagTagsFile=".tags"
"}}
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
    "map <silent> <C-o> <C-o>:noh<CR>
    nnoremap <silent> gd gd:noh<CR>

    Plugin 'haya14busa/incsearch-fuzzy.vim'
    map z/ <Plug>(incsearch-fuzzy-/)
    map z? <Plug>(incsearch-fuzzy-?)
    map zg/ <Plug>(incsearch-fuzzy-stay)

"}}
"Nerd commenter/tree {{
    Plugin 'scrooloose/nerdcommenter'
    " nerdcommenter
    map <Leader><Leader> <Leader>c<space>
    let g:NERDDefaultAlign = 'left'
    Plugin 'scrooloose/nerdtree'
    " NERDTree
    map \ :NERDTreeToggle<CR>
    "map <space><space> :NERDTreeToggle<CR>
"}}
"Emmet {{
    Plugin 'mattn/emmet-vim'
    " emmet
    let g:user_emmet_install_global = 0
    "autocmd FileType html,css,php,js EmmetInstall
    "autocmd FileType html,css,php,js imap <expr> <tab> emmet#expandabbrintelligent("\<tab>")
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
"Deoplete {{
    "if has('nvim')
    "  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    "else
    "  Plugin 'Shougo/deoplete.nvim'
    "  Plugin 'roxma/nvim-yarp'
    "  Plugin 'roxma/vim-hug-neovim-rpc'
    "endif
    "" Use deoplete.
    "let g:deoplete#enable_at_startup = 1
"}}
" YouCompleteMe{{
    Plugin 'Valloric/YouCompleteMe', { 'do': './install.py' } " completion
    "let g:ycm_python_binary_path = 'python'
    set completeopt-=preview
"}}
call vundle#end()            " required
filetype plugin indent on    " required
"}}
" THEME{{

" Set colorscheme to solarized
colorscheme solarized
"colors elflord

"set background=dark
"set background=light
" Change the Solarized background to dark or light depending upon the time of 
" day (5 refers to 5AM and 17 to 5PM). Change the background only if it is not 
" already set to the value we want.
function! SetSolarizedBackground()
    if strftime("%H") >= 6 && strftime("%H") < 8 
        if &background != 'light'
            set background=light
        endif
    else
        if &background != 'dark'
            set background=dark
        endif
    endif
endfunction
call SetSolarizedBackground()

function! MdIndention()
	if expand('%:e') ==# "md"
        inoremap <CR> <Esc>yypC
    endif
endfunction
call MdIndention()

" line numbers
set number " show line numbers
set rnu " show relative line numbers
set numberwidth=4 " line numbers width
if &background == 'dark'
    hi CursorLineNr term=bold ctermfg=white
endif
hi LineNr term=NONE cterm=NONE ctermfg=NONE ctermbg=NONE

set ruler
set rulerformat=%40(%=%1*%m%r%w\ %t%)
if &background == 'dark'
    hi User1 term=NONE cterm=bold ctermfg=white ctermbg=NONE
endif

set statusline=
set statusline+=%2*
set statusline+=%3*%=%m%r%w\ %t
hi User2 term=NONE cterm=NONE ctermfg=black ctermbg=white
hi User3 term=NONE cterm=bold ctermfg=black ctermbg=white

" how many characters in a line
"set textwidth=80 " make it obvious where 80 characters is
"set colorcolumn=+1 " color column after 'textwidth
"set colorcolumn=81 " color column after 'textwidth
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v./

if &term =~ '^xterm'
  " 4 -> solid underscore
  let &t_SI .= "\<Esc>[3 q"
  " solid block
  let &t_SR .= "\<Esc>[2 q"
  let &t_EI .= "\<Esc>[2 q"
  " 1 or 0 -> blinking block
  " 3 -> blinking underscore
endif
" Eliminate Strange tmux status window disappear bug
autocmd VimLeave * execute "echo ''"
"}}
" SELF DEFINED FUNCTION{{
" Rsync{{
set exrc
set secure

function! RemoteSync ()
    if !exists("g:enable_rsync") || g:enable_rsync == 0
        return
    endif

    let rsync_command = "rsync -avr --exclude='.exrc' --exclude-from=" . g:rsync_exclude . " " . g:rsync_local . " " . g:rsync_remote . " 1>/dev/null &"
    execute "!" . rsync_command
endfunction

au BufWritePost,FileWritePost * silent call RemoteSync()
"}}
"Compile{{
nmap <space>s :!mv %<.* ../Solved<CR>:q<CR>
nmap <silent> <C-@> :call Compile()<CR>
function! Compile()
	if expand('%:e') ==# "java"
		:!javac % && java %<
	elseif expand('%:e') ==# "c"
		:!gcc -g % -o %<.out && ./%<.out
	elseif expand('%:e') ==# "cpp"
		:!g++ -g % -o %<.out && ./%<.out
	elseif expand('%:e') ==# "py"
		:!python %
	elseif expand('%:e') ==# "sql"
		:!mysql TEST < %
	elseif expand('%:e') ==# "php"
		:!php %
	elseif expand('%:e') ==# "js"
		:!node %
	elseif expand('%:e') ==# "sh"
		:!bash %
	elseif expand('%:e') ==# "ml"
		:!ocamlc -o %<.out % && ./%<.out && (rm %<.out && rm %<.cmi && rm %<.cmo)
	elseif expand('%:e') ==# "pl"
		:!gplc % && ./%< && rm %<
	elseif expand('%:e') ==# "ss" || expand('%:e') ==# "scm"
        :!racket --load % -i
	elseif expand('%:e') ==# "r" || expand('%:e') ==# "R"
		:!Rscript %
    elseif expand('%:e') ==# "pig"
        :!pig -x local % 
    elseif expand('%:e') ==# "tex"
        :!xelatex % && rm %<.out && rm %<.log && rm %<.aux && open %<.pdf
    elseif expand('%:e') ==# "md"
        :MarkdownPreview
	endif
endfunction
"}}
"{{ Autoload
function! WatchForChanges(bufname, ...)
  " Figure out which options are in effect
  if a:bufname == '*'
    let id = 'WatchForChanges'.'AnyBuffer'
    " If you try to do checktime *, you'll get E93: More than one match for * is given
    let bufspec = ''
  else
    if bufnr(a:bufname) == -1
      echoerr "Buffer " . a:bufname . " doesn't exist"
      return
    end
    let id = 'WatchForChanges'.bufnr(a:bufname)
    let bufspec = a:bufname
  end
  if len(a:000) == 0
    let options = {}
  else
    if type(a:1) == type({})
      let options = a:1
    else
      echoerr "Argument must be a Dict"
    end
  end
  let autoread    = has_key(options, 'autoread')    ? options['autoread']    : 0
  let toggle      = has_key(options, 'toggle')      ? options['toggle']      : 0
  let disable     = has_key(options, 'disable')     ? options['disable']     : 0
  let more_events = has_key(options, 'more_events') ? options['more_events'] : 1
  let while_in_this_buffer_only = has_key(options, 'while_in_this_buffer_only') ? options['while_in_this_buffer_only'] : 0
  if while_in_this_buffer_only
    let event_bufspec = a:bufname
  else
    let event_bufspec = '*'
  end
  let reg_saved = @"
  "let autoread_saved = &autoread
  let msg = "\n"
  " Check to see if the autocommand already exists
  redir @"
    silent! exec 'au '.id
  redir END
  let l:defined = (@" !~ 'E216: No such group or event:')
  " If not yet defined...
  if !l:defined
    if l:autoread
      let msg = msg . 'Autoread enabled - '
      if a:bufname == '*'
        set autoread
      else
        setlocal autoread
      end
    end
    silent! exec 'augroup '.id
      if a:bufname != '*'
        "exec "au BufDelete    ".a:bufname . " :silent! au! ".id . " | silent! augroup! ".id
        "exec "au BufDelete    ".a:bufname . " :echomsg 'Removing autocommands for ".id."' | au! ".id . " | augroup! ".id
        exec "au BufDelete    ".a:bufname . " execute 'au! ".id."' | execute 'augroup! ".id."'"
      end
        exec "au BufEnter     ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHold   ".event_bufspec . " :checktime ".bufspec
        exec "au CursorHoldI  ".event_bufspec . " :checktime ".bufspec
      " The following events might slow things down so we provide a way to disable them...
      " vim docs warn:
      "   Careful: Don't do anything that the user does
      "   not expect or that is slow.
      if more_events
        exec "au CursorMoved  ".event_bufspec . " :checktime ".bufspec
        exec "au CursorMovedI ".event_bufspec . " :checktime ".bufspec
      end
    augroup END
    let msg = msg . 'Now watching ' . bufspec . ' for external updates...'
  end
  " If they want to disable it, or it is defined and they want to toggle it,
  if l:disable || (l:toggle && l:defined)
    if l:autoread
      let msg = msg . 'Autoread disabled - '
      if a:bufname == '*'
        set noautoread
      else
        setlocal noautoread
      end
    end
    " Using an autogroup allows us to remove it easily with the following
    " command. If we do not use an autogroup, we cannot remove this
    " single :checktime command
    " augroup! checkforupdates
    silent! exec 'au! '.id
    silent! exec 'augroup! '.id
    let msg = msg . 'No longer watching ' . bufspec . ' for external updates.'
  elseif l:defined
    let msg = msg . 'Already watching ' . bufspec . ' for external updates'
  end
  let @"=reg_saved
endfunction
let autoreadargs={'autoread':1}
execute WatchForChanges("*",autoreadargs)
"}}
"Modifier Key Mapping{{
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
"}}
"}}
 "GENERAL{{
set hlsearch
set autoindent
set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set backspace=2
set expandtab
"set smarttab
set clipboard+=unnamed " unnamed register "
set splitright
set splitbelow
set ignorecase " Case-insensitive searching.
set smartcase  " But case-sensitive if expression contains a capital letter.
set enc=utf8
set mouse=a " click to change cursor
set nobackup " no back up file
set noswapfile " you can open the same file in different places
set nocp
set nomodeline
set noshowmode " do not display current mode
set noeb vb t_vb= " disable sound
set timeoutlen=500 ttimeoutlen=0
"ctags
"autocmd BufEnter * silent! lcd %:p:h
set tags+=.tags,./.tags;

" Treat long lines as break lines (useful when moving around in them)
set wrap " wrap lines
set linebreak
nnoremap <buffer> <silent> k gk
nnoremap <buffer> <silent> j gj
"nnoremap <buffer> <silent> 0 g^
nnoremap <buffer> <silent> 0 g0
nnoremap <buffer> <silent> $ g$
vnoremap <buffer> <silent> k gk
vnoremap <buffer> <silent> j gj
"vnoremap <buffer> <silent> 0 g^
vnoremap <buffer> <silent> 0 g0
vnoremap <buffer> <silent> $ g$

" Ctrl-j/k deletes blank line below/above, and Alt-j/k inserts.
"nnoremap <silent><C-e> m`:silent +g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><C-y> m`:silent -g/\m^\s*$/d<CR>``:noh<CR>
"nnoremap <silent><C-y> :set paste<CR>m`o<Esc>``:set nopaste<CR>
"nmap <C-y> m`o<Esc>``

inoremap <C-CR> <Esc>o
inoremap <C-e> <Esc>$a
inoremap <C-p> System.out.println();<Esc>hi
inoremap {<CR> {<CR>}<Esc>O

"noremap 0 ^
noremap <C-j> gT
noremap <C-k> gt
"noremap <leader>h :noh<CR>
nnoremap <C-\> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
" Copy full path
noremap <leader>p :let @+ = expand('%:p')<CR>
"set list listchars=tab:»·,trail:· " show tab and trailing whitespaces
nnoremap <silent> <leader>rt :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
"nnoremap dh kA<space>,<Esc>wdb 
noremap K kJ

" Hide Line Number
nmap <Leader>n :set invnumber<CR>:set invrnu<CR>

autocmd FileType c,cpp,java set mps+==:;

"}}
