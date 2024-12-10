import nodemailer from 'nodemailer';
import ENVIROMENT from './enviroment.config.js';


const transporter = nodemailer.createTransport({
  host: ENVIROMENT.MAIL_HOST,
  port: ENVIROMENT.MAIL_PORT,
  secure: true, // true for port 465, false for other port
  auth: {
    user: ENVIROMENT.MAIL_USER,
    pass: ENVIROMENT.MAIL_PASS
  }
})


export default transporter