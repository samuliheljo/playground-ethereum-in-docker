FROM ubuntu

RUN apt-get update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:ethereum/ethereum
RUN add-apt-repository -y ppa:ethereum/ethereum-dev
RUN apt-get update
RUN apt-get install -y ethereum

ENV DIR /opt/ethereum
RUN mkdir ${DIR}
WORKDIR ${DIR}

ADD genesis.json genesis.json

ADD scripts scripts

RUN geth --datadir ${DIR} init genesis.json

CMD geth --datadir ${DIR} --networkid 1515