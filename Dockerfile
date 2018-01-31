FROM ubuntu

RUN apt-get update
RUN apt-get install -y software-properties-common vim
RUN add-apt-repository -y ppa:ethereum/ethereum
RUN add-apt-repository -y ppa:ethereum/ethereum-dev
RUN apt-get update
RUN apt-get install -y ethereum

ENV DIR /opt/ethereum
RUN mkdir ${DIR}
WORKDIR ${DIR}

ADD scripts scripts

# Create some account, and update genesis.json to allocate funds to it
ADD genesis-template.json genesis-template.json
RUN echo "test" > password.txt
RUN geth account new --keystore /opt/ethereum/keystore/ --password password.txt | sed 's/^[^{]*{\([^{}]*\)}.*/\1/' > account.txt
RUN sed "s/ACCOUNT/`cat account.txt`/g" "genesis-template.json" > genesis.json

# Initialize blockchain
RUN geth --datadir ${DIR} init genesis.json

EXPOSE 8545 

# Start
CMD geth --mine --rpc --rpcaddr=0.0.0.0 --rpcapi="db,eth,net,web3,personal" --rpccorsdomain "*" --datadir ${DIR} --networkid 1515