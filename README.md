# init_sh
### 1、for my Unix system

Notice:
1. `.vim/` `.vimrc``.zshrc``.bash_profile``.config/` can replace directly

2. `.ho-my-zsh` need to download from github.
- highlighting plugin: 
- autosuggestion plugin:
```
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions

```



### 2、if u in china and always failed to download plugs,run this can help.
```
vim ~/.vim/autoload/plug.vim
```
change these two parts:
```
let fmt = get(g:, 'plug_url_format', 'https://git::@github.com/%s.git')
```
to
```
let fmt = get(g:, 'plug_url_format', 'https://git::@hub.fastgit.org/%s.git')
```
and 
```
\ '^https://git::@github\.com', 'https://github.com', '')
```
to
```
\ '^https://git::@hub.fastgit\.org', 'https://hub.fastgit.org', '')

```



