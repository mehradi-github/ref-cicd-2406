FROM node:lts-alpine3.20 AS base
WORKDIR /app
COPY package.json .
RUN npm install 

FROM base AS build
COPY . .
RUN npm run build
RUN npx prisma generate
RUN npx prisma push
RUN npm run prisma:database

FROM base AS production
ENV NODE_ENV=production
RUN npm install -g serve
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 reactjs
USER reactjs

COPY --from=build --chown=reactjs:nodejs /app/.build ./.build
COPY --from=build --chown=reactjs:nodejs /app/prisma/schema.prisma ./prisma/schema.prisma 
COPY --from=build --chown=reactjs:nodejs /app/public ./public

EXPOSE 3000
CMD serve -s build


FROM node:lts-alpine3.20 AS dev
WORKDIR /app
ENV NODE_ENV=development
COPY . .
RUN npm install 
RUN npx prisma generate 
CMD ["npm", "run", "dev"]

