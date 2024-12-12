import mysql from "mysql2/promise";
import ENVIROMENT from "../config/enviroment.config.js";

const DB_POOL = mysql.createPool({
  host: ENVIROMENT.MYSQL.HOST,
  user: ENVIROMENT.MYSQL.USERNAME,
  password: ENVIROMENT.MYSQL.PASSWORD,
  database: ENVIROMENT.MYSQL.DATABASE,
  connectionLimit: 100,
});

const checkConnection = async () => {
  try {
    await DB_POOL.getConnection();
    console.log("DB is connected");
    connection.release()
  } catch (error) {
    console.log(error);
  }
};

checkConnection();

export default DB_POOL;