const express = require('express')
const mysql = require('mysql')
const connection = require("./connectDB.js")


let CustomerAccounts
connection.getCustomerAccounts().then(result=> {
    CustomerAccounts = result
    console.log(result)
})


