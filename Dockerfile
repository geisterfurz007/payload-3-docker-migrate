FROM node:20.15-alpine as builder

WORKDIR /app
COPY package.json pnpm-lock.yaml ./
RUN corepack enable; pnpm install

COPY public/ ./public/
COPY src/ ./src/
COPY next.config.mjs payload.config.ts payload-types.ts tsconfig.json .eslintrc.json docker-entrypoint.sh ./

RUN pnpm run build

FROM node:20.15-alpine

WORKDIR /app

COPY package.json pnpm-lock.yaml next.config.mjs docker-entrypoint.sh ./
COPY scripts ./scripts/

COPY --from=builder /app/.next/ ./.next/
COPY --from=builder /app/public/ ./public/
COPY --from=builder /app/node_modules/ ./node_modules/
RUN corepack enable; corepack install

CMD ["sh", "/app/docker-entrypoint.sh"]
