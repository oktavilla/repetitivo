#!/bin/bash

COLOR_RESET="\033[0m"
COLOR_RED="\033[31m"
COLOR_GREEN="\033[32m"

DIR="${1:-lib}"

error () {
  local file="${1}"
  local result="${2}"
  local message=$(echo "${result}" | json formatted)

  echo -e "${COLOR_RED}✗ ${file}${COLOR_RESET}"
  echo -e "${message}"
  echo
  exit 1
}

success () {
  local file="${1}"

  echo -e "${COLOR_GREEN}✔ ${file}${COLOR_RESET}"
}

echo "Build each file individually"

for file in $(find "${DIR}" -name "*.scss" -not -name "_index.scss"); do
  result=$(sass ${file} 2>&1 > /dev/null)

  if [ "$result" ]; then
    error "${file}" "${result}"
  else
    success "${file}"
  fi
done
