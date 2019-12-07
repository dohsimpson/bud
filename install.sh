#!/bin/bash

set -e
set -u

case $(uname -s) in
  Darwin)
    INSTALL_DIR=/usr/local/bin/
    ;;
  Linux)
    INSTALL_DIR=/usr/bin/
    ;;
  *)
    echo "Unsupported OS detected, please install manually"
    exit 1
    ;;
esac

echo "Install bud and budz in $INSTALL_DIR"
sudo cp bud "$INSTALL_DIR"
sudo cp budz "$INSTALL_DIR"

echo "Installation completed"
echo "Note: If you would like to enable autocompletion for bud, please follow the instruction on the github page on this section: https://github.com/dohsimpson/bud#installation"
