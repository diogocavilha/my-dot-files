function glp --wraps='git log' --description 'Log de commits com formatação personalizada'
  git log --date=short --color=always --pretty=format:'%C(bold yellow)%h%C(reset) %C(white)%ad %C(bold blue)(%ar)%C(reset) %C(bold green)%an %C(reset)%C(cyan)%s%C(reset)' $argv | less -R
end
