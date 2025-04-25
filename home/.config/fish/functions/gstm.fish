function gstm --wraps='git stash save' --description 'alias gstm=git stash save'
  git stash save $argv
        
end
