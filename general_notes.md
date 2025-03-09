### general notes



#### docker compose exec
```docker compose exec [SERVICE] [COMMAND]```
```docker compose exec``` allows you to run a command inside a running container that was started using docker compose

ex. ```docker-compose exec backend python scripts/init_db.py```
```backend``` is a service in the docker compose file, ```python scripts/init_db.py``` is the command that's run inside the container

ex. ```docker-compose exec db psql -U nba -c "SELECT * FROM players LIMIT 5;"```
```db``` is a service in the docker compose file, ```psql -U nba -c "SELECT * FROM players LIMIT 5;"``` is the command

the container doesn't have to be detached for the exec command to work, the container just has to be running (such as when ```docker compose down``` is used)

difference between run and exec:
- exec runs a command inside an existing running container
- run creates a new container instance to run the command

