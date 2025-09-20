FROM node:24-alpine3.21

WORKDIR /usr/src/app

COPY package.json ./
COPY package-lock.json ./

RUN npm install

COPY . .
# Instala OpenSSL en Alpine
RUN apk add --no-cache openssl
RUN npx prisma generate

EXPOSE 3001