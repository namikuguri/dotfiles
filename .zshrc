# 少し凝った zshrc
# License : MIT
# http://mollifier.mit-license.org/
# https://gist.github.com/mollifier/4979906

########################################
# パス
ZSH_D=$HOME/.zsh
export EDITOR=/Applications/MacVim.app/Contents/MacOS/Vim
export BREW_HOME=/usr/local
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

########################################
# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用できるようにする
autoload -Uz colors
colors

# emacs 風キーバインドを有効にする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

########################################
# 補完
# For zsh-completions
fpath=(BREW_HOME/share/zsh-completions $fpath)

# 補完機能を有効にする
autoload -Uz compinit
compinit -u

#########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook
autoload -Uz VCS_INFO_get_data_git; VCS_INFO_get_data_git 2>/dev/null
autoload -Uz VCS_INFO_git_getaction; VCS_INFO_git_getaction 2>/dev/null

########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# PROMPT変数内で変数参照する
setopt prompt_subst

#########################################
# プロンプト
function git_info {
  local name st color gitdir action
  if [[ "$PWD" =~ '/\.git(/.*)?$' ]]; then
    return
  fi
  name=`git rev-parse --abbrev-ref=loose HEAD 2> /dev/null`
  if [[ -z $name ]]; then
    return
  fi

  gitdir=`git rev-parse --git-dir 2> /dev/null`
  action=`VCS_INFO_git_getaction "$gitdir"` && action="($action)"

  st=`git status 2> /dev/null`
    if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
      color=%F{green}
    elif [[ -n `echo "$st" | grep "^nothing added"` ]]; then
      color=%F{yellow}
    elif [[ -n `echo "$st" | grep "^# Untracked"` ]]; then
      color=%B%F{red}
    else
      color=%F{red}
    fi

  echo "$color$name$action%f%b "
}

update_prompt() {
  local current_working_directory \
    current_branch \
    vcs_prompt

    current_working_directory="%~"
    current_branch=$(git_info)

    PROMPT="[${current_working_directory}] $current_branch"
    PROMPT="$PROMPT "$'\n'"(っ'-')╮ =͟͟͞͞  ◎  > %(!.#.$) %{$reset_color%}"
}
add-zsh-hook precmd update_prompt

########################################
# エイリアス
alias chrome="open -a Google\ Chrome.app"
alias safari="open -a Safari"
alias firefox="open -a Firefox"

alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'

alias illustrator="open -a /Applications/Adobe\ Illustrator\ CC\ 2015/Adobe\ Illustrator.app"
alias photoshop="open -a /Applications/Adobe\ Photoshop\ CC\ 2015/Adobe\ Photoshop\ CC\ 2015.app"
alias animate="open -a /Applications/Adobe\ Edge\ Animate\ CC\ 2015/Adobe\ Edge\ Animate\ CC\ 2015.app"
alias sketch="open -a /Applications/Sketch.app"
alias gvim="open -a /Applications/MacVim.app"

alias preview="open -a Preview.app"
alias finder="open -a Finder.app"

########################################
# rbenv

eval "$(rbenv init -)"
