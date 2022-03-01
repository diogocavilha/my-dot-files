. ~/git/respect-shell/respect.sh

export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=ignoredups:ignorespace:erasedups

alias ccat="pygmentize -f terminal256 -O style=native -g"
alias i="sudo apt-get install -y"
alias bashreload=". ~/.bashrc"
alias aliasedit="vim ~/.bash_aliases"
alias aliasshow="ccat ~/.bash_aliases"
alias json2yaml="python -c 'import sys, yaml, json; yaml.safe_dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)' < "
alias x="chmod +x"
alias aptfix="sudo rm -rf /var/lib/dpkg/info/a.*; sudo rm -rf /var/lib/dpkg/info/*.*; sudo apt-get clean; sudo apt-get install -f; sudo apt-get update"
alias ggource="gource \
    --seconds-per-day 5 \
    --auto-skip-seconds 0.1 \
    --file-idle-time 500 \
    --max-files 500 \
    --multi-sampling -1280x720 \
    --stop-at-end \
    --hide filenames,dirnames \
    --disable-progress \
    --user-friction .2 \
    --disable-bloom \
    --key \
    --highlight-users"

colors_show() {
    local color=16;
    while [ $color -lt 245 ]; do
        echo -e "$color: \\033[38;5;${color}mhello\\033[48;5;${color}mworld\\033[0m"
        ((color++));
    done
}

history_save() {
    local histcommand
    histcommand=$(history | grep -P "^\s+$1\s+.*")
    echo "$histcommand" >> ~/.history_save
}

# apt-cache search and apt-get install
s() {
    local package=$1

    if [ "$package" = "" ]; then
        echo ""
        respect.message.info "Package name is required!\n"
        return
    fi

    sudo apt-cache search $package | grep $package
    echo ""

    if respect.question.yesno "Install $package?" "y"
    then
        respect.title "Installing: $package ..."
        sudo apt-get install $package -y
    fi
}

getip() {
    hostname -I | awk '{print $1}'
}

timestamp2ansi() {
    date --date "@${1}" +"%Y-%m-%d %T"
}

ansi2timestamp() {
    date --date="${1}" +"%s"
}

bashlog() {
    echo "$(date +"%Y-%m-%d %T") $1" >> /var/log/bash.log
}

bashlog_truncate() {
    truncate -s 0 /var/log/bash.log
}

bashlog_follow() {
    tail -f /var/log/bash.log
}

rgrep() {
    where=${2:-.}
    grep -i -r --exclude-dir={target,dbdata,database,test,.git} --exclude=*.{log,sql,xml} $1 $where
}

docker_remove_images_with_none() {
    docker rmi -f "$(docker images --filter "dangling=true" -q --no-trunc)"
}

docker_in() {
    (
        set -x
        docker exec -it $1 bash
    )
}

docker_execute() {
    (
        array=( $@ )
        len=${#array[@]}
        args=${array[@]:1:$len}

        set -x
        docker exec -it $1 sh -c "$args"

    )
}

docker_stopall() {
    docker stop "$(docker ps -aq)" && docker rm "$(docker ps -aq)"
}

alias docker_run_mysql='docker run -p 3307:3306 --name local_mysql -e MYSQL_ROOT_PASSWORD=admin -d mysql:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci'
alias docker_run_mongo='docker run -p 27017:27017 -p 8089:8089 --name local_mongo -e MONGO_INITDB_ROOT_USERNAME="root" -e MONGO_INITDB_ROOT_PASSWORD="admin" -d mongo:latest'
alias docker_run_postgresql='docker run -p 5432:5432 --name local_postgres -e POSTGRES_PASSWORD=admin -d postgres:10-alpine'

docker_run_rabbitmq() {
	local user
	local pass

	user="guest"
	pass="guest"

	docker run \
        --name local_rabbitmq \
        -p 5672:5672 \
        -p 15672:15672 \
        -e RABBITMQ_DEFAULT_USER="$user" \
        -e RABBITMQ_DEFAULT_PASS="$pass" \
        -d rabbitmq:3.8-management-alpine

	echo ""
	echo "http://localhost:15672/#/"
	echo "User: $user"
	echo "Pass: $pass"
	echo ""
}

if [ -f ~/.bash_aliases_company ]; then
    . ~/.bash_aliases_company
fi