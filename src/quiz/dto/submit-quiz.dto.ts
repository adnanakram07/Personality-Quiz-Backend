import {
  IsArray,
  IsInt,
  IsString,
  IsEmail,
  IsNumber,
  IsOptional,
  ValidateNested,
} from 'class-validator';
import { Type } from 'class-transformer';

export class AnswerDto {
  @IsInt()
  optionId: number;
}

export class SubmitQuizDto {
  @IsOptional()
  @IsString()
  name?: string;

  @IsOptional()
  @IsNumber()
  age?: number;

  @IsOptional()
  @IsEmail()
  email?: string;

  @IsArray()
  @ValidateNested({ each: true })
  @Type(() => AnswerDto)
  answers: AnswerDto[];
}
