FROM python:3.8

RUN apt-get update && \
    apt-get install -y zip \
                    unzip \
                    jq \
                    --no-install-recommends && \
    rm -rf /var/lib/apt/lists/*

RUN pip install awsebcli \
                awscli

# バージョンの確認
# https://github.com/moby/moby/tags?after=v17.04.0-ce
ENV DOCKER_VERSION=17.03.0-ce
RUN curl -L -o /tmp/docker-${DOCKER_VERSION}.tgz https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz && \
    tar -xz -C /tmp -f /tmp/docker-${DOCKER_VERSION}.tgz && \
    mv /tmp/docker/* /usr/bin

# バージョンの確認
# https://releases.hashicorp.com/terraform
ENV TERRAFORM_VERSION 0.9.6
RUN curl -L -o /tmp/terraform-${TERRAFORM_VERSION}.zip "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" && \
    unzip /tmp/terraform-${TERRAFORM_VERSION}.zip -d /bin && \
    rm -rf /tmp/terraform*
