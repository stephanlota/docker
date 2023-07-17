FROM gliderlabs/alpine:3.3

RUN apk add --update-cache \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

--WORKDIR /app

--ONBUILD COPY . /app
--ONBUILD RUN virtualenv /env && /env/bin/pip install -r /app/requirements.txt
