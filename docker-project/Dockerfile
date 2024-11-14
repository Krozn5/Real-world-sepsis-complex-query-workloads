# Use Debian Buster as the base image
FROM debian:buster

# Update and install essential packages
RUN apt-get update && apt-get install -y apt-transport-https ca-certificates \
    wget \
    git \
    gcc \
    build-essential \
    libreadline-dev \
    zlib1g-dev \
    bison \
    flex

# Copy the PostgreSQL source tarball into the container
COPY postgresql-13.1.tar.gz /root/postgres-13.1.tar.gz

# Install PostgreSQL from source
RUN cd /root/ \
    && tar xvf postgres-13.1.tar.gz  \
    && rm postgres-13.1.tar.gz \
    && cd postgresql-13.1 \
    && ./configure --prefix=/usr/local/pgsql/13.1 --enable-depend --enable-cassert --enable-debug CFLAGS="-ggdb -O0" \
    && make \
    && make install \
    && echo 'export PATH=/usr/local/pgsql/13.1/bin:$PATH' > /root/.bashrc \
    && echo 'export LD_LIBRARY_PATH=/usr/local/pgsql/13.1/lib/:$LD_LIBRARY_PATH' > /root/.bashrc

# Clone pg_hint_plan extension and install
RUN git clone https://github.com/Nathaniel-Han/pg_hint_plan /root/pg_hint_plan \
    && cd /root/pg_hint_plan \
    && make PG_CONFIG=/usr/local/pgsql/13.1/bin/pg_config  \
    && make PG_CONFIG=/usr/local/pgsql/13.1/bin/pg_config install

# Set environment variables for PostgreSQL
ENV PATH=/usr/local/pgsql/13.1/bin:$PATH
ENV LD_LIBRARY_PATH=/usr/local/pgsql/13.1/lib/:$LD_LIBRARY_PATH

# Set up user and group for PostgreSQL
RUN set -eux \
    && groupadd -r pg --gid=999 \
    && useradd -r -g pg --uid=999 --home-dir=/var/lib/pgsql/13.1/data --shell=/bin/bash pg \
    && mkdir -p /var/lib/pgsql/13.1/data \
    && chown -R pg:pg /var/lib/pgsql/13.1/data \
    && chmod 700 /var/lib/pgsql/13.1/data

# Copy init script to set up PostgreSQL database
COPY init_pgsql.sh /var/lib/pgsql/13.1/init_pgsql.sh
RUN chmod a+x /var/lib/pgsql/13.1/init_pgsql.sh

# Switch to the pg user to run initialization script
USER pg
RUN /var/lib/pgsql/13.1/init_pgsql.sh

# Expose PostgreSQL default port
EXPOSE 5432

# Start PostgreSQL service
CMD ["postgres", "-D", "/var/lib/pgsql/13.1/data"]
