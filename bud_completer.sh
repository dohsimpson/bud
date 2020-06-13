_bud() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local BUDFILE="${BUDFILE:-Budfile}"
  COMPREPLY=($(bash -c "source $BUDFILE >/dev/null 2>&1 && compgen -A function $cur"))
}

_budz() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  local BUDFILE="${BUDFILE:-Budzfile}"
  COMPREPLY=($(zsh -c "source $BUDFILE >/dev/null 2>&1 && echo ${(k)functions[@]}"))
}
complete -F _bud bud
complete -F _budz budz
