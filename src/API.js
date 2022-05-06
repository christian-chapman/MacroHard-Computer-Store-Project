const express = require('express')
const mysql = require('mysql')
import db from "./connect.js"

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