# runloop-playground

containerized runloop playground

## setup

i'm following the instructions in the docs here: <https://docs.runloop.ai/overview/quickstart>

## running

1. populate env variables in examples.env
2. run `cp example.env .env`
3. fill out runloop and openai keys

## dev

1.

```
docker compose up dev --build -d
```

2. use vscode to attach editor to container

## prod/running once in terminal

```
docker compose up prod --build -d
docker compose logs prod -f
```
