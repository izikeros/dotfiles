* cd bootstrap/restore
* ./pkg_from_the_list.sh ~/dotfiles/bootstrap/pkg/basic.txt
* and ext.txt if not on the server but workstation
* symlink zsh-relate files (e.g. .zsrc, .zsh_aliases, .zsh_functions, .zsh-setup)
* symlink .gitconfig
* if using plain zsh - symlink .zshrc_pure, if using zgen launch .zsh-setup
* reload .zshrc
* Arch: dmenu -> settings -> preferred applications -> Terminal: Terminator
[install pathed fonts for powerline9k]
* install fzf (install_fzf)
* instal fasd package present in both Ubuntu, Arch
* install thefuck package (Arch)
* ./install_vim.sh
* install yay (install_yay.sh) or trizen

* if using xbindkeysrc: symlink .xbindkeysrc

# symlink/merge content from .config -> manual work
* symlink xfce4 settings (see: restore_setup in obsolete)
*

TODO:
- write script for symlinking zsh related files
- split .zshrc_pure into zshrc_plain and .zshrc_zgen
- write script symlink XFCE
