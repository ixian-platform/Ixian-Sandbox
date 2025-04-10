FROM ixian-base:24.04

LABEL version="0.2"
LABEL description="Ixian DLT Docker Container"
LABEL maintainer="support@ixian.io"

ENV HOME=/opt
ENV NODE_ENV=production

ARG URL="https://github.com/ixian-platform"
ARG BRANCH="master"
ARG SHA=

COPY . /opt
WORKDIR /opt
RUN sh /opt/install.sh "${URL}" "${BRANCH}" "${SHA}"

ENTRYPOINT /opt/start.sh
