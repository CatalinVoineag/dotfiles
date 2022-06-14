## Simlinks

```
ln -s ~/.config/dotfiles/.bashrc ~/.bashrc &&
ln -s ~/.config/dotfiles/.tmux.conf ~/.tmux.conf &&
ln -s ~/.config/dotfiles/.gitconfig ~/.gitconfig &&
ln -s ~/.config/dotfiles/.xmodmap ~/.xmodmap &&
ln -s ~/.config/dotfiles/.fonts ~/.fonts &&
ln -s ~/.config/dotfiles/.xinitrc ~/.xinitrc &&
ln -s ~/.config/dotfiles/i3 ~/.config/i3 &&
ln -s ~/.config/dotfiles/nvim ~/.config/nvim
```
### The i3 forlder in config might need to be removed before creating the simlink
### Rofi package needs to be installed for i3 search menu to work
```
sudo apt install rofi
```

## Install tmux plugin manager
 
 ```
 git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
 ```
 
### Install tmux plugins
```
tmux
prefix + I - to install the plugins
```

## Nvim Steps to install:
1. Install nvim from source - https://github.com/neovim/neovim/wiki/Building-Neovim
2. Install vim plug - https://github.com/junegunn/vim-plug
3. Install Lua `sudo apt install lua`
4. Install GCC https://linuxize.com/post/how-to-install-gcc-on-ubuntu-20-04/
5. Install ccls sudo apt install ccls
6. Run :PlugInstall inside `init.vim`
7. curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb && sudo dpkg -i ripgrep_13.0.0_amd64.deb

## Install Rails
https://gorails.com/setup/ubuntu/22.04
