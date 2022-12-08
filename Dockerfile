FROM martinussuherman/alpine:3.13-amd64

ENV \
   # container/su-exec UID \
   EUID=1001 \
   # container/su-exec GID \
   EGID=1001 \
   # container/su-exec user name \
   EUSER=nginx \
   # container/su-exec group name \
   EGROUP=nginx \
   # container user home dir \
   EHOME= \
   # should user home dir get chown'ed? (yes/no) \
   ECHOWNHOME=no \
   # additional directories to create + chown (space separated) \
   ECHOWNDIRS="/var/cache/nginx /var/log/nginx /var/tmp/nginx" \
   # additional files to create + chown (space separated) \
   ECHOWNFILES="/var/log/nginx/access.log /var/log/nginx/error.log /var/run/nginx.pid" \
   # container timezone \
   TZ=UTC

RUN apk --no-cache --update add \
   nginx

RUN \
   ln -sf /dev/stdout /var/log/nginx/access.log \
   && ln -sf /dev/stderr /var/log/nginx/error.log

ENTRYPOINT ["entrypoint-exec", "nginx"]
