const express = require("express");
// mysql2 is a NodeJS client to do CRUD with MySQL/MariaDB
const mysql2 = require("mysql2/promise");
// ejs is embedded JavaScript (aka template)
// a template file is a reusable HTML code which express can
// send back to the client
const ejs = require("ejs");
require('dotenv').config();

const app = express();
const port = 3000;

// setup EJS
app.set('view engine', 'ejs'); // tell Express that we are using EJS as the template engine
app.set('views', './views'); // tell Express where all the templates are

// Create a new connection pool
const dbConfig = {
    host: process.env.DB_HOST,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
    port: process.env.DB_PORT
}
// a pool of database connection
// a connection a "data pipeline" between your app and the database
// it can handles a finite amount of traffic, usually one
// the pool can handle the demand dynamically
// it can detect when there's a "queue" and create a new connections when needed
// and in times of low traffic
const dbConnection = mysql2.createPool(dbConfig);


app.get('/food-entries', async function(req, res){
    const sql = 'SELECT * FROM food_entries'
    // .query is a way to send SQL commands the database
    // the return will be array of information
    const results = await dbConnection.query(sql);
    const rows = results[0];
   
    res.render('food_entries', {
        foodEntries: rows
    })

})

app.listen(port, () => {
    console.log(`Server running at http://localhost:${port}`);
});