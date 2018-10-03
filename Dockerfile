FROM martinussuherman/alpine-tz-ep

ENV LABEL_MAINTAINER="Martinus Suherman" \
    LABEL_VENDOR="martinussuherman" \
    LABEL_IMAGE_NAME="martinussuherman/alpine-tz-ep-nginx" \
    LABEL_URL="https://hub.docker.com/r/martinussuherman/alpine-tz-ep-nginx/" \
    LABEL_VCS_URL="https://github.com/martinussuherman/alpine-tz-ep-nginx" \
    LABEL_DESCRIPTION="Docker image for nginx, based on Alpine Linux." \
    LABEL_LICENSE="GPL-3.0" \
    # container/su-exec UID \
    EUID=9999 \
    # container/su-exec GID \
    EGID=9999 \
    # container/su-exec user name \
    EUSER=nginx \
    # container/su-exec group name \
    EGROUP=nginx \
    # additional directories to create + chown (space separated) \
    ECHOWNDIRS="/var/cache/nginx /var/log/nginx /var/tmp/nginx" \
    # additional files to create + chown (space separated) \
    ECHOWNFILES="/var/log/nginx/access.log /var/log/nginx/error.log /var/run/nginx.pid"

RUN apk add --no-cache nginx \
    && ln -sf /dev/stdout /var/log/nginx/access.log \
    && ln -sf /dev/stderr /var/log/nginx/error.log

ENTRYPOINT ["/entrypoint_exec.sh", "nginx"]

ARG LABEL_VERSION="latest"
ARG LABEL_BUILD_DATE
ARG LABEL_VCS_REF

# Build-time metadata as defined at http://label-schema.org
LABEL maintainer=$LABEL_MAINTAINER \
      org.label-schema.build-date=$LABEL_BUILD_DATE \
      org.label-schema.description=$LABEL_DESCRIPTION \
      org.label-schema.name=$LABEL_IMAGE_NAME \
      org.label-schema.schema-version="1.0" \
      org.label-schema.url=$LABEL_URL \
      org.label-schema.license=$LABEL_LICENSE \
      org.label-schema.vcs-ref=$LABEL_VCS_REF \
      org.label-schema.vcs-url=$LABEL_VCS_URL \
      org.label-schema.vendor=$LABEL_VENDOR \
      org.label-schema.version=$LABEL_VERSION
