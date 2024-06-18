import { ObjectType, Field, Int } from '@nestjs/graphql';

@ObjectType()
export class Todo {
  @Field(() => Int)
  id: number;
  @Field(() => String, { nullable: false })
  title: string;
  @Field(() => Date, { nullable: false })
  createAt: Date;
  @Field(() => Date, { nullable: false })
  updateAt: Date;
}
