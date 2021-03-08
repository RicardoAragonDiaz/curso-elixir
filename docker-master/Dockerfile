# docker build -t hola-war-mysql .
# docker run -dp 8000:8080 hola-war-mysql
# docker-compose up -d
# docker exec -it XXXX /bin/sh 
########
FROM maven:3.6.3-jdk-8-slim AS compilador
WORKDIR /appHola
COPY pom.xml .
RUN mvn -e -B dependency:resolve
COPY src ./src
RUN mvn -e -B package
######
FROM tomcat:10.0.2-jdk15-openjdk-oraclelinux7
COPY --from=compilador /appHola/target/holamundo-1.0-SNAPSHOT.war /usr/local/tomcat/webapps/hola.war
#COPY holamundo2.war /usr/local/tomcat/webapps
EXPOSE 8080
CMD ["catalina.sh", "run"]