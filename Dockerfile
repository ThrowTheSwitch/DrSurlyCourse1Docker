FROM alpine:3.11

MAINTAINER Michael Karlesky <michael@karlesky.net>


RUN set -ex \
  && apk update \
  && apk --no-cache add \
    coreutils \
    bash \
    unzip \
    gcc \
    libc-dev \
    make


##
## Copy assets for inclusion in image
##

COPY assets/course            /usr/local/bin
COPY assets/awesomesauce.zip  /home/drsurly/awesomesauce.zip

RUN chmod +x /usr/local/bin/course


##
## Programming environment setup
##

RUN mkdir /lab

# Working directory at container launch
WORKDIR /lab

# When the container launches, run a shell that launches in WORKDIR
CMD ["/bin/sh"]
