import mysql from "mysql2";
import dotenv from "dotenv";

dotenv.config();
const dbHost = process.env.DB_HOST || "localhost";
const dbName = process.env.DB_DBNAME || "grabbo";
const dbUsername = process.env.DB_USERNAME || "grabboUser";
const dbPassword = process.env.DB_PASSWORD || "mysql@12345";

const db = mysql.createConnection({
  host: dbHost,
  user: dbUsername,
  password: dbPassword,
  database: dbName,
});
// module.exports = { db };
export { db };
