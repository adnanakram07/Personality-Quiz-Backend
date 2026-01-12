import { NestFactory } from '@nestjs/core';
import { AppModule } from '../src/app.module';
import { ValidationPipe } from '@nestjs/common';
import { ExpressAdapter } from '@nestjs/platform-express';
import express from 'express';

const server = express();

let app: any;

async function createApp() {
  if (!app) {
    app = await NestFactory.create(
      AppModule,
      new ExpressAdapter(server),
    );
    
    app.useGlobalPipes(new ValidationPipe());
    app.enableCors(); // Enable if you need CORS
    
    await app.init();
  }
  return app;
}

// Export for Vercel
export default async (req: any, res: any) => {
  await createApp();
  server(req, res);
};