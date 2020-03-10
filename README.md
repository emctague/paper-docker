# paper-docker

This is a docker image for [PaperMC](https://papermc.io).

## Usage

Use `paper-docker` as a base image, creating an image specific to your server, with any applicable configuration files
in the same folder as your `Dockerfile`:

```docker
FROM mctague/paper:latest

# Server config files (server.properties, spigot.yml, bukkit.yml etc.)
COPY . /server

# If you agree to the Minecraft EULA:
RUN echo "eula=true" > /server/eula.txt
```

When you run the image, you will need to specify a volume mounted to `/server/data`. This volume will contain server
state (Paper cache, logs, worlds), but *not* any configuration - it is up to you to create configuration files to be
copied by your custom image, mount them to volumes, or let them be generated every time by Paper.

You must expose port `25565` from the container.
