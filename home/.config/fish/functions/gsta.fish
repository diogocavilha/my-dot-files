function gsta --wraps='git stash apply' --description 'Aplica um stash pelo índice'
    if test (count $argv) -eq 0
        echo "Uso: gsta <stash_id>"
        return 1
    end

    set stash_id $argv[1]
    git stash apply "stash@{$stash_id}"
end
