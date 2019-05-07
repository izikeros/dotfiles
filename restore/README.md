## install packages:
```
cd dotfiles/restore
```
basic packages:
```
./pkg-from-the-list.sh ~/dotfiles/restore/pkg/basic.txt
```
for convenience also packages from `ext.txt` if not on the server but workstation

## Terminal
set configuration
```
symlink_terminator.sh
```

change default terminal using system menu
```
Arch dmenu -> settings -> preferred applications -> Terminal: Terminator
```
if needed: install **patched fonts** for powerline9k

## symlink zsh-related files:
```
	.zshrc
	.zsh_aliases
	.zsh_functions
	.zgen-setup
```
using script:
```
symlink_zsh_related_files_zgen.sh
```
* reload zsh to trigger zgen installation

## GIT
* symlink .gitconfig
```
symlink_git_config.sh
```

## FZF
* install fzf (`install_fzf.sh`, don't update shell config files)
(install `fasd` if packages from `ext.txt` were not installed. Add to basic?)

## VIM
* ./install_vim.sh

## AUR
* install yay (via `install_yay.sh`) or trizen
* manually install AUR packages: dropbox, sublime-text-dev,... (see: aur.txt in pkg)

## symlink/merge content from .config -> manual work
symlink double commander
```
symlink-doublecmdr.sh
```

merge Openbox:
```
meld ~/.config/openbox/rc.xml ~/dotfiles/.config/openbox/rc.xml
meld ~/.config/openbox/autostart ~/dotfiles/.config/openbox/rc.xml
meld ~/.config/openbox/environment ~/dotfiles/.config/openbox/environment
```
XFCE4 - keyboard shortcuts:
```
meld ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml ~/dotfiles/.config/xfce4/xfwm4/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml
```

* wallpapers location: `/usr/share/backgrounds` (get wallpaper from dropbox)
```
sudo cp ~/Dropbox/wallpapers/crimson.jpg /usr/share/backgrounds
```

TODO:
- split .zshrc_pure into zshrc_plain and .zshrc_zgen
- add tags ::server:: to restore steps, then create script to filter steps dedicated to server only
- remove dropbox from prompt

* [OBSOLETE] if using xbindkeysrc: symlink .xbindkeysrc. (Nowadays using mappings from openbox instead of xbindkeysrc)

* if using plain zsh - symlink .zshrc_pure, if using zgen launch .zsh-setup
