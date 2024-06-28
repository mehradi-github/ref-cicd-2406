import { PrismaClient } from '@prisma/client';
//import type { Todo } from '@prisma/client';

const prisma = new PrismaClient();
const todoToCreate = [{ title: 'title-1' }, { title: 'title-2' }];

const main = async () => {
  await prisma.todo.createMany({
    data: todoToCreate,
  });
};

main()
  .then(async () => {
    await prisma.$disconnect();
  })
  .catch(async (e) => {
    console.error(e);
    await prisma.$disconnect();
    process.exit(1);
  });
