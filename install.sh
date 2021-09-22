mkdir -p $HOME/.config/nvim/bundle
git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.config/nvim/bundle/Vundle.vim

ln -fnsv $HOME/dotfiles/init.vim $HOME/.config/nvim/init.vim
ln -fnsv $HOME/dotfiles/.ideavimrc $HOME/.ideavimrc
ln -fnsv $HOME/dotfiles/.bashrc $HOME/.bashrc
ln -fnsv $HOME/dotfiles/.bash_profile $HOME/.bash_profile
ln -fnsv $HOME/dotfiles/.zshrc $HOME/.zshrc
ln -fnsv $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

git config --global core.excludesfile $HOME/dotfiles/.gitignore_global
