mkdir -p $HOME/.config/nvim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.config/nvim/bundle/Vundle.vim

ln -fnsv $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim
ln -fnsv $HOME/dotfiles/.ideavimrc $HOME/.ideavimrc
ln -fnsv $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -fnsv $HOME/dotfiles/.bash_profile $HOME/.bash_profile
ln -fnsv $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -fnsv $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf
ln -fnsv $HOME/dotfiles/.profile $HOME/.profile
ln -fnsv $HOME/dotfiles/.zshenv $HOME/.zshenv
ln -fnsv $HOME/dotfiles/.gitconfig $HOME/.gitconfig
ln -fnsv $HOME/dotfiles/alacritty/alacritty.toml $HOME/.config/alacritty/alacritty.toml
ln -fnsv $HOME/dotfiles/hhkb_media_controls.json $HOME/.config/karabiner/assets/complex_modifications/hhkb_media_controls.json

mkdir -p $HOME/.gemini
ln -fnsv $HOME/dotfiles/gemini/GEMINI.md $HOME/.gemini/GEMINI.md
ln -fnsv $HOME/dotfiles/gemini/settings.json $HOME/.gemini/settings.json

git config --global core.excludesfile $HOME/dotfiles/.gitignore_global

# brew install trash-cli