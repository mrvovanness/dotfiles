#!/bin/bash

for file in $(ls files); do
  echo linking $file ...
  ln -sf ~/dotfiles/files/$file ~/.$file
  echo done
done
