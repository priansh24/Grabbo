import express from "express";
import cors from "cors";
// import dotenv from "dotenv";
import { dbPool, port } from "./connection.js";
// import mysql from "mysql2";

const connectToDatabase = async() => {
    try {
        const db = await dbPool.getConnection();
        console.log("Connected to MySQL database");
        return db;
    } catch (error) {
        console.error("Error connecting to MySQL:", error);
        throw error;
    }
};

const db = await connectToDatabase();

const app = express();
app.use(cors());
app.use(express.json());

const username = "admin";
const password = "admin";

// Connect to the database
// const db = createConnection();
// db.connect((err) => {
//     if (err) {
//         console.error("Error connecting to MySQL database:", err);
//         return;
//     }
//     console.log("Connected to MySQL database");
// });

app.post("/addProduct", async function(req, res) {
    const id = req.body.id;
    const name = req.body.name;
    const category = req.body.category;
    const price = req.body.price;
    const productClass = req.body.class;
    const productSubclass = req.body.subclass;
    const quantity = req.body.quantity;
    const image = req.body.image;
    const values = [
        id,
        name,
        price,
        quantity,
        productClass,
        productSubclass,
        image,
    ];
    try {
        const sql = `insert into ${category}(id,name,price,quantity,class,sub_class,url) Values(?,?,?,?,?,?,?)`;
        // db.query(sql, values, function(err, result) {
        //     if (err) res.status(500).send(err.message);
        const [result, fields] = await db.execute(sql, values);
        res.status(200).json({ message: "Data added successfully" });
    } catch (error) {
        console.error("Internal server error:", error);
        // Send a more informative error response
        res.status(500).json({ error: "Internal Server Error" });
    }
});

app.delete("/deleteProduct", async function(req, res) {
    const category = req.body.category;
    const name = req.body.name;
    try {
        const sql = `DELETE from ${category} WHERE name = ?`;
        const [result, fields] = await db.execute(sql, name);
        res.json({ message: "Data Deleted Successfully." });
    } catch (error) {
        console.error("Internal server error:", error);
        // Send a more informative error response
        res.status(500).json({ error: "Internal Server Error" });
    }
});
app.post("/updateProductPrice", async function(req, res) {
    const { category, price, id } = req.body;
    try {
        const sql = `UPDATE ${category} SET price = ? WHERE id = ?`;
        const values = [price, id];
        const [result, fields] = await db.execute(sql, values);
        res.json({ message: "Data Updated Successfully." });
    } catch (error) {
        console.error("Internal server error:", error);
        // Send a more informative error response
        res.status(500).json({ error: "Internal Server Error" });
    }
});
app.post("/updateProductQuantity", async function(req, res) {
    const { category, quantity, id } = req.body;

    try {
        const sql = `UPDATE ${category} SET quantity = ? WHERE id = ?`;
        const values = [quantity, id];
        const [result, fields] = await db.execute(sql, values);
        res.json({ message: "Data Updated Successfully." });
    } catch (error) {
        console.error("Internal server error:", error);
        // Send a more informative error response
        res.status(500).json({ error: "Internal Server Error" });
    }
});

app.get("/student/products/:category", async function(req, res) {
    const category = req.params.category;
    try {
        // Example query for the "beverages" table
        const sql = `Select name,price,quantity,url from ${category}`;
        // const value = [category];
        // const formattedSQL = db.format(sql, value);
        // console.log("Executing SQL query:", formattedSQL);

        // Execute the query
        // Send the results as JSON
        const [results, fields] = await db.execute(sql);
        res.json(results);
    } catch (error) {
        console.error("Internal server error:", error);
        // Send a more informative error response
        res.status(500).json({ error: "Internal Server Error" });
    }
});

app.get("/login", function(req, res) {
    const userUsername = req.body.username;
    const userPassword = req.body.password;
    res.json(userUsername, userPassword);
});

// Endpoint to fetch products based on the selected category
app.get("/products/:category", async(req, res) => {
    const category = req.params.category;

    try {
        const sql = `SELECT name FROM ${category}`;
        const [results, fields] = await db.execute(sql);
        const products = results.map((result) => result.name);
        res.json(products);
    } catch (error) {
        console.error("Error fetching products:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
});

// Endpoint to fetch products based on the selected product's name
app.get("/products/:category/:productName", async(req, res) => {
    const name = req.params.productName;
    const category = req.params.category;

    try {
        const sql = `SELECT id, name, price, quantity FROM ${category} WHERE name LIKE ?`;
        const [results, fields] = await db.execute(sql, [`%${name}%`]);

        const products = results.map((result) => ({
            id: result.id,
            name: result.name,
            price: result.price,
            quantity: result.quantity,
        }));

        res.json(products);
    } catch (error) {
        console.error("Error fetching products:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
});

// Search in the student view for products.
app.get("/search", async(req, res) => {
    const searchTerm = req.query.term;

    try {
        const [results, fields] = await db.execute("CALL Search(?)", [searchTerm]);

        // Assuming the stored procedure returns multiple result sets
        const [result] = results;
        // Send the results to the frontend
        res.json(result);
    } catch (error) {
        console.error("Error executing query:", error);
        res.status(500).json({ error: "Internal Server Error" });
    }
});

app.listen(port, () => {
    console.log(`Server is listening on Port: ${port}`);
});