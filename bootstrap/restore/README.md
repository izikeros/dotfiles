## install packages:
```
cd dotfiles/bootstrap/restore
```
basic stuff:
```
./pkg_from_the_list.sh ~/dotfiles/bootstrap/pkg/basic.txt
```
for convenience also packages from `ext.txt` if not on the server but workstation

## symlink zsh-relate files:
```
	.zshrc
	.zsh_aliases
	.zsh_functions
	.zgen-setup
```
* symlink .gitconfig

* if using plain zsh - symlink .zshrc_pure, if using zgen launch .zsh-setup
* reload .zshrc

* Arch: dmenu -> settings -> preferred applications -> Terminal: Terminator

[install pathed fonts for powerline9k]

* install fzf (`install_fzf.sh`, dont want to update shell config files)

* install fasd package present in both Ubuntu, Arch

* ./install_vim.sh
* install yay (via `install_yay.sh`) or trizen

# symlink/merge content from .config -> manual work
symlink double commander, Terminator,

merge Openbox:
```
meld ~/.config/openbox/rc.xml ~/dotfiles/.config/openbox/rc.xml
meld ~/.config/openbox/autostart ~/dotfiles/.config/openbox/rc.xml
meld ~/.config/openbox/environment ~/dotfiles/.config/openbox/environment
```

* wallpapers location: `/usr/share/backgrounds` (get wallpaper from dropbox)


TODO:
- write script for symlinking zsh related files
- split .zshrc_pure into zshrc_plain and .zshrc_zgen
- write script symlink XFCE

* [OBSOLETE] if using xbindkeysrc: symlink .xbindkeysrc. (Nowadays using mappings from openbox instead of xbindkeysrc)