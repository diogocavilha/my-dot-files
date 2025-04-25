function gckbt --wraps='git checkout --track origin/...' --description 'Faz checkout em uma branch remota pelo nome'
    if test (count $argv) -eq 0
        echo "Uso: gckbt <nome-da-branch>"
        return 1
    end

    set branch_name $argv[1]
    git checkout --track origin/$branch_name
end
