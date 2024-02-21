#! /bin/bash

echo $POSIXLY_CORRECT

unset POSIXLY_CORRECT
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
