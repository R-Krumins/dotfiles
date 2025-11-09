### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# Load completions
autoload -U compinit && compinit

# My zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
#zinit light Aloxaf/fzf-tab
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions

# Keybindings
bindkey -e '^y' autosuggest-accept
bindkey '^p' history-search-backward
bindkey -s ^f "tmux-sessionizer\n"

openNvim() { nvim . }
zle -N openNvim
bindkey '^n' openNvim

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space #does not save to hist if command prefixed with space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
#zstyle ':completion:*' menu no
#zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
#zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# Aliases
alias ls='lsd --icon never'
alias tree='lsd --tree'
alias n='nvim'
# [B]atcave [O]pen [D]irectory
alias bod='dir=$(\ls ~/batcave | fzf) && [ -n "$dir" ] && \cd ~/batcave/"$dir" && nvim .'
# [B]atcave [O]pen [F]ile
alias bof='file=$(rg --files ~/batcave | fzf --preview "batcat --color=always {}" --preview-window "~3" ) && [ -n "$file" ] && nvim "$file"'
# [T]mux [O]pen
alias to='tmux attach-session -t $(tmux ls | fzf | cut -d ':' -f 1)'

# Path
export PATH="$PATH:/home/friko/scripts"

# tmux in ghostty doesnt display nerd font icons without this
export LANG=en_US.UTF-8

# add go bins if the dir exists on machine
if [ -d "$HOME/go/bin" ]; then
    export PATH="$HOME/go/bin:$PATH"
fi

# Shell integrations
eval "$(zoxide init --cmd cd zsh)"
eval "$(fzf --zsh)"
eval "$(starship init zsh)"
