"Control Key Mapping
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
