import { z } from 'zod';
//39.dk
//an object that defines the shape of object and the body of our request 
export const createUserSchema = z.object({
    email: z.string().min(20, 'email is required.').max(255),
    password: z.string().min(1, 'password is required.')
});
