#!/bin/bash

function pretty_echo() {
  echo -e '\E[32m'"\033[1m"
  echo "#############################################################################"
  echo "# $@"
  echo "#############################################################################"
  echo -e "\033[0m"
}

pretty_echo "Please run ./bin/configure_project.sh to finish configuring your library"

echo '/bin/configure_project.sh' >> .gitignore
echo '/bin/post_create_project.sh' >> .gitignore
