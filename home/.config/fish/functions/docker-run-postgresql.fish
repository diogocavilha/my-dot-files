function docker-run-postgresql --wraps='docker run -p 5433:5432 --name local_postgres -v ~/.docker_dbdata/postgresql:/var/lib/postgresql/data -e POSTGRES_PASSWORD=localhost -d postgres:10-alpine' --description 'alias docker-run-postgresql=docker run -p 5433:5432 --name local_postgres -v ~/.docker_dbdata/postgresql:/var/lib/postgresql/data -e POSTGRES_PASSWORD=localhost -d postgres:10-alpine'
  docker run -p 5433:5432 --name local_postgres -v ~/.docker_dbdata/postgresql:/var/lib/postgresql/data -e POSTGRES_PASSWORD=localhost -d postgres:10-alpine $argv
        
end
