# playground-ethereum-in-docker

Private ethereum blockchain running in Docker

## What is a playground?

See https://github.com/samuliheljo/playgrounds/

## Running

1. Build geth Docker node and initialize genesis blockchain

`docker build -t playground-ethereum .`

2. Start node

`docker run --name etherium-node -p 8545:8545 playground-ethereum`

You should see something like:

```
INFO [01-16|10:37:46] HTTP endpoint opened: http://0.0.0.0:8545
```

Test that connection works from your host system:

Run: `curl -X POST -H "Content-Type: application/json" --data '{"jsonrpc":"2.0","method":"web3_clientVersion","params":[],"id":67}' localhost:8545`

You should see response:

```
{"jsonrpc":"2.0","id":67,"result":"Geth/v1.7.3-stable-4bb3c89d/linux-amd64/go1.9"}
```

## Exec into container

Run: `docker exec -it bash etherium-node`

# Usefull `geth` commands inside container

| Command                                                  | Description    |
| -------------------------------------------------------- | -------------- |
| geth attach ipc:///opt/ethereum/geth.ipc                 | Attach to node |
| geth account new --keystore /opt/ethereum/keystore/      | Create account |
| geth account list --keystore /opt/ethereum/keystore/     | List accounts  |

## Docs

https://github.com/ethereum/go-ethereum/wiki


# JavaScript API

## Loading scripts

1. Attach to Node

2. Load a script

Run: `loadScript("/opt/ethereum/scripts/check-balances.js")`

## Docs 

https://github.com/ethereum/wiki/wiki/JavaScript-API

# Connect Etherium wallet to private network on macOS

Run: `/Applications/Ethereum\ Wallet.app/Contents/MacOS/Ethereum\ Wallet --rpc http://localhost:8545`

You should see something like:

```
[2018-01-16 12:46:01.599] [INFO] Sockets/3 - Connect to {"hostPort":"http://localhost:8545"}
[2018-01-16 12:46:01.600] [INFO] main - Connected via IPC to node.
[2018-01-16 12:46:01.627] [INFO] Sockets/3 - Connected!
[2018-01-16 12:46:01.636] [INFO] (ui: splashscreen) - Network is privatenet
```