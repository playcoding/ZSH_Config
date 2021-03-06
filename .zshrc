# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
#ZSH_THEME="agnoster"
#ZSH_THEME="smt"
ZSH_THEME="ys"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git ruby autojump osx mvn gradle systemd colorize history-substring-search common-aliases history themes per-directory-history github zsh-syntax-highlighting vi-mode cp jump colored-man-pages sudo brew brew-cask node extract)

# User configuration


source $ZSH/oh-my-zsh.sh

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

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
#################### 别名设置开始 ####################
alias zshconfig="vi ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias cls='clear'
alias ll='ls -l'
alias la='ls -a'
alias vi='vim'
alias javac="javac -J-Dfile.encoding=utf8"
alias grep="grep --color=auto"
alias -s html=vi     # 在命令行直接输入后缀为 html 的文件名，会在 TextMate 中打开
alias -s rb=vi       # 在命令行直接输入 ruby 文件，会在 TextMate 中打开
alias -s py=vi       # 在命令行直接输入 python 文件，会用 vim 中打开，以下类似
alias -s js=vi
alias -s c=vi
alias -s java=vi
alias -s txt=vi
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

# 显示Mac系统隐藏文件 (macOS 10.13 起无效改用 cmd + shift + .)
# alias showallfile='defaults write com.apple.finder AppleShowAllFiles -bool true'
# 不显示Mac系统隐藏文件 (macOS 10.13 起无效改用 cmd + shift + .)
# alias noshowallfile='defaults write com.apple.finder AppleShowAllFiles -bool false'
#################### 别名设置结束 ####################

# 开启命令输入纠错功能
setopt correctall

# Shell 中使用 Vi 模式
bindkey -v

# 设定 Vi 下 INSERT 模式转换 NORMAL 模式的快捷键
bindkey -M viins 'jj' vi-cmd-mode

# 在终端命令行最右侧显示 Vim 模式的 INSERT 与 NORMAL 状态，提示文字根据不同模式显示不同的颜色
#################### 开始 ####################
VIMODE='[INSERT]'
function zle-line-init zle-keymap-select {
    VIMODE="${${KEYMAP/vicmd/[NORMAL]}/(main|viins)/[INSERT]}"
    # 根据终端的 Vim 模式来更改提示文字的颜色
    if [ $VIMODE = "[INSERT]" ] ; then
        PROMPT='
%{$fg[cyan]%}%n@%m %{$reset_color%} %{$fg[blue]%}%d %{$reset_color%} %{$fg[gray]%}[%D %t] %{$reset_color%} $(git_prompt_info)
%{$fg[white]%}%!%{$reset_color%} %{$fg[green]%}${VIMODE} >>%{$reset_color%} '
        RPROMPT=''
    elif [ $VIMODE = "[NORMAL]" ] ; then
        PROMPT='
%{$fg[cyan]%}%n@%m %{$reset_color%} %{$fg[blue]%}%d %{$reset_color%} %{$fg[gray]%}[%D %t] %{$reset_color%} $(git_prompt_info)
%{$fg[white]%}%!%{$reset_color%} %{$fg[red]%}${VIMODE} >>%{$reset_color%} '
        RPROMPT=''
    fi

    zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select
# 按 ESC 后切换模式默认为0.4秒，更改成0.1秒，设置后 ESC 映射 jj 快捷键失效
# export KEYTIMEOUT=1

#################### 结束 ####################

export PATH=$HOME/bin:/usr/local/bin:/usr/local/sbin:$PATH

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
  alias ls='ls -F --show-control-chars --color=auto'
  eval `gdircolors -b $HOME/.dir_colors`

export PATH="/usr/local/opt/sqlite/bin:$PATH"

export PATH="/usr/local/opt/libxml2/bin:$PATH"

export PATH="/usr/local/opt/openssl/bin:$PATH"

# Autojump 插件的配置
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

# zsh-completions 插件的配置
fpath=(/usr/local/share/zsh-completions $fpath)

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

