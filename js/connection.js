import mysql from "mysql2/promise"; // Import promise-based MySQL module
import dotenv from "dotenv";

dotenv.config();
const dbHost = process.env.DB_HOST;
const dbName = process.env.DB_DBNAME;
const dbUsername = process.env.DB_USERNAME;
const dbPassword = process.env.DB_PASSWORD;
const port = process.env.PORT;

const dbPool = mysql.createPool({
    host: dbHost,
    user: dbUsername,
    password: dbPassword,
    database: dbName,
    connectionLimit: 10, // Adjust the limit based on your application needs
    waitForConnections: true,
    queueLimit: 0,
});
export { dbPool, port };