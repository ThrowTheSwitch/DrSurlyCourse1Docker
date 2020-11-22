FROM alpine:3.11

MAINTAINER Michael Karlesky <michael@karlesky.net>

ENV PROJECT_HOME   /lab
ENV DR_SURLY_HOME  /home/drsurly

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
COPY assets/start_lab*        $DR_SURLY_HOME/
COPY assets/awesomesauce.zip  $DR_SURLY_HOME/

RUN chmod +x /usr/local/bin/course


##
## Programming environment setup
##

RUN mkdir $PROJECT_HOME

# Working directory at container launch
WORKDIR $PROJECT_HOME

# When the container launches, run a shell that launches in WORKDIR
CMD ["/bin/sh"]
