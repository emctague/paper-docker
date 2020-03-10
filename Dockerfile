FROM openjdk:13
ARG mc_version=1.15.2
ARG paper_build=latest

WORKDIR /server
ADD https://papermc.io/api/v1/paper/${mc_version}/${paper_build}/download /server/paper.jar
RUN mkdir -p /server/data/{worlds,cache}
RUN ln -s /server/data/cache /server/cache

# RUN echo "eula=true" > /server/eula.txt
CMD ["java", "-server", "-XX:ParallelGCThreads=15", "-Xms1G", "-Xmx8G", "-jar", "paper.jar", "--nogui", "--noconsole", "--world-dir", "/server/data/worlds/"]
