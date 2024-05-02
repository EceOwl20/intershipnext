import Cors from 'cors';
import { NextRequest, NextResponse } from 'next/server';

// CORS yapılandırması
const cors = Cors({
    origin: '*', // Geliştirme aşamasında tüm kaynaklardan isteklere izin verir
    methods: ['GET', 'POST', 'OPTIONS'], // İzin verilen HTTP metodları
    allowedHeaders: ['Content-Type'], // İzin verilen başlıklar
});

export function runMiddleware(request, response, fn) {
  return new Promise((resolve, reject) => {
    fn(request, response, (result) => {
      if (result instanceof Error) {
        return reject(result);
      }
      return resolve(result);
    });
  });
}

export async function handler(req, res) {
    await runMiddleware(req, res, cors);

    if (req.method === 'OPTIONS') {
        return res.status(200).send('OK');
    }

    // API işlemleri burada...
}