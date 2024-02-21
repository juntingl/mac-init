#! /bin/bash

echo $POSIXLY_CORRECT

unset POSIXLY_CORRECT
sudo /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
