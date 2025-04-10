FROM ixian-base:24.04

LABEL version="0.2"
LABEL description="Ixian Explorer Docker Container"
LABEL maintainer="support@ixian.io"

ENV HOME=/opt
ENV NODE_ENV=production

ARG URL="https://github.com/ixian-platform"
ARG BRANCH="main"
ARG SHA=
ARG DLT_URL="http://ixian-dlt:8081"

COPY . /opt
WORKDIR /opt
RUN sh /opt/install.sh "${URL}" "${BRANCH}" "${SHA}" "${DLT_URL}"

ENTRYPOINT /opt/start.sh