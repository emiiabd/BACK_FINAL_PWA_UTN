import express from 'express';
import { getGoogleMapsFrontApiKey } from '../controllers/frontENV.controller.js';

const frontENVrouter = express.Router();

frontENVrouter.get('/GM-ak', getGoogleMapsFrontApiKey);

export default frontENVrouter;