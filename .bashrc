[ -z "$PS1" ] && return

export HISTCONTROL=ignorespace
export FZF_DEFAULT_OPTS="--height=40% --layout=reverse"

alias ll="ls -alh --color"
alias k=kubectl
alias grep="grep --color=always"
alias make="make -j 8"
# GovCloud
alias aws-gov-fed="saml2aws login -a govcloud-us1-fed-human-readonly"

complete -F __start_kubectl k

source /usr/local/opt/bash-completion/etc/bash_completion
source <(kubectl completion bash)
source /usr/local/opt/kube-ps1/share/kube-ps1.sh
source /Users/gianluca.bortoli/.git-prompt.sh
source /Users/gianluca.bortoli/.git-completion.bash
source $HOME/.cargo/env

export PATH=$PATH:~/bin
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PKG_CONFIG_PATH="/usr/local/opt/openssl@1.1/lib/pkgconfig"
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:"/usr/local/lib/pkgconfig"
export JAVA_HOME=$(/usr/libexec/java_home -v 15)
export EDITOR=vim
# Add volta to PATH
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
# Add ddr scripts to manage team staging branch
export PATH="${HOME?}/go/src/github.com/DataDog/dd-go/scripts:${PATH?}"

# BEGIN ANSIBLE MANAGED BLOCK
# Add homebrew binaries to the path.
export PATH="/usr/local/bin:${PATH?}"

# Force certain more-secure behaviours from homebrew
export HOMEBREW_NO_INSECURE_REDIRECT=1
export HOMEBREW_CASK_OPTS=--require-sha

# Load ruby shims
eval "$(rbenv init -)"

# Prefer GNU binaries to Macintosh binaries.
export PATH="/usr/local/opt/coreutils/libexec/gnubin:${PATH}"

# Add datadog devtools binaries to the PATH
export PATH="${HOME?}/dd/devtools/bin:${PATH?}"

# Point GOPATH to our go sources
export GOPATH="${HOME?}/go"
export GOBIN="${GOPATH}/bin"
export PATH="${GOBIN}:${PATH}"

# Point DATADOG_ROOT to ~/dd symlink
export DATADOG_ROOT="${HOME?}/dd"

# Tell the devenv vm to mount $GOPATH/src rather than just dd-go
export MOUNT_ALL_GO_SRC=1

# store key in the login keychain instead of aws-vault managing a hidden keychain
export AWS_VAULT_KEYCHAIN_NAME=login

# tweak session times so you don't have to re-enter passwords every 5min
export AWS_SESSION_TTL=24h
export AWS_ASSUME_ROLE_TTL=1h
# END ANSIBLE MANAGED BLOCK

function kt() {
    kubectl exec -it -n sre $(kubectl get pod -n sre -l service="toolbox" --field-selector=status.phase=Running -o=jsonpath='{.items[0].metadata.name}') -- /bin/bash;
}
# GovCloud
function govfed() {
    aws --profile govcloud-us1-fed-human-readonly --region=us-gov-west-1 -- $@
}

export PS1="$(starship prompt --status=$?)"
eval "$(starship init bash)"
. "$HOME/.cargo/env"
