FROM ixian-base:24.04

LABEL version="0.3"
LABEL description="Ixian DLT Docker Container"
LABEL maintainer="support@ixian.io"

ENV HOME=/opt
ENV NODE_ENV=production

ARG URL="https://github.com/ixian-platform"
ARG CORE_BRANCH="master"
ARG DLT_BRANCH="master"
ARG SHA=

COPY . /opt
WORKDIR /opt
RUN sh /opt/install.sh "${URL}" "${CORE_BRANCH}" "${DLT_BRANCH}" "${SHA}"

ENTRYPOINT /opt/start.sh
