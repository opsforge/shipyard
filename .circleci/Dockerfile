FROM ubuntu:16.04
RUN apt-get update && \
    apt-get install -y curl && \
    apt-get clean
ENTRYPOINT ["/usr/bin/curl"]
