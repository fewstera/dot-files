if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

export PATH=$PATH:/Users/fewsta03/.rvm/gems/ruby-2.3.0/bin
export PATH=$PATH:~/.composer/vendor/bin
export PATH=/usr/local/bin:$PATH

#note you may need to change the below variable to en1
NETWORK_DEVICE=en0

alias onreith='onreith_npm;  onreith_git; onreith_env; switch_to_on_network; switch_to_corporate_wireless; newline; echo "Now on REITH. Run \"bbc mount\" to mount your network drives."; newline'
alias offreith='offreith_npm; offreith_git; offreith_env; bbc unmount; switch_to_off_network; switch_to_bbc_staff_ssid; newline; echo "Now off REITH."; newline'

alias newline='echo ""'
alias onreith_npm='npm config set proxy http://www-cache.reith.bbc.co.uk:80'
alias offreith_npm='npm config rm proxy'
alias onreith_git='git config --global http.proxy http://www-cache.reith.bbc.co.uk:80'
alias offreith_git='git config --global --unset http.proxy'
alias onreith_env='export http_proxy="http://www-cache.reith.bbc.co.uk:80"; export https_proxy="http://www-cache.reith.bbc.co.uk:80";export HTTP_PROXY="http://www-cache.reith.bbc.co.uk:80"; export HTTPS_PROXY="http://www-cache.reith.bbc.co.uk:80"'
alias offreith_env='unset http_proxy; unset https_proxy; unset HTTP_PROXY; unset HTTPS_PROXY'

# switch networks. (the > /dev/null suppresses output, without this the command always says "found it!" very helpfully!
# note - I followed the following instructions (substituting username for ashtoc03) to make this stop asking for sudo: http://superuser.com/a/454612
alias switch_to_on_network='sudo networksetup -switchtolocation "BBC On Network" > /dev/null'
alias switch_to_off_network='sudo networksetup -switchtolocation "BBC Off Network" > /dev/null'

alias switch_to_corporate_wireless='sudo networksetup -removepreferredwirelessnetwork $NETWORK_DEVICE "BBC Staff SSID"; sudo networksetup -removepreferredwirelessnetwork $NETWORK_DEVICE "BBC Staff Wi-Fi"; sudo networksetup -removepreferredwirelessnetwork $NETWORK_DEVICE "Corporate_Wireless_Network"; sudo networksetup -addpreferredwirelessnetworkatindex $NETWORK_DEVICE "Corporate_Wireless_Network" 0 WPA2E; networksetup -setairportpower $NETWORK_DEVICE off; sleep 2; networksetup -setairportpower $NETWORK_DEVICE on'
alias switch_to_bbc_staff_ssid='sudo networksetup -removepreferredwirelessnetwork $NETWORK_DEVICE "Corporate_Wireless_Network"; sudo networksetup -removepreferredwirelessnetwork $NETWORK_DEVICE "BBC Staff SSID"; sudo networksetup -removepreferredwirelessnetwork $NETWORK_DEVICE "BBC Staff Wi-Fi"; sudo networksetup -addpreferredwirelessnetworkatindex $NETWORK_DEVICE "BBC Staff SSID" 0 WPA2E; sudo networksetup -addpreferredwirelessnetworkatindex $NETWORK_DEVICE "BBC Staff Wi-Fi" 0 WPA2E; networksetup -setairportpower $NETWORK_DEVICE off; sleep 2; networksetup -setairportpower $NETWORK_DEVICE on'

alias whitelister="sh -c 'cd /Users/fewsta03/Sites/bbc/other/whitelister/; node whitelister.js'"
alias bbc='~/Sites/bbc/news/special/utils/main.sh'
alias bbcftp='~/Sites/ftp.pl'

alias iframetest_setup='cd ~/.grunt-init/iframe-scaffold/root/newsspec_'
alias iframetest_node='iframetest_setup && node_modules/.bin/vows tests/node/tests/*.js --verbose'
alias iframetest_cucumber='iframetest_setup && node_modules/casperjs/bin/casperjs test --fail-fast tests/cucumber.js'
alias iframetest='iframetest_node && iframetest_cucumber'
alias scaffold_install='npm install && cd node_modules/developer-scaffold-iframe-wrapper && npm install && cd - && cd node_modules/developer-scaffold-full-width-wrapper && npm install && cd -'

alias where_is_my_phone="node /Users/fewsta03/Sites/personal/findmyphone/index.js"

alias quickftp="/Users/fewsta03/ftp.pl"

export GRASS_PYTHON=/usr/bin/python2.6

alias unsafe-chrome='open -a Google\ Chrome --args --disable-web-security'

export NVM_DIR="/Users/fewsta03/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

alias dockenv='(docker-machine start dev || true) && eval "$(docker-machine env dev)"'

export EDITOR='nvim'

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH="$PATH:$HOME/go/bin" # Add go to PATH

export COSMOS_CERT=/Users/fewsta03/certificate.pem

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

export NODE_PATH=`which node`

export NODE_PATH=$NODE_PATH:/Users/fewsta03/.nvm/versions/node/v6.9.4/lib/node_modules
alias gpu="git rev-parse --abbrev-ref HEAD | xargs git push -u origin" # push new branch to origin
alias aws_login="sh ~/Development/aws-accounts/login.sh"

export DEV_CERT_PEM=/Users/fewsta03/certificate.pem
export DEV_CA_PEM=/etc/pki/tls/certs/bbc-ca.pem

encrypt-file() {
    openssl enc -aes-256-cbc -salt -in $1 -out $1.enc
}

decrypt-file() {
    decryptName=${1//.enc/}
    openssl enc -aes-256-cbc -salt -d -in $1 -out $decryptName
}

#source ~/.morph_profile
