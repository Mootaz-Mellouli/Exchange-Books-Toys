const Wish = require('./../Models/Wish');

exports.all = (req, res) => {
    Wish.find()
        .then(wishes => res.status(200).json(wishes))
        .catch(err => res.status(400).json({ error: err.message }));
};

exports.create = (req, res, next) => {
    const wish = new Wish({
        ...req.body
    });
    wish.save()
        .then(() => res.status(201).json({ message: 'Wish added  !' }))
        .catch(error => res.status(400).json({ error }));
};

exports.update = (req, res, next) => {
    Wish.updateOne({ _id: req.params.id }, {...req.body, _id: req.params.id })
        .then(() => res.status(200).json({ message: 'Wish updated !' }))
        .catch(error => res.status(400).json({ error }));
};

exports.delete = (req, res, next) => {
    Wish.deleteOne({ _id: req.params.id })
        .then(() => res.status(200).json({ message: 'Wish deleted !' }))
        .catch(error => res.status(400).json({ error }));
};