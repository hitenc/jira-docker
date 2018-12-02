FROM alpine

LABEL maintainer="hiten.r.chauhan@gmail.com"
RUN apk add gzip
RUN apk add openjdk8

RUN JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk/jre
RUN JRE_HOME=/usr/lib/jvm/java-1.8-openjdk/jre

COPY atlassian-jira-software-7.13.0.tar.gz atlassian-jira-software-7.13.0.tar.gz
RUN tar -xzf atlassian-jira-software-7.13.0.tar.gz
RUN mv atlassian-jira-software-7.13.0-standalone jirasoftware
RUN rm -f atlassian-jira-software-7.13.0.tar.gz
RUN mkdir jirasoftware-home
RUN echo "jira.home=/jirasoftware-home" > /jirasoftware/atlassian-jira/WEB-INF/classes/jira-application.properties
EXPOSE 8080
