FROM openjdk:8u171-alpine3.7

CMD mkdir /var/www/app
WORKDIR /var/www/app

COPY entrypoint.sh entrypoint.sh
COPY target/config-server*.jar app.jar

CMD /var/www/app/entrypoint.sh app.jar
