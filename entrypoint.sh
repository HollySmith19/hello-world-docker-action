#!/bin/bash

IFS=';'

mapfile -t lines < <(echo "$INPUT_TESTS" | grep -v "^$")

e_code=0

for line in "${lines[@]}"; do

  read -r -a args <<< "$line"

  cmd="/opa test ${args[@]} $INPUT_OPTIONS"

  echo " Running: $cmd"

  eval "$cmd" || e_code=1

done

exit $e_code