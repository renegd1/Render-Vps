FROM ubuntu:22.04

LABEL maintainer="Lapio Plays"

ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV GOTTY_TAG_VER=v1.0.1

RUN apt-get update && \
    apt-get install -y curl && \
    curl -fsSL "https://github.com/yudai/gotty/releases/download/${GOTTY_TAG_VER}/gotty_linux_amd64.tar.gz" | tar xzC /usr/local/bin && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY deup-gaming.sh /deup-gaming.sh

RUN chmod 744 /deup-gaming.sh

EXPOSE 8080

CMD ["/bin/bash", "/deup-gaming.sh"]

