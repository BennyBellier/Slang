#!/usr/bin/bash

# Author : BennyBellier
# Copyrights 2021

source folder_manipulation_functions/linux.sh

# Tree generation in folder
function tree_generation () {
  if [ $1 -eq 1 ]; then   # All-in-One Tree generation
    mkdir -p bin/debug bin/release build dev/assets dev/include dev/src .slang
  elif [ $1 -eq 2 ]; then # Divorce Tree generation
    mkdir -p bin/debug bin/release build assets include src .slang
  else                    # Pairwise Tree generation
    mkdir -p bin/debug bin/release build dev/assets .slang
    fi
}

function launch_by_OS() {
  if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    linux_tree_restructuring()
  elif [[ "$OSTYPE" == "darwin"* ]]; then
    # To implement
  elif [[ "$OSTYPE" == "cygwin" ]]; then
    # To implement
  elif [[ "$OSTYPE" == "msys" ]]; then
    # To implement
  elif [[ "$OSTYPE" == "win32" ]]; then
    # To implement
  elif [[ "$OSTYPE" == "freebsd"* ]]; then
    #To implement
  else
    # Unknown.
  fi

}