#!/usr/bin/env bash
# Run this script to setup all the tools needed


# Checks if a programmed is currently installed
function installed(){
  type "$1" 2>&1 >/dev/null
  let ret=$?
  if [ $ret -eq 0 ]; then
    echo "$1 already installed"
  else
    echo "Installing $1"
  fi
  return $ret
}

####### Brew ########

# Package manager
installed brew || /usr/bin/ruby -e \
  "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo -n "Updating brew ... "
brew update && brew upgrade && brew tap caskroom/cask

# Markdonw to latex
installed pandoc || brew install pandoc

# Biblatex filter
installed pandoc-citeproc || brew install pandoc-citeproc

# Latex compilation
installed pdflatex || brew cask install mactex


##### Pip #######

# Pip package manager
installed pip || brew install pip

# Section number reference
installed pandoc-fignos || pip install pandoc-crossref


##### NPM ######

# Node package manager
installed npm || brew install npm

# Spell check
installed mdspell || npm i markdown-spellcheck -g

# Auto reload
installed fswatch || brew install fswatch
