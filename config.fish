fish_vi_key_bindings

source /usr/local/opt/asdf/asdf.fish

alias wm="~/repos/wolfman/bin/wolfman"
alias be="bundle exec"
alias vv="f -e vim"

set -g theme_color_scheme gruvbox

if command --search yarn >/dev/null do
    set -xg PATH $PATH (yarn global bin)
end

if command --search pritunlctl >/dev/null do
  alias vpn="pritunlctl start"
end
