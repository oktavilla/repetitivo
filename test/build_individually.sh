#!/bin/bash

COLOR_RESET="\033[0m"
COLOR_RED="\033[31m"
COLOR_GREEN="\033[32m"

error () {
  local file="${1}"
  local result="${2}"

  echo -e "${COLOR_RED}✗ ${file}${COLOR_RESET}"
  echo -e "${result}"
  echo
  exit 1
}

success () {
  local file="${1}"

  echo -e "${COLOR_GREEN}✔ ${file}${COLOR_RESET}"
}

processFile () {
  local file="${1}"

  result=$(sass ${file} 2>&1 > /dev/null)

  if [ "$result" ]; then
    error "${file}" "${result}"
  else
    success "${file}"
  fi
}

echo "Build each file individually"

if [ -z "${1}" ]; then
  for file in $(find . -name "*.scss" -not -path "./node_modules/*"); do
    processFile "${file}"
  done
else
  processFile "${1}"
fi
