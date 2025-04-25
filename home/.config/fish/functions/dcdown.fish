function dcdown --wraps='docker compose down' --description 'alias dcdown=docker compose down'
  docker compose down $argv
        
end
