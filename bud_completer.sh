_bud() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  COMPREPLY=($(bash -c "source Budfile >/dev/null 2>&1 && compgen -A function $cur"))
}
complete -F _bud bud
