#FROM openjdk:17-jdk-alpine
#EXPOSE 8089
#ADD target/tp-foyer-5.0.0.jar tp-foyer-5.0.0.jar
#ENTRYPOINT ["java", "-jar","/tp-foyer-5.0.0.jar"]
#
##
#FROM openjdk:17-alpine
#
#RUN apk update && apk add --no-cache wget
#
#EXPOSE 8089
#WORKDIR /app
#
#RUN wget -O tp-foyer-5.0.0.jar "http://192.168.50.4:8081/repository/maven-releases/tn/esprit/tp-foyer/5.0.0/tp-foyer-5.0.0.jar" \
#    && if [ -f "tp-foyer-5.0.0.jar" ]; then echo "Le fichier JAR a été téléchargé avec succès."; else echo "Erreur: Le fichier JAR n'a pas été téléchargé."; exit 1; fi
#
#RUN echo "L'image Docker a été créée avec succès."
#
#ENTRYPOINT ["java", "-jar","/tp-foyer-5.0.0.jar"]
#
#
##



#FROM openjdk:17-jdk-alpine
#ENV NEXUS_USERNAME=admin
#ENV NEXUS_PASSWORD=nexus
#WORKDIR /app
#EXPOSE 8089
#RUN apk add --no-cache curl \
#    && curl -u ${NEXUS_USERNAME}:${NEXUS_PASSWORD} -O http://192.168.50.4:8081/repository/maven-releases/tn/esprit/tp-foyer/5.0.0/tp-foyer-5.0.0.jar
#
#ENTRYPOINT ["java", "-jar", "tp-foyer-5.0.0.jar"]




#*******************neuxs url

# Use a lightweight OpenJDK base image
FROM openjdk:17-jdk-alpine

# Set environment variables for Nexus credentials as build arguments
ARG NEXUS_USERNAME
ARG NEXUS_PASSWORD

# Set the working directory

EXPOSE 8089

# Copier tous les fichiers du projet dans le conteneur
COPY . /app

# Spécifiez le répertoire de travail
WORKDIR /app
# Install curl to enable downloading from Nexus
RUN apk add --no-cache curl

# Download the JAR file from Nexus using the provided credentials
RUN curl -u ${NEXUS_USERNAME}:${NEXUS_PASSWORD} -O http://192.168.50.4:8081/repository/maven-central-repository/tn/esprit/tp-foyer/5.0.0/tp-foyer-5.0.0.jar

# Set the entrypoint to run the application
ENTRYPOINT ["java", "-jar", "/app/tp-foyer-5.0.0.jar"]

#
#













#************************************final marche
#  Utilisez l'image de base OpenJDK 17 Alpine
#FROM openjdk:17-jdk-alpine
#
## Exposer le port de l'application
#EXPOSE 8089
#
## Copier tous les fichiers du projet dans le conteneur
#COPY . /app
#
## Spécifiez le répertoire de travail
#WORKDIR /app
#
## Ajoutez le JAR de votre application
#ADD target/tp-foyer-5.0.0.jar tp-foyer-5.0.0.jar
#
#ENTRYPOINT ["java", "-jar", "tp-foyer-5.0.0.jar"]
