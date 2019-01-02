# dotfiles

Special thanks to `StreakyCobra` and `telotortium` for their comments on this Hacker News thread: https://news.ycombinator.com/item?id=11071754 .

The (not so) secret sauce to this setup is to create a `config` alias to manage a git repo.

## Getting Started

### Create the alias

Add the alias to your shell config (most likely `.bashrc` or `.zshrc`).

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

### First Time Setup

Create a git repo for dotfiles and create and add the `config` alias to the current terminal session.

```
git init --bare $HOME/.myconf 
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME' 
config config status.showUntrackedFiles no 
```
  
You'll likely want to add a remote too: `git remote add origin /path/to/repo`

### Migrating config

Clone the dotfiles repo (clone to a temporary directory to avoid issues that arise when $HOME already exists)
and add the alias to the current terminal session.

```
git clone --separate-git-dir=$HOME/.myconf /path/to/repo $HOME/myconf-tmp
# Uncomment below if you use Git submodules
#cp ~/myconf-tmp/.gitmodules ~
rm -r ~/myconf-tmp/
alias config='/usr/bin/git --git-dir=$HOME/.myconf/ --work-tree=$HOME'
```

## How To Use

Use the `config` alias and manage config files like any other git repo.
 
```
config status 
config add .somedotfile 
config commit -m "Add somedotfile" 
config add .config/anotherconfig.conf 
config commit -m "Add anotherconfig config" 
config push 
```
