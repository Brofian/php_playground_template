# Requirements

- Docker Desktop (https://www.docker.com/products/docker-desktop/)
- Mutagen IO (https://github.com/mutagen-io/mutagen/releases)

# Setup

### Step 1
Copy all *.sample files and remove the .sample ending. Then adjust the content for your needs.
Every file with a .example ending can be created similarly or ignored. They are not required!

### Step 2
execute `docker-composer up -d` to initially start your project and build your containers

### Step 3
execute `mutagen project start` to create a new mutagen project and sync

### Step 4
Open 127.0.0.1 in your browser (if you haven't changed the .env file)

# How to use

Once you are set up, you can start the project by executing `docker-compose up -d` (also include the `--force-recreate` option, if you have made changes to the docker-compose.yml).
Then start mutagen by using `mutagen project start` to create the project or `mutagen project resume`, if mutagen is only paused.

---

You can check the state of your setup by executing `docker-compose ps` (every container should have the status "up") and `mutagen sync list` (you should see this project in the list)

---

To execute commands inside the docker containers, execute `docker-compose exec fpm bash`. You should now be inside the fpm container and logged in as the user `www-data`.
To return, you can perform the command `exit` two times. (First time exiting the www-data user and second time exiting the bash)

---

Outside the container, you can use your default environment. 
Inside the container, you can use PHP, Composer, GIT, ZIP, UNZIP and vim. If you need more, you can add them to the PHP.Dockerfile and recreate your containers

---

To stop the Project execute `docker-compose stop` and pause mutagen with `mutagen project pause`. Or you could destroy the mutagen project with `mutagen project terminate`.


# Hints

If you create applications, only public files should be inside the public folder! Everything else should remain in the www folder, outside the public folder, so it is not accessible from the outside.
If you want to use composer, you can simply create your composer.json file in the www folder and work with composer inside of the container
