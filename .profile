if command -v tmux>/dev/null; then
  [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
fi

export PATH=$PATH:~/.composer/vendor/bin
export PATH=/usr/local/bin:$PATH 

# PROXY
alias onreith=' onreith_npm;  onreith_git; onreith_env;  switch_to_on_network;                                              newline; echo "Now on REITH. Run \"bbc mount\" to mount your network drives."; newline'
alias offreith='offreith_npm; offreith_git; offreith_env; bbc unmount;  switch_to_off_network; make_sure_wifi_is_on; newline; echo "Now off REITH.";                                                newline'

alias onreith_npm='npm config set proxy http://www-cache.reith.bbc.co.uk:80'
alias offreith_npm='npm config rm proxy'
alias onreith_git='git config --global http.proxy http://www-cache.reith.bbc.co.uk:80'
alias offreith_git='git config --global --unset http.proxy'
alias onreith_env='export http_proxy="http://www-cache.reith.bbc.co.uk:80"; export https_proxy="http://www-cache.reith.bbc.co.uk:80";export HTTP_PROXY="http://www-cache.reith.bbc.co.uk:80"; export HTTPS_PROXY="http://www-cache.reith.bbc.co.uk:80"'
alias offreith_env='unset http_proxy; unset https_proxy; unset HTTP_PROXY; unset HTTPS_PROXY'

# switch networks. (the > /dev/null suppresses output, without this the command always says "found it!" very helpfully!
# note - I followed the following instructions (substituting username for ashtoc03) to make this stop asking for sudo: http://superuser.com/a/454612
alias switch_to_on_network='sudo NewNetConfig -switchtolocation "BBC On Network" > /dev/null'
alias switch_to_off_network='sudo NewNetConfig -switchtolocation "BBC Off Network" > /dev/null'

alias make_sure_wifi_is_on='NewNetConfig -setairportpower en1 on' # note- you may need to change this to en0

alias newline='echo ""'

alias bbc='~/Sites/bbc/news/special/utils/main.sh'

alias iframetest_setup='cd ~/.grunt-init/iframe-scaffold/root/newsspec_'
alias iframetest_node='iframetest_setup && node_modules/.bin/vows tests/node/tests/*.js --verbose'
alias iframetest_cucumber='iframetest_setup && node_modules/casperjs/bin/casperjs test --fail-fast tests/cucumber.js'
alias iframetest='iframetest_node && iframetest_cucumber'

export GRASS_PYTHON=/usr/bin/python2.6

alias unsafe-chrome='open -a Google\ Chrome --args --disable-web-security'

export NVM_DIR="/Users/fewsta03/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm
