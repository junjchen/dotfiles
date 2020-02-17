fish_vi_key_bindings

alias wm="~/repos/wolfman/bin/wolfman"
alias be="bundle exec"
alias vv="f -e vim"
alias vg="vagrant"

set -g theme_color_scheme gruvbox

if test -e ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
end

if command --search yarn >/dev/null do
  set -xg PATH $PATH (yarn global bin)
end

if command --search pritunlctl >/dev/null do
  alias vpn="pritunlctl start"
end
