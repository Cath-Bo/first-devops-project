#!/bin/bash

install_tool () {
  local tool=$1

  echo "Installing $tool..."

  if sudo apt install -y "$tool"; then
    echo "$tool installed successfully"
  else
    echo "$tool installation failed"
    exit 1
  fi
}

echo "Starting installation"

install_tool git
install_tool curl
install_tool wget
install_tool htop
install_tool tree
install_tool jq

echo "All tools installed successfully."
