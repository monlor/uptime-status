FROM node:16-alpine as builder

LABEL AUTHOR=monlor
LABEL EMAIL=me@monlor.com

COPY . /app/

WORKDIR /app

RUN cat .env && yarn install && yarn build

FROM nginx:1.21.6-alpine

COPY --from=builder /app/build /usr/share/nginx/html
