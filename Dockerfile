FROM ubuntu:xenial

RUN apt-get update && apt-get install --yes nginx

WORKDIR /srv
ADD _site .
ADD nginx.conf /etc/nginx/sites-enabled/default

# Set git commit ID
ARG commit_id
ENV COMMIT_ID=$commit_id


STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]

