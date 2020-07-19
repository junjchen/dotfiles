fish_vi_key_bindings

if test -e ~/.asdf/asdf.fish
  source ~/.asdf/asdf.fish
end

if command --search yarn >/dev/null do
  set -xg PATH $PATH (yarn global bin)
end
