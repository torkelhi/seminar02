FROM ubuntu:24.04

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && apt-get install -y \
    sudo \
    nano \
    wget \
    curl \
    git \
    build-essential \
    gcc \
    openjdk-21-jdk \
    mono-complete \
    python3 \
    strace \
    valgrind

RUN curl --proto '=https' --tlsv1.3 https://sh.rustup.rs -sSf \
    | sh -s -- -y
ENV PATH="${PATH}:${HOME}/.cargo/bin"

RUN useradd -G sudo -m -d /home/BRUKER -s /bin/bash -p "$(openssl passwd -1 qwerty123)" torkelhi

USER torkelhi
WORKDIR /home/torkelhi

RUN mkdir hacking \
    && cd hacking \
    && curl -SL https://raw.githubusercontent.com/uia-worker/is105misc/master/sem01v24/pawned.sh > pawned.sh \
    && chmod 764 pawned.sh \
    && cd ..

RUN git config --global user.email "torkelhi@uia.no" \
    && git config --global user.name "Torkel Herskedal Ivarsøy" \
    && git config --global url."https://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:@github.com/".insteadOf "https://github.com" \
    && mkdir -p github.com/torkelhi

USER root
RUN curl -SL https://go.dev/dl/go1.21.7.linux-amd64.tar.gz \
    | tar xvz -C /usr/local

USER torkelhi
SHELL ["/bin/bash", "-c"]
RUN mkdir -p $HOME/go/{src,bin}
ENV GOPATH="/home/torkelhi/go"
ENV PATH="${PATH}:${GOPATH}/bin:/usr/local/go/bin"