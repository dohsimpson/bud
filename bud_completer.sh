_bud() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=($(bash -c "source Budfile >/dev/null 2>&1 && compgen -A function $cur"))
}

_budz() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=($(zsh -c 'source Budzfile >/dev/null 2>&1 && echo ${(k)functions[@]}'))
}
complete -F _bud bud
complete -F _budz budz
