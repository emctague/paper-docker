# paper-docker

This is a docker image for [PaperMC](https://papermc.io).

## Usage

Use `paper-docker` as a base image:

```docker
FROM mctague/paper:latest

# Copy your server config files (server.properties, spigot.yml,
# bukkit.yml etc.) from the working directory.
COPY . /server

# If you agree to the Minecraft EULA:
RUN echo "eula=true" > /server/eula.txt
```

Make sure to specify a volume to mouht to `/server/world`! Don't want to lose your save!
