if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
    tmux
  fi

if which jenv > /dev/null; then eval "$(jenv init -)"; fi

export GOROOT=/usr/local/opt/go/libexec
export GOPATH=$HOME/go

export PATH="$HOME/bin:$PATH"
export PATH=/usr/local/sbin:$PATH
export PATH=$PATH:/Users/aidanf/.rvm/gems/ruby-2.3.0/bin
export PATH=$PATH:~/.composer/vendor/bin
export PATH="$HOME/.jenv/shims:$PATH"
export PATH="/usr/local/opt/make/libexec/gnubin:$PATH"
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin
export PATH=$PATH:/Users/aidanf/Library/Python/3.8/bin/

export EDITOR='nvim'
export EMAIL='aidan.fewster@acuris.com'

export PATH=$PATH:/usr/local/opt/go/libexec/bin # Add go to PATH
export PATH=$PATH:$HOME/go/bin/:$HOME/Downloads/pact/bin/
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/opt/python@3.8/libexec/bin:$PATH
export PATH="$HOME/.serverless/bin:$PATH"

alias dev="cd /Users/aidanf/Development/"
alias mmgo="cd /Users/aidanf/go/src/github.com/mergermarket"
alias gpu="git rev-parse --abbrev-ref HEAD | xargs git push -u origin" # push new branch to origin
alias aws_login="sh ~/Development/aws-accounts/login.sh"
alias where_is_my_phone="node /Users/aidanf/Documents/Backup/Sites/personal/findmyphone/index.js"
alias unsafe-chrome='open -a Google\ Chrome --args --disable-web-security'

encrypt-file() {
    openssl enc -aes-256-cbc -salt -in $1 -out $1.enc
}

decrypt-file() {
    decryptName=${1//.enc/}
    openssl enc -aes-256-cbc -salt -d -in $1 -out $decryptName
}

kill-port() {
  if [ -z "$1" ]; then
    echo "Usage: kill-port [port number]" >&2
    return 1
  fi
  sudo lsof -i TCP:$1 | awk '/LISTEN/{print $2}' | xargs kill -9
}

compinit


function start-aws-es-proxy {
  docker run --rm  -e AWS_ACCESS_KEY_ID -e AWS_SECRET_ACCESS_KEY -e AWS_SESSION_TOKEN -p 8080:8080 cllunsford/aws-signing-proxy:latest -region eu-west-1 -target "https://$(aws es describe-elasticsearch-domain --domain-name $1 | jq -r .DomainStatus.Endpoints.vpc)"
}

export GPG_TTY="$(tty)"
export GOPRIVATE=github.com/mergermarket/*

source $HOME/.profile_secrets

export NVM_DIR="$HOME/.nvm"
  [ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion


autoload bashcompinit && bashcompinit
complete -C aws_completer aws
