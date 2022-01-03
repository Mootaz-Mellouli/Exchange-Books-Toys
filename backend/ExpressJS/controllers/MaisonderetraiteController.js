const Wish = require('../Models/Maisonderetraite');

exports.all = (req, res) => {
    Wish.find()
        .then(maisonderetraite => res.status(200).json(maisonderetraite))
        .catch(err => res.status(400).json({ error: err.message }));
};

exports.create = (req, res, next) => {
    const maisonderetraite = new Maisonderetraite({
        ...req.body
    });
    wish.save()
        .then(() => res.status(201).json({ message: 'Maisonderetraite added  !' }))
        .catch(error => res.status(400).json({ error }));
};

exports.update = (req, res, next) => {
    Wish.updateOne({ _id: req.params.id }, {...req.body, _id: req.params.id })
        .then(() => res.status(200).json({ message: 'Maisonderetraite updated !' }))
        .catch(error => res.status(400).json({ error }));
};

exports.delete = (req, res, next) => {
    Wish.deleteOne({ _id: req.params.id })
        .then(() => res.status(200).json({ message: 'Maisonderetraite deleted !' }))
        .catch(error => res.status(400).json({ error }));
};