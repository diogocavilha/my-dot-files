function docker-run-mongodb --wraps='docker run -p 27017:27017 -p 8089:8089 --name local_mongo_no_auth -v ~/.docker_dbdata/mongo:/data/db -d mongo:latest' --description 'alias docker-run-mongodb=docker run -p 27017:27017 -p 8089:8089 --name local_mongo_no_auth -v ~/.docker_dbdata/mongo:/data/db -d mongo:latest'
  docker run -p 27017:27017 -p 8089:8089 --name local_mongo_no_auth -v ~/.docker_dbdata/mongo:/data/db -d mongo:latest $argv
        
end
