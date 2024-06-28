FROM lts-alpine3.20 AS base
WORKDIR /app
COPY package.json .
RUN npm install 

FROM base AS build
COPY . .
RUN npm run build
RUN npx prisma generate
RUN npx prisma push
RUN npm run prisma:database