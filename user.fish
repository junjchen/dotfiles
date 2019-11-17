alias wm="~/repos/wolfman/bin/wolfman"
alias be="bundle exec"

alias maketags="ag -l | ctags --links=no -L-"

alias v="f -e vim"

alias setjavahome="source ~/.asdf/plugins/java/set-java-home.fish"

set -xg ECLIPSE_HOME "/Applications/Eclipse\ Java.app"

alias eclimd="sh $ECLIPSE_HOME/Contents/Eclipse/eclimd"

set -g theme_color_scheme gruvbox

source /usr/local/opt/asdf/asdf.fish
