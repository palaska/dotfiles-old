# Dotfiles
My terminal config and necessary packages for development environment

```
cd
git clone https://github.com/palaska/dotfiles
```
---
### A. General Installations
##### 1. Install XCode, run it and agree terms
##### 2. Install Homebrew
```
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
```
##### 3. Install Node js: https://nodejs.org/en/download/
##### 4. Install Grunt cli
```
sudo npm install -g grunt-cli
```
##### 5. Install Bower
```
sudo npm install -g bower
```
##### 6. Install Sass
```
sudo gem install sass
```
##### 7. Install MacOSX Pasteboard
```
brew install reattach-to-user-namespace
```
##### 8. Install Trash
```
brew install trash
```

---
### B. Better terminal
##### 1. Install iTerm 2: https://www.iterm2.com/downloads.html
##### 2. Install Tmux
```
brew install tmux
```
##### 3. Install Prezto:
```
zsh
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
chsh -s /bin/zsh
```
##### 4. Run symlink script
```
sh makesymlinks.sh
```
##### 5. Import base16-iterm colors from Preferences
##### 6. Run the fonts script to add the fonts to the fontbook
```
sh ~/dotfiles/fonts/install.sh
```

---
### C. Vim
##### 1. Install MacVim
```
sudo xcode-select --switch /Applications/Xcode.app/Contents/Developer
brew install macvim --with-override-system-vim
```
##### 2. Install Vundle
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
##### 3. Open vim and install vundle packages
```
vim
:VundleInstall
```

---
### D. MongoDB
##### 1. Install MongoDB
```
brew install mongodb
sudo mkdir -p /data/db
chmod +x /data
chmod +x /data/db
```

##### 2. Install Mongo-Hacker
```
cd
git clone --depth=1 https://github.com/TylerBrock/mongo-hacker.git
cd mongo-hacker
make install
```


