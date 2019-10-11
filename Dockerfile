FROM java:8-jre-alpine
ADD https://github.com/lightbody/browsermob-proxy/releases/download/browsermob-proxy-2.1.4/browsermob-proxy-2.1.4-bin.zip /api/
ENV JAVA_OPTS="-Xmx2g -XX:+AlwaysPreTouch -XX:CMSInitiatingOccupancyFraction=10 -XX:ParallelGCThreads=4 -XX:ConcGCThreads=4 -XX:+UseConcMarkSweepGC"
WORKDIR /api
RUN export JAVA_OPTS && \
    unzip browsermob-proxy-2.1.4-bin.zip  && rm browsermob-proxy-2.1.4-bin.zip
EXPOSE 8999-9010
CMD browsermob-proxy-2.1.4/bin/browsermob-proxy --port 8999 --proxyPortRange='9000-9010' --ttl=60
