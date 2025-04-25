function ccat --wraps='pygmentize -f terminal256 -O style=native -g' --description 'alias ccat=pygmentize -f terminal256 -O style=native -g'
  pygmentize -f terminal256 -O style=native -g $argv
        
end
