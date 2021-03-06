# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="norm"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to  shown in the command execution time stamp 
# in the history command output. The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|
# yyyy-mm-dd
# HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
export PATH=/usr/local/bin:/opt/local/bin:/opt/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin

# Custom aliases

# Win: aliases="nano ~/bash_profile"
alias aliases="nano ~/.zshrc"
alias gs="git status"
alias ga="git add -A && git status"
alias gp="git pull"
alias gpu="git push"
alias gpuf="git push -f"
alias gc="git checkout"
alias gcb="git checkout -b"
alias gcm="git commit -m"
alias gb="git branch"
alias gd="git diff"
alias gl="git log"
alias gf="git fetch --prune && git branch --merged | grep -v '\*\|master\|develop' | xargs -n 1 git branch -d"
alias squash="git rebase --interactive"
alias gitresetreset="git reset HEAD@{1}"
alias pr="/c/Users/maxime.leboeuf/Documents/_backup/pr.sh"

# Custom windows aliases
alias e="explorer ."
alias binobj='find . -iname "bin" -o -iname "obj" | xargs rm -rf'
alias recycle='/c/Windows/System32/inetsrv/appcmd recycle apppool ".NET v4.5"'

# To setup VS-Chromium-extension for better "fast find" in a project:
alias setupfastfind="echo $'[SearchableFiles.include]\r\n*.cs\r\n*.xaml\r\n*.resw\r\n\r\n[SearchableFiles.ignore]\r\nbin/\r\nobj/\r\n' > vs-chromium-project.txt && echo $'vs-chromium-project.txt\r\n*.favdoc' >> .git/info/exclude"
# Alternative when there's an "src" folder at the root of the git repo
alias setupfastfind2="echo $'[SearchableFiles.include]\r\n*.cs\r\n*.xaml\r\n*.resw\r\n\r\n[SearchableFiles.ignore]\r\nsrc/bin/\r\nsrc/obj/\r\n' > src/vs-chromium-project.txt && echo $'src/vs-chromium-project.txt\r\nsrc/*.favdoc' >> .git/info/exclude"
