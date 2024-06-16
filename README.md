# Graphql with Nestjs and CI/CD

Implemented data query and manipulation APIs with Docker, Node, PostgreSQL, NestJS, Prisma, GraphQL.

- [Graphql with Nestjs and CI/CD](#graphql-with-nestjs-and-cicd)
  - [Creating the backend server](#creating-the-backend-server)
  - [Add GraphQL support](#add-graphql-support)
  - [Setting up Prisma](#setting-up-prisma)

## Creating the backend server

```sh
npm i -g @nestjs/cli
nest new ref-fullstack-2406
$ cd ref-fullstack-2406
$ npm run start:dev
```

## Add GraphQL support

```sh
npm i @nestjs/graphql @nestjs/apollo @apollo/server graphql
nest g resource todo
```

## Setting up Prisma

```sh
npm i -D prisma
npx prisma init
# npx prisma init --datasource-provider postgresql
```
