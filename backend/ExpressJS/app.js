const express = require('express');
const mongoose = require('mongoose');
const Jouet = require('./models/Jouet');

mongoose.connect('mongodb://localhost:27017/exchange',
  { useNewUrlParser: true,
    useUnifiedTopology: true })
  .then(() => console.log('Connected successfully to MongoDB !'))
  .catch(() => console.log('Connection failed to MongoDB !'));

const app = express();

app.use((req, res, next) => {
    res.setHeader('Access-Control-Allow-Origin', '*');
    res.setHeader('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content, Accept, Content-Type, Authorization');
    res.setHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
    next();
  });

  app.get('/api/jouets', (req, res) => {
    Jouet.find()
      .then(jouets => res.status(200).json(jouets))
      .catch(err => res.status(400).json({error: err.message}));
    });

module.exports = app;