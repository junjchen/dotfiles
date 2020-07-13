fish_vi_key_bindings

set -gx EDITOR nvim

if test -e ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
end

if command --search yarn >/dev/null do
  set -xg PATH $PATH (yarn global bin)
end
