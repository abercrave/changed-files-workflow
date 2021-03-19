#!/bin/bash

WATCHED_DIRECTORY=watched-directory
FOUND_WATCHED_FILES=0

for f in `git diff --name-only HEAD~1 HEAD`; do 
  if [[ $f = ${WATCHED_DIRECTORY}/* ]]; then
    FOUND_WATCHED_FILES=1
    echo $f
    break
  fi
done

echo $FOUND_WATCHED_FILES