# dotfiles
```
### CentOS
# sudo yum install langpacks-ja

### Ubuntu
# sudo apt-get install language-pack-ja
```

dein
```
### Vim
:call dein#install()
```

coc.nvim
```
### C/C++
##  CLI
# sudo apt-get install clangd clang-format
# clang-format -style=llvm --dump-config > ~/.clang-format

##  Vim
:CocInstall coc-clangd
```
