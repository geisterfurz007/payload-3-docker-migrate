# Payload 3.0 Migration in Docker Image

This repo demonstrates the inability to run database migrations without the source payload.config.ts and a tsconfig.json
available.

## The issue

It's not possible to run a migration (either using `pnpm run payload migrate` or a standalone script) without having a
tsconfig.json file available.

The repro attempts both approaches with both failing to locate / import tsconfig.json due to it not being present in the
image.

## Reproduction steps

```sh
git clone git@github.com:geisterfurz007/payload-3-docker-migrate payload-3-docker-gf007
cd payload-3-docker-gf007
docker build -t payload-3-docker-gf007
docker run --rm payload-3-docker-gf007
```

## Cleanup

To clean up resources created from this repro:

```sh
docker image rm payload-3-docker-gf007
rm -r payload-3-docker-gf007
```
