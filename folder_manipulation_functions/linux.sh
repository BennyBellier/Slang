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

      if [ ! -d $i  ]; then
        case $file_type in
                        "c" | "cpp")
                          `cp $i ./dev/src/`
                          ;;
                        "h")
                          `cp $i ./dev/include/`
                          ;;
                        "o")
                          `cp $i ./build/`
                          ;;
                        $file_name)
                          `cp $i ./bin/debug`
                          ;;
                        ".gitignore" | "LICENSE" | "README.md")
                          `cp $i ./`
                          ;;
                        *)
                          dir=$(dirname $i)
                          `mkdir -p ./dev/assets/$dir`
                          `cp $i ./dev/assets/`
                          ;;
        esac
      fi
    fi
  done
}

linux_refill_Divorce() {
  tmp='/tmp/slang-save'
  
  if [ -e "$tmp/.git" ]; then
    `mv $tmp/.git ./`
  fi

  for i in `find $tmp`; do
    if [ $i != $tmp ]; then
      file_name=$(basename $i)
      file_type=`filename##*.`

      if [ ! -d $i  ]; then
        case $file_type in
                        "c" | "cpp")
                          `cp $i ./src/`
                          ;;
                        "h")
                          `cp $i ./include/`
                          ;;
                        "o")
                          `cp $i ./build/`
                          ;;
                        $file_name)
                          `cp $i ./bin/debug`
                          ;;
                        ".gitignore" | "LICENSE" | "README.md")
                          `cp $i ./`
                          ;;
                        *)
                          dir=$(dirname $i)
                          `mkdir -p ./assets/$dir`
                          `cp $i ./assets/`
                          ;;
        esac
      fi
    fi
  done
}

linux_refill_Pairwise() {
  tmp='/tmp/slang-save'
  
  if [ -e "$tmp/.git" ]; then
    `mv $tmp/.git ./`
  fi

  for i in `find $tmp`; do
    if [ $i != $tmp ]; then
      file_name=$(basename $i)
      file_type=`filename##*.`

      if [ ! -d $i  ]; then
        case $file_type in
                        "c" | "cpp")
                          file_type_len=${#file_type}
                          

                          `mkdir ./dev/`
                          `cp $i ./src/`
                          ;;
                        "h")
                          `cp $i ./include/`
                          ;;
                        "o")
                          `cp $i ./build/`
                          ;;
                        $file_name)
                          `cp $i ./bin/debug`
                          ;;
                        ".gitignore" | "LICENSE" | "README.md")
                          `cp $i ./`
                          ;;
                        *)
                          dir=$(dirname $i)
                          `mkdir -p ./dev/assets/$dir`
                          `cp $i ./dev/assets/`
                          ;;
        esac
      fi
    fi
  done
}

function All_to_Divorce() {
  `mv ./dev/assets ./`
  `mv ./dev/src ./`
  `mv ./dev/include ./`
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