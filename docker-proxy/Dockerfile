FROM ubuntu:16.04
RUN apt-get update && \
    apt-get install -y socat && \
    apt-get clean
COPY docker-proxy /bin/docker-proxy
ENTRYPOINT ["/bin/docker-proxy"]
EXPOSE 2375
ENV PORT=2375
