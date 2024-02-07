# .dotfiles

This directory contains the dotfiles for my system.

## Requirements

Ensure you have the following installed on your system

### Git

```
sudo nala install git
```

### Stow

```
sudo nala install stow
```

## Installation

First, check out the .dotfiles repo in the $HOME directory using git

```
$ git clone git@github.com/nobletk/.dotfiles.git
$ cd .dotfiles
```

then use GNU stow to create symlinks

```
$ stow .
```
