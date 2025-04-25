function gplob --wraps='git pull origin (current branch)' --description 'Faz git pull da branch atual'
    set branch_name (git branch --show-current)

    if test -z "$branch_name"
        echo "Não foi possível detectar a branch atual."
        return 1
    end

    git pull origin $branch_name
end
