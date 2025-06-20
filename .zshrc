# We close process monitoring before we move forward to avoid polluting the term. We run this first as a bg process, cause it takes too long to complete. Then we write the esp-idf related env variables to a tmp file
#set +m
#(source /opt/esp-idf/export.sh &> /dev/null && env | grep "esp-idf" > /tmp/esp_idf_evie_env.tmp ) &

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="af-magic"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

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
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-autosuggestions
    )


# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

##### EVIE ZONE #####

# export colors
#LS_COLORS=$LS_COLORS:'di=0;35:' ; export LS_COLORS
export LS_OPTIONS='--color=auto'
eval "$(dircolors -b)"
alias ls='ls $LS_OPTIONS'

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
# del key returns tilde
bindkey '\e[3~' delete-char

# PS1 settings
#PS1="%F{#55ccaa}[ %F{#00ff55}%n@%m %F{yellow}%~ %F{#55ccaa}] # %F{white}"
source /home/evie/.git/github/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# vi mode
bindkey -v
# restore zsh functionality
bindkey ^R history-incremental-search-backward 
bindkey ^S history-incremental-search-forward

# git in zsh
#autoload -Uz vcs_info
#autoload -Uz compinit && compinit
#precmd_vcs_info() { vcs_info }
#precmd_functions+=( precmd_vcs_info )
#setopt prompt_subst
#RPROMPT='${vcs_info_msg_0_}'
# PROMPT='${vcs_info_msg_0_}%# '
#zstyle ':vcs_info:git:*' formats '%b'

# coloring and whatnot
# completion colors
zstyle ':completion:*:*' list-colors '=*=1;128;256;196'
zstyle ':completion:*:*:kill:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'

# exports
# eclpise
export GDK_USE_XFT=0
#. /opt/esp-idf/export.sh &> /dev/null &

clear

SSH_ENV="$HOME/.ssh/agent-environment"

function start_agent {
    echo "Initialising new SSH agent..."
    ssh-agent | sed 's/^echo/#echo/' >"$SSH_ENV"
    echo succeeded
    chmod 600 "$SSH_ENV"
    . "$SSH_ENV" >/dev/null
    ssh-add id_ed25519
}

# Source SSH settings, if applicable

if [ -f "$SSH_ENV" ]; then
    . "$SSH_ENV" >/dev/null
    #ps $SSH_AGENT_PID doesn't work under Cygwin
    ps -ef | grep $SSH_AGENT_PID | grep ssh-agent$ >/dev/null || {
        start_agent
    }
else
    start_agent
fi

eval `keychain --eval ~/.ssh/id_ed25519`
eval `keychain --eval ~/.ssh/id_uni`

# NDS / Switch toolchain
export DEVKITARM="/opt/devkitpro/devkitARM"
export DEVKITPRO="/opt/devkitpro"

clear

# Last, but not least, my greeting thingy
#uwufetch
macchina | sed "s/\( Type1ProductConfigId\| 103C_5335M8\)//g" | sed "s/ 13-/ 13-bf0xxx/g"| sed "s/13-bf0xxxbf0xxx/13-bf0xxx/g"
echo
df -hT -t ext4 -t fuseblk | grep -v '/boot'
#echo "----------------------------------------------------------------"

alias sl='exec dbus-launch sway -c ~/.config/sway/config'
alias kssh="kitty +kitten ssh"
alias spw="startplasma-wayland"
alias i3l="xinit -- :0 vt2"
alias ffmpreg="ffmpeg"
alias factorio-steam="steam steam://rungameid/427520"
alias mbit="picocom -b 115200 -c -d 8 --imap lfcrlf"
alias pause="kill -STOP $\(pgrep -f \$1\)"
alias cont="kill -CONT $\(pgrep -f \$1\)"
alias pauseall="killall -STOP"
alias contall="killall -CONT"
function killname(){ kill -9 $(ps -u evie a | grep $1 | grep -v grep | awk '{print $1}') }

# This HAS to be at the END of the script. It's waiting for bg tasks to complete and sources their
#{
#	wait
#	source <(cat /tmp/esp_idf_evie_env.tmp)
#	rm "/tmp/esp_idf_evie_env.tmp"
#	set -m
#} &
#wait
#source <(cat /tmp/esp_idf_evie_env.tmp)
#rm "/tmp/esp_idf_evie_env.tmp"
#set -m

alias ghidras=_JAVA_AWT_WM_NONREPARENTING=1 ghidra
PATH+=:~/.local/bin
