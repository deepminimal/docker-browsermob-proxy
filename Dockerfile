FROM java:8-jre-alpine
WORKDIR /api
ADD https://github.com/lightbody/browsermob-proxy/releases/download/browsermob-proxy-2.1.4/browsermob-proxy-2.1.4-bin.zip
ENV JAVA_OPTS="-Xmx1g -XX:+AlwaysPreTouch -XX:CMSInitiatingOccupancyFraction=10 -XX:ParallelGCThreads=4 -XX:ConcGCThreads=4 -XX:+UseConcMarkSweepGC"
RUN export JAVA_OPTS && \
    unzip browsermob-proxy-2.1.4-bin.zip  && rm browsermob-proxy-2.1.4-bin.zip
EXPOSE 8999-9010
CMD browsermob-proxy-2.1.4/bin/browsermob-proxy --port 8999 --proxyPortRange='9000-9010' --ttl=600
