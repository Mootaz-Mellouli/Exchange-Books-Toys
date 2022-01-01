const express = require('express');
const res = require('express/lib/response');

const app = express();

app.use((req,res)=>{
res.json("hello world aaaa ! ");

});

module.exports = app;