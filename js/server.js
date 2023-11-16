import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import { db } from "./connection.js";

dotenv.config();

const port = process.env.PORT;

const app = express();
app.use(cors());
app.use(express.json());

const username = "admin";
const password = "admin";

// Connect to the database
db.connect((err) => {
  if (err) {
    console.error("Error connecting to MySQL database:", err);
    return;
  }
  console.log("Connected to MySQL database");
});

app.post("/addProduct", function (req, res) {
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
    db.query(sql, values, function (err, result) {
      if (err) res.status(500).send(err.message);
      res.status(200).json({ message: "Data added successfully" });
    });
  } catch (error) {
    console.error("Internal server error:", error);
    // Send a more informative error response
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.delete("/deleteProduct", function (req, res) {
  const category = req.body.category;
  const name = req.body.name;
  try {
    const sql = `DELETE from ${category} WHERE name = ?`;
    db.query(sql, name, function (err, result) {
      if (err) res.status(500).send(err.message);
      res.json({ message: "Data Deleted Successfully." });
    });
  } catch (error) {
    console.error("Internal server error:", error);
    // Send a more informative error response
    res.status(500).json({ error: "Internal Server Error" });
  }
});
app.post("/updateProductPrice", function (req, res) {
  const { category, price, id } = req.body;
  try {
    const sql = `UPDATE ${category} SET price = ? WHERE id = ?`;
    const values = [price, id];
    db.query(sql, values, function (err, result) {
      if (err) res.status(500).send(err.message);
      res.json({ message: "Data Updated Successfully." });
    });
  } catch (error) {
    console.error("Internal server error:", error);
    // Send a more informative error response
    res.status(500).json({ error: "Internal Server Error" });
  }
});
app.post("/updateProductQuantity", function (req, res) {
  const { category, quantity, id } = req.body;

  try {
    const sql = `UPDATE ${category} SET quantity = ? WHERE id = ?`;
    const values = [quantity, id];
    db.query(sql, values, function (err, result) {
      if (err) res.status(500).send(err.message);
      res.json({ message: "Data Updated Successfully." });
    });
  } catch (error) {
    console.error("Internal server error:", error);
    // Send a more informative error response
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.get("/student/products/:category", function (req, res) {
  const category = req.params.category;
  try {
    // Example query for the "beverages" table
    const sql = `Select name,price,quantity,url from ??`;
    const value = [category];
    // const formattedSQL = db.format(sql, value);
    // console.log("Executing SQL query:", formattedSQL);

    // Execute the query
    db.query(sql, value, (err, results) => {
      if (err) {
        console.error("Error executing query:", err);
        // Send a more informative error response
        res.status(500).json({ error: "Error executing database query" });
        return;
      }

      // Send the results as JSON
      res.json(results);
    });
  } catch (error) {
    console.error("Internal server error:", error);
    // Send a more informative error response
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.get("/login", function (req, res) {
  const userUsername = req.body.username;
  const userPassword = req.body.password;
  res.json(userUsername, userPassword);
});

// Endpoint to fetch products based on the selected category
app.get("/products/:category", (req, res) => {
  const category = req.params.category;

  // Replace this with your actual MySQL query to fetch products from the corresponding table
  const sql = `SELECT name FROM ${category}`;
  db.query(sql, (err, results) => {
    if (err) {
      console.error("Error fetching products:", err);
      res.status(500).json({ error: "Internal Server Error" });
    } else {
      const products = results.map((result) => result.name);
      res.json(products);
    }
  });
});
// Endpoint to fetch products based on the selected product's name
app.get("/products/:category/:productName", (req, res) => {
  const name = req.params.productName;
  const category = req.params.category;
  // Replace this with your actual MySQL query to fetch products from the corresponding table
  const sql = `SELECT id,name,price,quantity FROM ${category} where name = ?`;
  const value = [`%${name}%`];
  db.query(sql, name, (err, results) => {
    if (err) {
      console.error("Error fetching products:", err);
      res.status(500).json({ error: "Internal Server Error" });
    } else {
      const products = results.map((result) => result);
      res.json(products);
    }
  });
});

// Search in the student view for products.
app.get("/search", (req, res) => {
  const searchTerm = req.query.term;

  // Call the stored procedure
  const query = "CALL Search(?)";

  db.query(query, [searchTerm], (err, results) => {
    if (err) {
      console.error("Error executing query:", err);
      return res.status(500).json({ error: "Internal Server Error" });
    }

    // Extract result from the stored procedure call
    const [result] = results;

    // Send the results to the frontend
    res.json(result);
  });
});

app.get("/student/products/result", function (req, res) {
  // const name = req.params.result;
  const { id, name, price, quantity, url } = req.body;
  try {
    // Example query for the "beverages" table
    const sql = `Select name,price,quantity,url from ??`;
    const value = [category];
    // const formattedSQL = db.format(sql, value);
    // console.log("Executing SQL query:", formattedSQL);

    // Execute the query
    db.query(sql, value, (err, results) => {
      if (err) {
        console.error("Error executing query:", err);
        // Send a more informative error response
        res.status(500).json({ error: "Error executing database query" });
        return;
      }

      // Send the results as JSON
      res.json(results);
    });
  } catch (error) {
    console.error("Internal server error:", error);
    // Send a more informative error response
    res.status(500).json({ error: "Internal Server Error" });
  }
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
