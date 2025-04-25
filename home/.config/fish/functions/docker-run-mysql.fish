function docker-run-mysql --wraps='docker run -p 3306:3306 --name local_mysql -v ~/.docker_dbdata/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=admin -d mysql:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci' --description 'alias docker-run-mysql=docker run -p 3306:3306 --name local_mysql -v ~/.docker_dbdata/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=admin -d mysql:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci'
  docker run -p 3306:3306 --name local_mysql -v ~/.docker_dbdata/mysql:/var/lib/mysql -e MYSQL_ROOT_PASSWORD=admin -d mysql:5.7 --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci $argv
        
end
