# Andy's very mini virtualenvwrapper-ish zsh plugin

# This is a simple, lightweight zsh plugin providing these four
# commands, with this syntax and no other options:
#
# mkvirtualenv <venv-name>
# workon <venv-name>
# rmvirtualenv <venv-name>
# wipevenv
#
# mkvirtualenv creates venvs in ~/.virtualenv; when a venv is created,
# it is automatically activated too.
#
# workon and rmvirtualenv respectively activate and delete venvs in
# ~/.virtualenv; tab completion works for these commands, based on the
# directories in ~/.virtualenv
#
# mkvirtualenv uses whatever python is active, so use pyenv if you
# want to choose your python version.
#
# mkvirtualenv creates venvs using python's stdlib's venv module; as
# such, it only works for python versions >= 3.3.
#
# To create a venv for an earlier version of python (assuming pyenv
# and its virtualenv support are installed) just create the venv
# using, e.g.:
#
#     $ virtualenv -ppython2.7 ~/.virtualenvs/<name of venv>
#
# after which you can use this plugin's workon and rmvirtualenv on
# that venv as usual.
#
# wipevenv wipes the currently active venv (if any - beware!), leaving
# only pip, setuptools, etc. in place.
#
# That's it!


_venvs_path() {
    echo ~/.virtualenvs
}


_venv_path() {
    echo "$(_venvs_path)/$1"
}


mkvirtualenv () {
    python -m venv $(_venv_path $1)
    workon $1
}


workon () {
    source $(_venv_path $1)/bin/activate
}


rmvirtualenv () {
    rm -rvf $(_venv_path $1) | wc -l
}

wipevenv() {
    pip freeze --exclude-editable | xargs pip uninstall -y
    pip list --editable --format freeze | xargs pip uninstall -y
}


_venv_completion () {
    _path_files -/ -W "$(_venvs_path)"
}

compdef _venv_completion workon rmvirtualenv
