ARG PG_MAJOR=16

FROM postgres:$PG_MAJOR

ARG PGHOME=/home/postgres
ENV PGDATA=$PGHOME/data

RUN set -ex \
    && apt-get update -y \
    && apt-get install -y patroni \
    && apt-get clean && rm -rf /var/lib/apt/lists/* \
    && mkdir -p "$PGDATA" \
    && chown -R postgres:postgres "$PGHOME"

WORKDIR $PGHOME
USER postgres

CMD ["patroni", "/etc/patroni.yml"]
