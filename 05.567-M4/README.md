# How to run the sql files
First of all, you need to install [Docker Desktop](https://www.docker.com/products/docker-desktop/) and [Visual Studio Code](https://code.visualstudio.com/) for running the sql files.

The command below starts the container. It will create and populate the database when it is started for the first time.
```
docker compose up
```

Then, you can run the sql files on VS Code using [SQLTools](https://marketplace.visualstudio.com/items/?itemName=mtxr.sqltools) and [SQLTools PostgreSQL/Cockroach Driver](https://marketplace.visualstudio.com/items/?itemName=mtxr.sqltools-driver-pg):

Open the sql file, next open the command palette (⌘⇧P) and finally select `SQLTools Connection: Run This File`.