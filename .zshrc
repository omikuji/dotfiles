source ~/.bashrc
source ~/.bash_profile

REPORTTIME=3

setopt HIST_IGNORE_DUPS       
setopt HIST_IGNORE_ALL_DUPS   
setopt HIST_IGNORE_SPACE      
setopt HIST_FIND_NO_DUPS      
setopt HIST_REDUCE_BLANKS     
setopt HIST_NO_STORE          
setopt HISTVERIFY             
setopt APPEND_HISTORY         
setopt EXTENDED_HISTORY       
setopt HIST_EXPIRE_DUPS_FIRST 
setopt HIST_NO_FUNCTIONS      
setopt INC_APPEND_HISTORY     
setopt SHARE_HISTORY          
unsetopt HIST_VERIFY          

HISTFILE=$HOME/.zsh_history
HISTSIZE=1000000
SAVEHIST=100000000
PATH=${PATH}:~/bin:~/dev/omikuji/workspace/bin
HISTTIMEFORMAT="[%Y/%M/%D %H:%M:%S] "

autoload -U compinit promptinit
compinit -u

zstyle ':completion::complete:*' use-cache true
zstyle ':completion:*:default' menu select=1

zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

autoload colors
zstyle ':completion:*' list-colors "${LS_COLORS}"

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

autoload -U zcalc
autoload zed

autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end

bindkey -v

PROMPT="[%n@%m %~]%(!.#.$) "

LISTMAX=1000

WORDCHARS="$WORDCHARS|:"

setopt AUTO_MENU
setopt AUTO_CD
setopt AUTO_NAME_DIRS
unsetopt AUTO_REMOVE_SLASH
setopt AUTO_LIST
setopt AUTO_PARAM_KEYS
setopt PROMPT_SUBST
setopt AUTO_RESUME
setopt rm_star_silent
setopt MARK_DIRS
unsetopt RM_STAR_WAIT
setopt SUN_KEYBOARD_HACK
setopt EXTENDED_GLOB
setopt LIST_TYPES
setopt NO_BEEP
setopt ALWAYS_LAST_PROMPT
setopt CDABLE_VARS
setopt ALL_EXPORT
setopt AUTO_PARAM_SLASH
setopt AUTO_PUSHD
setopt CORRECT
unsetopt complete_aliases
unsetopt GLOB_DOTS
setopt LIST_PACKED
setopt PUSHD_IGNORE_DUPS
setopt NO_LIST_BEEP
unsetopt IGNORE_EOF
setopt NOTIFY
setopt MULTIOS
setopt NUMERIC_GLOB_SORT
unsetopt NOCLOBBER
setopt MAGIC_EQUAL_SUBST
setopt PRINT_EIGHT_BIT
setopt TRANSIENT_RPROMPT
unsetopt PRINT_EXIT_VALUE
setopt BRACE_CCL
setopt NO_CHECK_JOBS
setopt NO_PROMPTCR
setopt SHORT_LOOPS
unsetopt XTRACE
unsetopt AUTOREMOVESLASH
unsetopt CHASE_LINKS
setopt FUNCTION_ARGZERO
setopt NO_FLOW_CONTROL
setopt INTERACTIVE_COMMENTS
unsetopt SINGLE_LINE_ZLE
setopt COMPLETE_IN_WORD
setopt NO_TIFY

bindkey "^U" backward-kill-line

function cdup() {
  echo
  cd ..
  zle reset-prompt
}
zle -N cdup
bindkey '^^' cdup

zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char

autoload -Uz vcs_info
zstyle ":vcs_info:*" enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "-"
zstyle ':vcs_info:git:*' actionformats '%F{5}[%f%s%F{5}]%F{3}%F{5}[%f%r%F{5}]%F{3}%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f%F{1}%u%f%F{6}%c%f'
zstyle ':vcs_info:git:*' formats       '%F{5}[%f%s%F{5}]%F{3}%F{5}[%f%r%F{5}]%F{3}%F{5}[%F{2}%b%F{5}]%F{1}%u%f%F{6}%c%f'
precmd() { vcs_info }
RPROMPT='${vcs_info_msg_0_}%f'

LSCOLORS=gxfxcxdxbxegedabagacad

if [[ $(uname) =~ ^Darwin* ]]; then
  # for mac
  alias ls='ls -G'
  alias firefox='open -a /Applications/Firefox.app'
  alias chrome='open -a "Google Chrome"'
else
  # for linux
  alias ls='ls --color'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

if type trash-put &> /dev/null
then
  alias rm=trash-put
fi

if type nvim &> /dev/null
then
  export EDITOR="nvim"
  alias vi='nvim'
fi

alias ai='open https://chat.openai.com/'

export SDKMAN_DIR="$HOME/.sdkman"
export PATH="$HOME/bin:$PATH"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# PATH for Mac
if [[ $(uname) =~ ^Darwin* ]]; then
  # psql
  export PATH=/opt/homebrew/opt/libpq/bin:$PATH
  # nodebrew
  export PATH=$HOME/.nodebrew/current/bin:$PATH
  # mysql
  export PATH=/opt/homebrew/opt/mysql-client/bin:$PATH
fi

# ssh-add
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/omikuji_rsa


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/omikuji/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/omikuji/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/omikuji/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/omikuji/google-cloud-sdk/completion.zsh.inc'; fi
export PATH=$HOME/.nodebrew/current/bin:$PATH

bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

bindkey '^R' history-incremental-pattern-search-backward
bindkey '^S' history-incremental-pattern-search-forward

