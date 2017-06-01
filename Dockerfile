FROM openjdk:8

ENV DEBIAN_FRONTEND noninteractive

ENV JAVA_VERSION 8
ENV VERSION 0.9
ENV JAR jmx_prometheus_httpserver-$VERSION-jar-with-dependencies.jar

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv E56151BF && \
  apt-get update && \
  apt-get -y install -y \  
      apt-utils \
      curl && \
  apt-get clean && \
  rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN mkdir -p /jmx_prometheus_httpserver
WORKDIR /jmx_prometheus_httpserver
RUN curl -O -k -L https://repo1.maven.org/maven2/io/prometheus/jmx/jmx_prometheus_httpserver/$VERSION/$JAR

ADD docker-entrypoint.sh /jmx_prometheus_httpserver/docker-entrypoint.sh

ENTRYPOINT ["/jmx_prometheus_httpserver/docker-entrypoint.sh"]
CMD        [ "/jmx_prometheus/config.yml" ]
