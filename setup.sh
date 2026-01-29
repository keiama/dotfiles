#!/bin/bash

echo "--- stow Install ---"
sudo apt install stow -y

echo "--- Zsh Install ---"
sudo apt install -y zsh
cd ~/dotfiles
stow -v -t ~ zsh
cd

echo "--- Change the default shell to Zsh ---"
chsh -s $(which zsh)

echo "--- Starship Install ---"
curl -sS https://starship.rs/install.sh | sh -s -- -y

echo "--- LazyGit Install ---"
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | \grep -Po '"tag_name": *"v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/download/v${LAZYGIT_VERSION}/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit -D -t /usr/local/bin/
rm lazygit  lazygit.tar.gz

echo "--- Rust Install ---"
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source "$HOME/.cargo/env"

echo "--- NeoVim Install ---"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux-x86_64.appimage
chmod u+x nvim-linux-x86_64.appimage
sudo mkdir -p /opt/nvim
sudo mv nvim-linux-x86_64.appimage /opt/nvim/nvim

echo "--- NvChad Install ---"
git clone https://github.com/NvChad/starter ~/.config/nvim
rm ~/.config/nvim/.git
cd ~/dotfiles
stow -v -t ~ nvim
cd

echo "--- Setup complete! ---"
echo "Please log in again."

