// RESTful CRUD API with Node.js, Express, and MySQL for CJStreetwear

// Import required modules
const express = require('express');
const mysql = require('mysql');
const bodyParser = require('body-parser');
const cors = require('cors');

// Create an instance of Express
const app = express();

// Middleware to parse JSON data
app.use(bodyParser.json());
app.use(cors());

// Create a MySQL connection
const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '1234',
    database: 'sui'
});

// Connect to MySQL
db.connect((err) => {
    if (err) {
        throw err;
    }
    console.log('Connected to MySQL database');
});

// Create a new product (Create)
app.post('/products', (req, res) => {
    const newProduct = req.body;
    const sql = 'INSERT INTO Product SET ?';
    db.query(sql, newProduct, (err, result) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.send('Product added successfully');
    });
});

// Retrieve all products (Read)
app.get('/products', (req, res) => {
    const sql = 'SELECT * FROM Product';
    db.query(sql, (err, results) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.json(results);
    });
});

app.get('/products/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'SELECT * FROM Product WHERE ProductID = ?';
    db.query(sql, [id], (err, result) => {
        if (err) {
            return res.status(500).json({ error: err.message });
        }
        if (result.length === 0) {
            return res.status(404).json({ message: 'Product not found' });
        }
        res.json(result[0]);
    });
});

// Update a product by ID (Update)
app.put('/products/:id', (req, res) => {
    const { id } = req.params;
    const updatedProduct = req.body;
    const sql = 'UPDATE Product SET ? WHERE ProductID = ?';
    db.query(sql, [updatedProduct, id], (err, result) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.send('Product updated successfully');
    });
});

// Delete a product by ID (Delete)
app.delete('/products/:id', (req, res) => {
    const { id } = req.params;
    const sql = 'DELETE FROM Product WHERE ProductID = ?';
    db.query(sql, [id], (err, result) => {
        if (err) {
            return res.status(500).send(err);
        }
        res.send('Product deleted successfully');
    });
});

// Start the server
const PORT = 4000;
app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});