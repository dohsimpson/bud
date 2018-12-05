_bud() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  source Budfile
  COMPREPLY=( $(compgen -A function -- "$cur") )
}

complete -F _bud bud
