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
function connect(){
    db.connect(err => {
        if(err)throw err
        console.log('MySQL Connection')
    })

}

function disconnect(){
    db.end(err => {
        if(err) throw err
        console.log('Closed connection to DB')
    })
}

async function getCustomerAccounts(){
    let values
    connect()
    db.query("SELECT * FROM customeraccount", (err, result, fields) => {
        if(err) throw err
        values = result
        //console.log(values)
    })
    disconnect()
    return values
}
module.exports = {db, getCustomerAccounts, connect, disconnect}