const express = require ('express'); 
const router = express.Router(); 
const Jouet = require('./../Models/Jouet');



router.get('/', (req, res) => {
    Jouet.find()
      .then(jouets => res.status(200).json(jouets))
      .catch(err => res.status(400).json({error: err.message}));
    });

    router.post('/save', (req, res, next) => {
        const jouet = new Jouet({
          ...req.body
        });
        jouet.save()
          .then(() => res.status(201).json({ message: 'Toy created  !'}))
          .catch(error => res.status(400).json({ error }));
      });

module.exports= router; 