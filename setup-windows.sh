sudo apt update
sudo apt install -y curl tig vim sshpass neovim zsh
sudo apt install -y tree || exit 1
sudo apt install -y ansible || exit 1
sudo apt install -y mysql-client || exit 1
sudo apt install -y postgresql || exit 1
sudo apt install -y redis-tools || exit 1
sudo apt install -y nfs-common || exit 1
sudo apt install -y colordiff || exit 1
sudo apt install -y php || exit 1
sudo apt install -y jq || exit 1
sudo apt install -y cgroupfs-mount || exit 1
sudo apt install -y npm || exit 1
sudo apt install -y tmux || exit 1

sudo ln -fnsv $HOME/dev/omikuji/dotfiles/windows/lib/start-tmux.sh /etc/profile.d/start-tmux.sh

# terraform
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform
