FROM openjdk:13
ARG mc_version=1.15.2
ARG paper_build=latest

WORKDIR /server

# This ADD step exists in order to ensure the paper download is cached *unless* the paper build has changed (important
# when paper_build=latest.)
ADD https://papermc.io/api/v1/paper/${mc_version}/${paper_build} /server/paper-info.json

RUN curl -o /server/paper.jar https://papermc.io/api/v1/paper/${mc_version}/${paper_build}/download
RUN mkdir -p /server/data/{worlds}

# RUN echo "eula=true" > /server/eula.txt
CMD ["java", "-server", "-XX:ParallelGCThreads=15", "-Xms1G", "-Xmx8G", "-jar", "paper.jar", "--nogui", "--noconsole", "--world-dir", "/server/data/worlds/"]
