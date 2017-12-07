FROM ubuntu:16.04
RUN apt-get update && \
    apt-get install -y ca-certificates && \
    apt-get install -y curl gunzip && \
    apt-get clean
ADD static /static
ADD controller /bin/controller
EXPOSE 8080
ENTRYPOINT ["/bin/controller"]
