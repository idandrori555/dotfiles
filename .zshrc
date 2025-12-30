# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled
# zstyle ':omz:update' mode auto
# zstyle ':omz:update' mode reminder

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files under VCS as dirty.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time stamp format.
HIST_STAMPS="dd/mm/yyyy"

# Plugins
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Aliases

# General
alias cls="clear"
alias zshconfig="nvim ~/.zshrc"
alias mem="fastfetch | grep Mem"
alias op="ss -tuln"
alias files="nautilus"
alias office="libreoffice"
alias q="exit"
alias vim="nvim"
alias vi="nvim"
alias c="clear"
alias xcopy="xclip -selection clipboard"
alias yy="yazi"

# Compile C and C++
alias run="clang *.c -Wall -o main && ./main"
alias run++="clang++ *.cpp -Wall -o main && ./main"
alias drun="clang *.c -g -Wall -o main && ./main"
alias drun++="clang++ *.cpp -g -Wall -o main && ./main"

# Cross compilers
alias wgcc="i686-w64-mingw32-gcc"
alias wg++="i686-w64-mingw32-g++"

# Lazy
alias lg="lazygit"
alias lzd="lazydocker"

# Disassemblers
alias dasm="ndisasm"
alias d16="ndisasm -b 16"
alias dump="objdump -S -Mintel"

# Better gdb for debug
alias gdb="cgdb"


# Hexadecimal functions
dtoh() {
  if [ $# -gt 0 ]; then
    for num in "$@"; do
      printf "0x%X\n" "$num"
    done
  else
    while read -r num; do
      printf "0x%X\n" "$num"
    done
  fi
}

htod() {
  if [ $# -gt 0 ]; then
    for num in "$@"; do
      printf "%d\n" "$num"
    done
  else
    while read -r num; do
      printf "%d\n" "$num"
    done
  fi
}

# Binary functions
dtob() {
  if [ $# -gt 0 ]; then
    for num in "$@"; do
      echo "obase=2;$num" | bc
    done
  else
    while read -r num; do
      [ -n "$num" ] && echo "obase=2;$num" | bc
    done
  fi
}

htob() {
  if [ $# -gt 0 ]; then
    for num in "$@"; do
      num="${num#0x}"
      num="${num#0X}"
      echo "obase=2;ibase=16;$num" | bc
    done
  else
    while read -r num; do
      [ -n "$num" ] && {
        num="${num#0x}"
        num="${num#0X}"
        echo "obase=2;ibase=16;$num" | bc
      }
    done
  fi
}

btod() {
  if [ $# -gt 0 ]; then
    for num in "$@"; do
      printf "%d\n" "$((2#$num))"
    done
  else
    while read -r num; do
      [ -n "$num" ] && printf "%d\n" "$((2#$num))"
    done
  fi
}

btoh() {
  if [ $# -gt 0 ]; then
    for num in "$@"; do
      printf "0x%X\n" "$((2#$num))"
    done
  else
    while read -r num; do
      [ -n "$num" ] && printf "0x%X\n" "$((2#$num))"
    done
  fi
}

# vim mode
bindkey -v

# Auto-start tmux if not already inside one
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t 0 || tmux new-session -s 0
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$HOME/.local/bin:$PATH"

[ -s "/home/idan/.bun/_bun" ] && source "/home/idan/.bun/_bun"

# Neovim
export NVIM="$HOME/.config/nvim"
export EDITOR=nvim

# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

