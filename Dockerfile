FROM golang:latest

WORKDIR /relayer
RUN export GO111MODULE="on"
COPY . .

RUN make install

ARG DENOM=pylons
ARG CHAINID=pylonschain
ARG DOMAIN=node.pylons.tech
ARG RLYKEY=
ARG ACCOUNT_PREFIX=pylons

ENV DENOM=$DENOM
ENV CHAINID=$CHAINID
ENV DOMAIN=$DOMAIN
ENV RLYKEY=$RLYKEY
ENV ACCOUNT_PREFIX=$ACCOUNT_PREFIX

RUN rly config init

# NOTE: you will want to save the content from this JSON file
RUN rly chains add-dir testnets/relayer-goz
