# optional settings
umask 022
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt NOTIFY
setopt NOHUP
setopt MAILWARN

# histfile settings
HISTFILE=$HOME/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Fixing some oddities
# [Ctrl-RightArrow] - move forward one word
bindkey '^[[1;5C' forward-word
# [Ctrl-LeftArrow] - move backward one word
bindkey '^[[1;5D' backward-word

# PS1 settings
PS1="%F{#55ccaa}[ %F{#00ff55}%n@%m %F{yellow}%~ %F{#55ccaa}] # %F{white}"
source /home/evie/.git/github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
