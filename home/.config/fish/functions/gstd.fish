function gsta --wraps='git stash drop' --description 'Remove um stash pelo índice'
    if test (count $argv) -eq 0
        echo "Uso: gstd <stash_id>"
        return 1
    end

    set stash_id $argv[1]
    git stash drop "stash@{$stash_id}"
end
