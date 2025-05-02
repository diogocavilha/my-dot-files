. ~/.respect-shell/respect.sh

export HISTSIZE=-1
export HISTFILESIZE=-1
export HISTCONTROL=ignoredups:ignorespace:erasedups

# system
alias ccat="pygmentize -f terminal256 -O style=native -g"
alias i="sudo apt-get install -y"
alias bashreload=". ~/.bashrc"
alias aliasedit="vim ~/.bash_aliases"
alias aliasshow="ccat ~/.bash_aliases"
alias json2yaml="python -c 'import sys, yaml, json; yaml.safe_dump(json.load(sys.stdin), sys.stdout, default_flow_style=False)' < "
alias aptfix="sudo rm -rf /var/lib/dpkg/info/a.*; sudo rm -rf /var/lib/dpkg/info/*.*; sudo apt-get clean; sudo apt-get install -f; sudo apt-get update"
alias getip="hostname -I | cut -d ' ' -f 1"
alias bashlog-truncate="truncate -s 0 /var/log/bash.log"
alias bashlog-follow="tail -f /var/log/bash.log"
alias activate="source .venv/bin/activate"
alias refresh-keys='sudo apt-key adv --refresh-keys --keyserver keyserver.ubuntu.com'

# virtualization
alias vm-live-run="qemu-system-x86_64 --enable-kvm -m 4G -smp 4 -name 'Live S.O' -boot d -cdrom " # Param: ISO path
alias vm-windows10-run='qemu-system-x86_64 --enable-kvm -m 4G -smp 4 -boot d -hda ~/.qemu/windows10.qcow2'

# i3wm
alias i3config="vim ~/.config/i3/config"
alias i3statusconfig="vim ~/.config/i3/i3status.conf"

# docker
alias docker-run-mysql="docker run -p 3306:3306 --name local_mysql -v ~/.docker_dbdata/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=admin -d mysql:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci"
alias docker-run-postgresql="docker run -p 5433:5432 --name local_postgres -v ~/.docker_dbdata/postgresql:/var/lib/postgresql/data -e POSTGRES_PASSWORD=localhost -d postgres:10-alpine"
alias docker-run-mongodb="docker run -p 27017:27017 -p 8089:8089 --name local_mongo_no_auth -v ~/.docker_dbdata/mongo:/data/db -d mongo:latest"
#alias docker_run_mongodb="docker run -p 27017:27017 -p 8089:8089 --name local_mongo -v ~/.docker_dbdata/mongo:/data/db -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=admin -d mongo:latest"
alias dcup='docker compose up'
alias dcps='docker compose ps'

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

x() {
    local file_path
    file_path="$1"

    chmod +x "$file_path"
    ls -l "$file_path"
}

colors_show() {
    local color=16;
    while [ $color -lt 245 ]; do
        echo -e "$color: \\033[38;5;${color}mhello\\033[48;5;${color}mworld\\033[0m"
        ((color++));
    done
}

cr32dng() {
    local totalCR3files=$(ls -l *.CR3 | wc -l)
    local totalDNGfiles=0

    for cr3file in $(ls *.CR3); do
        dngfile=$(echo "$cr3file" | cut -f1 -d'.')
        dngfile="$dngfile.dng"

        echo -e "\n\nConverting ${cr3file} into ${dngfile}..."
        dnglab convert "$cr3file" "$dngfile"

        totalDNGfiles=$(ls -l *.dng | wc -l)
        echo "Progress: [${totalDNGfiles}/${totalCR3files}]"

        # Remove CR3 file after converting it to DNG
        echo -n "Removing ${cr3file}..."
        rm "$cr3file"
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

timestamp2ansi() {
    date --date "@${1}" +"%Y-%m-%d %T"
}

ansi2timestamp() {
    date --date="${1}" +"%s"
}

bashlog() {
    echo "$(date +"%Y-%m-%d %T") $1" >> /var/log/bash.log
}

rgrep() {
    where=${2:-.}
    grep -i -r --exclude-dir={target,dbdata,database,test,.git} --exclude=*.{log,sql,xml} $1 $where
}

#
# docker
#
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
    for container_hash in $(docker ps -aq); do
        docker stop "$container_hash"
        docker rm "$container_hash"
    done
}

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

    printf "\n%s\n" "http://localhost:15672/#/"
	printf "User: %s\n" "$user"
	printf "Pass: %s\n\n" "$pass"
}

docker_run_kafka() {
    export HOST_IP=$(ifconfig \
        | grep -E "([0-9]{1,3}\.){3}[0-9]{1,3}" \
        | grep -v 127.0.0.1 \
        | awk '{ print $2 }' \
        | cut -f2 -d: \
        | head -n1)

    docker-compose -f ~/.my-dot-files/bin/dockercompose/docker-compose-kafka.yml up
}

if [ -f ~/.bash_aliases_company ]; then
    . ~/.bash_aliases_company
fi

. ~/.fancy-git/aliases

