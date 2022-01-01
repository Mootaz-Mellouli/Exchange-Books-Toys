const express = require ('express'); 
const router = express.Router(); 
const Jouet = require('./../Models/Jouet');



router.get('/', (req, res) => {
    Jouet.find()
      .then(jouets => res.status(200).json(jouets))
      .catch(err => res.status(400).json({error: err.message}));
    });

module.exports= router; 