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
- Install nvim from source - https://github.com/neovim/neovim/wiki/Building-Neovim
- Install Lua `sudo apt install lua`
- `sudo apt install luarocks && sudo luarocks install luafilesystem`
- Install GCC https://linuxize.com/post/how-to-install-gcc-on-ubuntu-20-04/
- Install ccls sudo apt install ccls
- curl -LO https://github.com/BurntSushi/ripgrep/releases/download/13.0.0/ripgrep_13.0.0_amd64.deb && sudo dpkg -i ripgrep_13.0.0_amd64.deb
- install greenclip https://github.com/erebe/greenclip
- install xclip `sudo apt install xclip`
- install ripgrep `sudo apt install ripgrep`
- install light `sudo apt install light` and remove sudo `sudo chmod +s /usr/bin/light'
- `sudo apt install fzf`

## Install Rails
https://gorails.com/setup/ubuntu/22.04
