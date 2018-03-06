#!/bin/bash
# ======== install omzsh
if [ ! -d ~/.oh-my-zsh ]; then
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
echo "omzsh should be installed, you might want to switch shell to zsh via command: 'chsh -s /bin/zsh'"
symlink_dotfile ./dotfiles/.zshrc_omzsh ~/.zshrc