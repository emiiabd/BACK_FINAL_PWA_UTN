import express from 'express';
import { validateLoginData } from '../middlewares/validation.middleware.js';

const statusRouter = express.Router();

statusRouter.get('/', validateLoginData, (req, res) => res.send('OK'));

export default statusRouter;