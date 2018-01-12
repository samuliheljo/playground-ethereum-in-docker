# playground-ethereum-in-docker

Private ethereum blockchain running in Docker

## What is a playground?

See https://github.com/samuliheljo/playgrounds/

## Running

1. Build geth Docker node and initialize genesis blockchain

`docker build -t playground-ethereum .`

2. Start node

`docker run playground-ethereum`

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

`loadScript("/opt/ethereum/scripts/check-balances.js")`

## Docs 

https://github.com/ethereum/wiki/wiki/JavaScript-API
