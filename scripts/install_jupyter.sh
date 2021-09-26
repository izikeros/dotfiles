#!/usr/bin/env bash

pip install jupyter
pip install jupyterlab

# Install extensions for Jupyter notebook
pip install jupyter_contrib_nbextensions

# Install javascript and css files
jupyter contrib nbextension install --user

# for isort extension
pip install isort

#
#jupyter nbextension enable codefolding/main

jupyter nbextension enable isortformatter/main
jupyter nbextension enable codefolding/main
jupyter nbextension enable codefolding/main
jupyter nbextension enable codefolding/main

# isortformatter
# spellchecker
# RISE
# Move selected cells

# Snippets
