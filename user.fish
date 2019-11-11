alias g="git"
alias l="ll"
alias v="vim"

set -g theme_color_scheme gruvbox

if brew ls --versions asdf > /dev/null
  source (brew --prefix asdf)/asdf.fish
end
