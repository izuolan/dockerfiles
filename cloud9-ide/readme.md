## Cloud9 instance

Docker hub: https://registry.hub.docker.com/u/zuolan/cloud9-ide/

## Usage

`docker run -d -v $(pwd):/workspace -p 8181:8181 zuolan/cloud9-ide`

## Start with auth

`docker run -d -v $(pwd):/workspace -p 8181:8181 zuolan/cloud9-ide --auth username:password`

You can also use any starting option describe in : https://github.com/c9/core
