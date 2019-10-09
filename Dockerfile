FROM java:8-jre-alpine
ADD https://github.com/lightbody/browsermob-proxy/releases/download/browsermob-proxy-2.1.4/browsermob-proxy-2.1.4-bin.zip /api/
WORKDIR /api
RUN unzip browsermob-proxy-2.1.4-bin.zip && rm browsermob-proxy-2.1.4-bin.zip
EXPOSE 8080-8200
CMD /api/browsermob-proxy-2.1.4/bin/browsermob-proxy --port 3344 --proxyPortRange='9000-9010' --ttl=600
