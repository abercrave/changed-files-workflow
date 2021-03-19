#!/bin/bash

WATCHED_DIRECTORY=watched-directory

for FILE in `git diff --name-only HEAD~1 HEAD`; do 
  if [[ $FILE = ${WATCHED_DIRECTORY}/* ]]; then
    FOUND_WATCHED_FILES=1
    echo $FILE
    break
  fi
done

if [[ -n $FOUND_WATCHED_FILES ]]; then
  echo $FOUND_WATCHED_FILES
fi