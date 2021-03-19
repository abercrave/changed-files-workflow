#!/bin/bash

WATCHED_DIRECTORY=watched-directory
BEFORE=$1
AFTER=$2

if [ "$BEFORE" = "" ]; then
  BEFORE="HEAD~1"
fi

if [ "$AFTER" = "" ]; then
  AFTER="HEAD"
fi

for FILE in `git diff --name-only ${BEFORE} ${AFTER}`; do 
  if [[ $FILE = ${WATCHED_DIRECTORY}/* ]]; then
    FOUND_WATCHED_FILES=1
    echo $FILE
    break
  fi
done

if [[ -n $FOUND_WATCHED_FILES ]]; then
  echo $FOUND_WATCHED_FILES
fi