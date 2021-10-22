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
      if [ $i == "main.c" ]; then
        `cp $i ./dev/`
      fi
      file_name=$(basename $i)
      file_type=${file_name##*.}

      if [ ! -d $i  ]; then
        case $file_type in
                        "c" | "cpp" | "h")
                          file_type_len=${#file_type}
                          file_type_len=$((file_type_len + 1))
                          file_directory=${file_name:0:-$file_type_len}
                          `mkdir ./dev/$file_directory/`
                          `cp $i ./dev/$file_directory/`
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
  `rm -r ./dev`
}

function All_to_Pairwise() {
  for i in `find ./dev/src`; do
    if [ $i != './dev/src/']; then
      file_name=$(basename $i)
      file_type=${file_name##*.}
      file_type_len=${#file_type}
      file_type_len=$((file_type_len + 1))
      file_directory=${file_name:0:-$file_type_len}
      `mkdir ./dev/src/$file_directory`
      `cp ./dev/src/$file_name ./dev/$file_directory/`
      `cp ./dev/include/$file_directory.h ./dev/$file_directory/`
    fi
  done
  `rm -r ./dev/src ./dev/include`
}

function Divorce_to_All() {
  `mkdir ./dev`
  `mv ./assets ./dev/`
  `mv ./src ./dev/`
  `mv ./include ./dev/`
}

function Divorce_to_Pairwise() {
  `mkdir ./dev`
  for i in `find ./src`; do
    if [ $i != './src/']; then
      file_name=$(basename $i)
      file_type=${file_name##*.}
      file_type_len=${#file_type}
      file_type_len=$((file_type_len + 1))
      file_directory=${file_name:0:-$file_type_len}
      if [ $file_name == "main.c" ]; then
        `mv ./src/main.c ./dev/`
      fi
      `mkdir ./dev/$file_directory`
      `cp ./src/$file_directory.c ./dev/$file_directory/`
      `cp ./include/$file_directory.h ./dev/$file_directory/`
    fi
  done
  `cp ./assets ./dev/`
  `rm -r ./src ./include ./assets`
}

function Pairwise_to_All() {
  `mkdir ./dev/src ./dev/include`
  for i in `find ./dev`; do
    if [ $i != "./dev/"]; then
      file_name=$(basename $i)
      file_type=${file_name##*.}
      case $file_type in
                      "c" | "cpp")
                          `cp $i ./dev/src`
                          ;;
                      "h")
                          `cpp $i ./dev/include`
                          ;;
      esac
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