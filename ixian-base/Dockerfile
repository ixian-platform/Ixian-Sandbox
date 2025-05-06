FROM ubuntu:noble-20250415.1 AS ixian-base

LABEL version="0.3"
LABEL description="Ixian Base Docker Container"

ENV HOME=/opt
ENV NODE_ENV=production

COPY . /opt
WORKDIR /opt
RUN sh /opt/install-base.sh
