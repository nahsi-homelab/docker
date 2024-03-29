FROM ubuntu:20.04

ARG RUNNER_VERSION="2.288.1"
ENV RUNNER_DIR="/home/runner/actions-runner"
ENV DEBIAN_FRONTEND=noninteractive TZ=Etc/UTC

RUN apt-get update -y && apt-get upgrade -y \
    && apt-get install -y \
    curl \
    jq \
    build-essential \
    libssl-dev \
    libffi-dev \
    python3 \
    python3-venv \
    python3-dev \
    rsync \
    gnupg

# install Docker
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && echo "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable" > /etc/apt/sources.list.d/docker.list \
    && apt-get update -y && apt-get install -y docker-ce docker-ce-cli containerd.io

# install HashiCorp tools
RUN curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add - \
    && echo "deb [arch=amd64] https://apt.releases.hashicorp.com focal main" > /etc/apt/sources.list.d/hashicorp.list \
    && apt-get update -y && apt-get install -y consul vault nomad terraform packer

RUN rm -rf /var/lib/apt/lists/* && useradd -m runner -G docker

RUN mkdir $RUNNER_DIR

COPY *.sh /

RUN /install.sh \
    && chown -R runner ~runner \
    && $RUNNER_DIR/bin/installdependencies.sh

USER runner

ENTRYPOINT ["/start.sh"]
