# <img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/35/Tux.svg/204px-Tux.svg.png" width="30"> dotfiles 
Collection of Linux settings, scripts, aliases that helps to transform fresh system (usually Arch or Xubuntu) to familiar look & fell with the tools I'm using.

Contains:
* `.config`   - configuration files for different programs,
* `backup`    - scripts that help to store system configuration (config files, installed packages, etc...),
* `dotfiles`  - real dotfiles that can be found in user home directory,
* `polybar-scripts` - customized polybar scripts (TODO: move to separate repo, add repo clonning as new step in restore)
* `restore`   - scripts that help to install packages, customize system: e.g. install aliases, zsh extensions,
* `restore/pkg` - lists of packages to install,
* `scripts`   - collection of shell scripts,
* `settings`  - settings for applications that don't fall into `dotfiles` or `.config`
* `snippets`  - snippets for vim.
* ~`pycharm` and `pycharm_ce`~ - configuration files for PyCharm, (depreciated, pycharm configuration is stored on github repo, see description below)

# Fresh install
Go to restore directory and launch steps you would like to apply. The scripts are ordered using 3-digit prefix.

## Packages
packages are divided into groups:
base.txt - these are always installed either on server or desktop installation
ext.txt  - these are

There are helper scripts that allows to manually update lists based on what is already installed in the system, see: `update_aur_list.sh` and `update_ext_list.sh` (work in progress).

# Terminal emulator
## Terminator

## ZSH
- plugin management: zgen
- plugins:
	- `zsh-users/zsh-syntax-highlighting`
	- `zsh-users/zsh-history-substring-search`
	- `unixorn/autoupdate-zgen`
	- `unixorn/warhol.plugin.zsh`
	- `djui/alias-tips` - Warn you when you run a command that you've set an alias for
	- `unixorn/git-extra-commands` - collection of git helper scripts
	- `skx/sysadmin-util` - 
	- `oh-my-zsh plugins/sudo`   - easily prefix your current or previous commands with `sudo` by pressing <kbd>esc</kbd> twice
	- `oh-my-zsh plugins/colored-man-pages`
	- `oh-my-zsh plugins/git`
	- `chrissicool/zsh-256color`
	- `zsh-users/zsh-completions`
	- `srijanshetty/docker-zsh`
	- `zsh-users/zsh-autosuggestions`
	- `bhilburn/powerlevel9k` - prompt
	- `supercrabtree/k` - directory listings more readable, with git information

# Pycharm settings
Pycharm IDE settings are stored in separate [github repository](https://github.com/izikeros/pycharm_settings) and can be imported on launch of Pycharm
Custom keymap:
```xml
<keymap version="1" name="Default for XWin copy" parent="Default for XWin">
  <action id="NextSplitter">
    <keyboard-shortcut first-keystroke="ctrl alt w" />
  </action>
  <action id="SplitVertically">
    <keyboard-shortcut first-keystroke="shift ctrl alt back_slash" />
  </action>
  <action id="ToggleBookmark">
    <keyboard-shortcut first-keystroke="f11" />
  </action>
  <action id="ToggleFullScreen">
    <keyboard-shortcut first-keystroke="alt f11" />
  </action>
  <action id="UnsplitAll">
    <keyboard-shortcut first-keystroke="shift ctrl alt slash" />
  </action>
</keymap>


```
# Display configuration - autorandr
Save your current display configuration and setup with:
```
autorandr --save mobile
```
Connect an additional display, configure your setup and save it:
```
autorandr --save docked
```
Now autorandr can detect which hardware setup is active:
```
$ autorandr
  mobile
  docked (detected)
```
To automatically reload your setup:
```
$ autorandr --change
```
To manually load a profile:
```
$ autorandr --load <profile>
```
or simply:
```
$ autorandr <profile>
```

# Runonce scripts

# polybar scripts
