const Wish = require('../Models/Villagedenfant');

exports.all = (req, res) => {
    Wish.find()
        .then(Villagedenfant => res.status(200).json(villagedenfant))
        .catch(err => res.status(400).json({ error: err.message }));
};

exports.create = (req, res, next) => {
    const villagedenfant = new Villagedenfant({
        ...req.body
    });
    wish.save()
        .then(() => res.status(201).json({ message: 'Villagedenfant added  !' }))
        .catch(error => res.status(400).json({ error }));
};

exports.update = (req, res, next) => {
    Wish.updateOne({ _id: req.params.id }, {...req.body, _id: req.params.id })
        .then(() => res.status(200).json({ message: 'Villagedenfant updated !' }))
        .catch(error => res.status(400).json({ error }));
};

exports.delete = (req, res, next) => {
    Wish.deleteOne({ _id: req.params.id })
        .then(() => res.status(200).json({ message: 'Villagedenfant deleted !' }))
        .catch(error => res.status(400).json({ error }));
};