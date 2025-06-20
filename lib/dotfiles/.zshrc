##################################################################################################
## This file is symlinked, so changes here will automatically be applied to your zsh setup. Also,
## when you commit changes here, they will be reflected on your other laptops when they pull the
## latest. If you need to add stuff that should not be applied to all your laptops, please put
## those settings in the local file '~/.zshrc.local' which will not be synched to other machines.
##################################################################################################

export PATH=${HOME}/bin:/opt/homebrew/bin:${PATH}

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes

ZSH_THEME="powerlevel10k/powerlevel10k"

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

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
COMPLETION_WAITING_DOTS="true"

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

export UPDATE_ZSH_DAYS=1

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  alias-tips
  aws
  colored-man-pages
  command-not-found
  copypath
  fast-syntax-highlighting
  fzf
  kubectl
  ssh-agent
  terraform
  zsh-autosuggestions
  zsh-interactive-cd
  autoupdate
)

##
# Completion
##
autoload -U compinit
compinit
zmodload -i zsh/complist
setopt hash_list_all            # hash everything before completion
setopt always_to_end            # when completing from the middle of a word, move the cursor to the end of the word
setopt complete_in_word         # allow completion from within a word/phrase
setopt correct                  # spelling correction for commands
setopt list_ambiguous           # complete as much of a completion until it gets ambiguous.

# sections completion !
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*' # case insensitive completion
zstyle ':completion:*' menu select=1 _complete _ignored _approximate # enable completion menu

## 
# Aliases
##

# Always enable colored `grep` output
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias ls="command ls ${colorflag}"                                                # Always use color output for `ls`
alias chrome='/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome'     # Google Chrome
alias c="tr -d '\n' | pbcopy"                                                     # Trim new lines and copy to clipboard
alias reload="exec ${SHELL} -l"                                                   # Reload the shell (i.e. invoke as a login shell)
alias path='echo -e ${PATH//:/\\n}'                                               # Print each PATH entry on a separate line
alias watch='watch '                                                              # make aliases work with 'watch'

alias python=python3
alias pip=pip3
alias awswho="aws --region eu-north-1 sts get-caller-identity | cat"
alias myip="curl ipv4.icanhazip.com"
alias joke="curl -s https://icanhazdadjoke.com"
alias java8="sdk default java 8.0.402-amzn"
alias java11="sdk default java 11.0.22-amzn"
alias java17="sdk default java 17.0.10-amzn"
alias java21="sdk default java 21.0.2-amzn"

# SDKMAN setup
export SDKMAN_DIR=$(brew --prefix sdkman-cli)/libexec
[[ -s "${SDKMAN_DIR}/bin/sdkman-init.sh" ]] && source "${SDKMAN_DIR}/bin/sdkman-init.sh"

# NVM setup
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

##
# Extra Settings
##
[[ -f ~/.zshrc.user ]] && source ~/.zshrc.user
[[ -f ~/.zshrc.extra ]] && source ~/.zshrc.extra
[[ -f ~/.zshrc.local ]] && source ~/.zshrc.local

# Load fzf customizations if they exist
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
###source $ZSH/custom/themes/powerlevel10k/powerlevel10k.zsh-theme
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Source oh-my-zsh.sh must be run after the PATH is fully set up
source $ZSH/oh-my-zsh.sh
