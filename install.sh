#!/bin/bash
echo "This script installs Neovim config to the devpod container and launches it"

# Install lazygit
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin

# Install ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb

# Install fd-find
npm install -g fd-find

# Update system packages
sudo apt update

# Install Neovim latest release
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

# Add Neovim to PATH


# Clone Neovim configuration
git clone https://github.com/pinugit/my-neovim-config.git ~/.config/nvim
rm lazygit.tar.gz ripgrep_14.1.0-1_amd64.deb nvim-linux64.tar.gz install.sh


# Launch Neovim
echo "


"
echo '
export PATH="$PATH:/opt/nvim-linux64/bin" >> ~/.bashrc
source ~/.bashrc
nvim
'

