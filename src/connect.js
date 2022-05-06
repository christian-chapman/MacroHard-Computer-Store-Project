const express = require('express')
const mysql = require('mysql')
require('dotenv').config()
//console.log(process.env)

// Create connection

const db = mysql.createConnection({
    host: "macrohard.crmfqf5qrsen.us-east-1.rds.amazonaws.com",
    user: "admin",
    password: process.env.PASSWORD,
    port: "3306",
    database: "macrohard"
    
})

//Connect to MySQL
db.connect(err => {
    if(err){
        throw err
    }
    console.log('MySQL Connection')
})

const app = express()

db.query("SELECT * FROM customeraccount", (err, result, fields) => {
    if(err) throw err
    console.log(result)
})
db.end(err => {
    if(err){
        throw err
    }
    console.log('Closed connection to DB')
})