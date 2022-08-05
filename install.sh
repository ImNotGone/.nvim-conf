# install packages (git, zsh, antibody, neovim, stow, bat)

# stow dotfiles
# build packages on parent directory (should be ~/)
stow git
stow zsh
stow nvim

# add zsh as a available shell
command -v zsh | sudo tee -a /etc/shells

# set zsh as default shell
sudo chsh -s $(which zsh) $USER

# install plugins
nvim --headless +PlugInstall +qall

# install Oh-My-Zsh & remove the "pre-oh-my-zsh"
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mv ~/.zshrc.pre-oh-my-zsh ~/.zshrc

# install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# install p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

