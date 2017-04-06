FROM python:2.7.13

RUN apt-get update && \
    apt-get install -y zip \
                    unzip \
                    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN pip install awsebcli \
                awscli

ENV DOCKER_VERSION=17.03.0-ce
RUN curl -L -o /tmp/docker-${DOCKER_VERSION}.tgz https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz && \
    tar -xz -C /tmp -f /tmp/docker-${DOCKER_VERSION}.tgz && \
    mv /tmp/docker/* /usr/bin

