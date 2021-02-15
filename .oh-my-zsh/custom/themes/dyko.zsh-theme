ZSH_THEME_GIT_PROMPT_PREFIX="%{$fg[green]%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$fg[green]%}›%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

dyko_get_prompt() {
  echo -n "%{$fg[cyan]%}%n%{$reset_color%}"
  echo -n "%{$fg[blue]%}@%m%{$reset_color%}"
  echo -n " %{$fg[yellow]%}%~%{$reset_color%}"
  echo -n " $(git_prompt_info)"
  echo -n "\n"
  echo -n "🦕 ~ %{$reset_color%}"
}

PROMPT='$(dyko_get_prompt)'
