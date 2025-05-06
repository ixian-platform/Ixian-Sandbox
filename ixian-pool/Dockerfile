FROM ixian-base:24.04-0.3

LABEL version="0.3"
LABEL description="Ixian Pool Docker Container"

ENV HOME=/opt
ENV NODE_ENV=production

ARG URL="https://github.com/ixian-platform"
ARG BRANCH="master"
ARG SHA=
ARG POOL_REWARD_ADDRESS="153xXfVi1sznPcRqJur8tutgrZecNVYGSzetp47bQvRfNuDix"
ARG POOL_FEE="0.02"
ARG POOL_URL="https://ixian-pool/"
ARG POOL_NAME="My Ixian Pool"
ARG DLT_URL="http://ixian-dlt:8081"

COPY . /opt
WORKDIR /opt
RUN sh /opt/install.sh "${URL}" "${BRANCH}" "${SHA}" "${POOL_REWARD_ADDRESS}" "${POOL_FEE}" "${POOL_NAME}" "${POOL_URL}" "${DLT_URL}"

ENTRYPOINT ["/opt/start.sh"]
