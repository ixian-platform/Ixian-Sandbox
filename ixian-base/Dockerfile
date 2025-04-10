FROM ubuntu:24.04 AS ixian-base

LABEL version="0.2"
LABEL description="Ixian Base Docker Container"
LABEL maintainer="support@ixian.io"

ENV HOME=/opt
ENV NODE_ENV=production

COPY . /opt
WORKDIR /opt
RUN sh /opt/install-base.sh
