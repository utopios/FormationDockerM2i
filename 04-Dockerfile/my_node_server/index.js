const express = require("express")
const http = require ("http")
const app = express()

app.get('/', (req,res)=> {
    res.end("Bonjour depuis mon serveur node.js...")
    http.request('http://'+process.env.ADRESS_APACHE4)
})

app.listen(80,()=> {
    console.log("app is running")
})