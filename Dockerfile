ARG PG_MAJOR=16

FROM postgres:$PG_MAJOR

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y patroni && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER postgres
WORKDIR /
CMD ["patroni", "/etc/patroni.yml"]
