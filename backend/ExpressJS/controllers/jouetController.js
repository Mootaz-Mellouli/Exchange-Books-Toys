const Jouet = require('./../Models/Jouet');

exports.all= (req, res) => {
    Jouet.find()
      .then(jouets => res.status(200).json(jouets))
      .catch(err => res.status(400).json({error: err.message}));
    };

exports.create= (req, res, next) => {
        const jouet = new Jouet({
          ...req.body
        });
        jouet.save()
          .then(() => res.status(201).json({ message: 'Toy created  !'}))
          .catch(error => res.status(400).json({ error }));
      };
    
exports.update= (req, res, next) => {
        Jouet.updateOne({ _id: req.params.id }, { ...req.body, _id: req.params.id })
          .then(() => res.status(200).json({ message: 'Toy updated !'}))
          .catch(error => res.status(400).json({ error }));
      };

exports.delete= (req, res, next) => {
        Jouet.deleteOne({ _id: req.params.id })
          .then(() => res.status(200).json({ message: 'Toy deleted !'}))
          .catch(error => res.status(400).json({ error }));
      };