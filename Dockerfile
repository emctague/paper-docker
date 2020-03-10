FROM openjdk:13
ARG mc_version=1.15.2
ARG paper_build=latest

WORKDIR /server
ADD https://papermc.io/api/v1/paper/${mc_version}/${paper_build}/download /server/paper.jar

# RUN echo "eula=true" > /server/eula.txt
CMD ["java", "-server", "-XX:ParallelGCThreads=15", "-Xms1G", "-Xmx8G", "-jar", "paper.jar.jar", "--noconsole"]
