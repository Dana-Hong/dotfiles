# ~/.zshrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'

# Prompt
#PROMPT='[%n@%m %1~]$ '

# Keybindings for Home and End keys
bindkey "^[[H" beginning-of-line   # Home key
bindkey "^[[F" end-of-line         # End key
bindkey '^[[C' forward-char
bindkey '^[[D' backward-char
bindkey -v

# bindkey "\e[H" beginning-of-line    # Alternate Home key
# bindkey "\e[F" end-of-line          # Alternate End key
#
# Save command history between sessions
HISTFILE=~/.zsh_history  # Location of the history file
HISTSIZE=1000            # Number of commands to remember in memory
SAVEHIST=1000            # Number of commands to save in the history file

# Share history across terminals
setopt inc_append_history  # Append history to the file as commands are entered
setopt share_history        # Share history across all zsh sessions

function set_win_title(){
    echo -ne "\033]0; $(basename "$PWD") \007"
}
starship_precmd_user_func="set_win_title"
fastfetch

export PATH=$PATH:$HOME/go/bin
export NVM_DIR="$HOME/nvim"
export EDITOR=nvim
source /usr/share/nvm/init-nvm.sh

function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

eval "$(starship init zsh)"


# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

alias zed='zeditor'
alias la='eza -a'
alias ll='eza -la'
alias lt='eza --tree'
