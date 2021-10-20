#!/usr/bin/bash

# Author : BennyBellier
# Copyrights 2021

# definition type
type_1='All-in-One'
type_2='Divorce'
type_3='Pairwise'

# Saving files in current folder to restructuring tree
function linux_tmp_save_create () {
  `mkdir /tmp/slang-save/`
  "mv ./* /tmp/slang-save/"
}

# Removing save
linux_tmp_save_delete () {
  `rm -r /tmp/slang-save`
}

linux_refill_All() {
  tmp='/tmp/slang-save'
  
  if [ -e "$tmp/.git" ]; then
    `mv $tmp/.git ./`
  fi

  for i in `find $tmp`; do
    if [ $i != $tmp ]; then
      file_name=$(basename $i)
      file_type=`filename##*.`

      if [ $file_type == 'c' ]; then
        `cp $i ./dev/src/`
      elif [ $file_type == 'cpp' ]; then
        `cp $i ./dev/src/`
      elif [ $file_type == 'h' ]; then
        `cp $i ./dev/include/`
      elif [ $file_type == 'o' ]; then
        `cp $i ./build/`
      elif [ $file_type == $file_name ]; then
        `cp $i ./bin/debug`
      elif [ $file_name == '.gitignore' ] || [ $file_name == 'LICENSE' ] || [ $file_name == 'README.md' ]; then
        `cp $i ./`
      else
        `cp $i ./dev/assets`
      fi
    fi

  done
  
}


function linux_tree_restructuring() {
  error=0
  linux_tmp_save_create()
  if [ $1 == "All-in-One" ]; then
    linux_refill_All()
  elif [ $1 == "Divorce"]; then
    linux_refill_Divorce()
  else
    linux_refill_Pairwise()
  fi
  
  if [ $error -eq 0 ]; then
    linux_tmp_save_delete()
  fi
}