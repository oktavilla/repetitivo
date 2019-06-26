#!/bin/bash

COLOR_RESET="\033[0m"
COLOR_RED="\033[31m"
COLOR_GREEN="\033[32m"

DIR="${1:-lib}"

for file in $(find "${DIR}" -name "*.scss"); do
  result=$(node-sass ${file} 2>&1 > /dev/null)

  if [ "$result" ]; then
    message=$(echo "${result}" | json formatted)
    echo -e "${COLOR_RED}✗ ${file}${COLOR_RESET}"
    echo -e "${message}"
    echo
    exit 1
  else
    echo -e "${COLOR_GREEN}✔ ${file}${COLOR_RESET}"
  fi
done
