# -----------------------------------------------------------------
# Docker file to copy the generated binary from the `out` directory
# -----------------------------------------------------------------
FROM centos:7
LABEL maintainer Devtools <devtools@redhat.com>
LABEL author Devtools <devtools@redhat.com>
EXPOSE 8080

ARG BUILD_DIR
ARG PROJECT_NAME
COPY ${BUILD_DIR}/${PROJECT_NAME} /usr/local/bin/${PROJECT_NAME}

ENV F8_USER_NAME=fabric8
RUN useradd --no-create-home -s /bin/bash ${F8_USER_NAME}
# From here onwards, any RUN, CMD, or ENTRYPOINT will be run under the following user
USER ${F8_USER_NAME}

ENTRYPOINT [ "${PROJECT_NAME}" ]