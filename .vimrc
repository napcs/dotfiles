if has('win32') || has ('win64')
  let $VIMHOME = $HOME."/vimfiles"
else
  let $VIMHOME = $HOME."/.vim"
endif

source $VIMHOME/vundle
source $VIMHOME/vimrc_main

