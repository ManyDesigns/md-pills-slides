# -- Start with a base image -- 

#FROM ubuntu:latest

# -- Image for a builded war --

FROM tomcat:9-jdk11-openjdk

ENV TZ='Europe/Rome'

RUN mkdir -p $CATALINA_HOME/webapps/ROOT/WEB-INF/
WORKDIR $CATALINA_HOME/webapps/ROOT

ADD 'https://jdbc.postgresql.org/download/postgresql-42.2.12.jar' $CATALINA_HOME/lib/

COPY ./backend/demo-1.0.war $CATALINA_HOME/webapps/ROOT.war

RUN jar xf ../ROOT.war; rm -f ../ROOT.war
