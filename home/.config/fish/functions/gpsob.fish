function gpsob --wraps='git push origin (current branch)' --description 'Faz git push da branch atual'
    set branch_name (git branch --show-current)

    if test -z "$branch_name"
        echo "Não foi possível detectar a branch atual."
        return 1
    end

    git push origin $branch_name
end

