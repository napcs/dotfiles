if has('win32') || has ('win64')
  let $VIMHOME = $HOME."/vimfiles"
else
  let $VIMHOME = $HOME."/.vim"
endif

" Remove ALL autocommands. Prevents autocommands from doubling up
" when reloading vimrc
autocmd!

source $VIMHOME/vundle
source $VIMHOME/vimrc_main

