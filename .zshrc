# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_THEME="powerlevel10k/powerlevel10k"

source "$HOME/antigen.zsh"

antigen theme romkatv/powerlevel10k

antigen use oh-my-zsh

# package manager/ env support
# antigen bundle git
# antigen bundle rvm
# antigen bundle pyenv
# antigen bundle nvm
# antigen bundle npm
# antigen bundle pip
# antigen bundle gem

# language support
# antigen bundle perl
# antigen bundle ruby
# antigen bundle python

# os support
# antigen bundle ubuntu

# antigen bundle zoxide
# antigen bundle history

# antigen bundle asdf
# antigen bundle cpanm

source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

antigen apply

# history setup
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt share_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_verify

# completion using arrow keys (based on history)
bindkey '^[[A' history-search-backward
bindkey '^[[B' history-search-forward

eval "$(zoxide init zsh)"

# Start of .bashrc

export CARGOINSTALLPATH="$HOME/.cargo/bin/"
export PATH="$CARGOINSTALLPATH:$PATH"

export MASON_INSTALLED_LSPS="$HOME/.local/share/Simplexity.nvim/mason/bin/"
export PATH="$MASON_INSTALLED_LSPS:$PATH"

eval "$(rbenv init -)"

# GVM init
# /home/renier/.gvm/bin
export GOINSTALLPATH="$HOME/.gvm/bin/"
export PATH="$GOINSTALLPATH:$PATH"
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"

# NVM init

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export NVM_update="curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash"
export SUDO_ASKPASS=/usr/bin/gnome-ssh-askpass

# >>> juliaup initialize >>>
# !! Contents within this block are managed by juliaup !!

path=("$HOME/.juliaup/bin" $path)
export PATH

# <<< juliaup initialize <<<

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

#Exit bashrc

setopt COMBINING_CHARS

# Remap fdfind to fd
alias fd="fdfind"

# Running multiple neovim configs
alias cvim="NVIM_APPNAME=Complexity.nvim nvim"
alias bvim="NVIM_APPNAME=Simplexity.nvim nvim"
alias svim="NVIM_APPNAME=Simplicity.nvim nvim"
alias tvim="NVIM_APPNAME=tiny.nvim nvim"

# Select the name of the .config file to run as neovim config
# Tiny is neovim with some handy options set, no plugins, no config is nothing
function nvims() {
    items=("no-config" "tiny.nvim" "Simplicity.nvim" "Simplexity.nvim" "Complexity.nvim")
    config=$(printf "%s\n" "${items[@]}" | fzf --prompt=" Neovim Config  " --height=~50% --layout=reverse --border --exit-0)

    if [[ -z $config ]]; then
        echo "Nothing selected"
        return 0
    fi
    if [[ $config == "no-config" ]]; then
        config=""
    fi

    NVIM_APPNAME=$config nvim"$@"
}

bindkey -s ^a "nvims\n"


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
