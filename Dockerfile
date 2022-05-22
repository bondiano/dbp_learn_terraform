FROM hashicorp/terraform:1.1.3

RUN apk update && apk upgrade
RUN apk add bash groff openssh git vim jq make curl

RUN apk -v --update add \
  python3 \
  py3-pip \
  groff \
  less \
  mailcap \
  && \
  pip3 install --upgrade awscli s3cmd python-magic && \
  apk -v --purge del && \
  rm /var/cache/apk/*

RUN mkdir -p /infra
WORKDIR /infra

RUN echo 'alias t=terraform' > ~/.bashrc && \
  terraform -install-autocomplete

ENTRYPOINT "bash"
