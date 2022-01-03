const Association = require('../Models/Association');

// get all courses
exports.all = (req, res) => {
    Association.find()
    .then(association => res.status(200).json(association))
    .catch(err => res.status(400).json({error: err.message}));
};

// get a Association by id
exports.get = (req, res, next) => {
  Association.findOne({ _id: req.params.id })
      .then(association => res.status(200).json(association))
      .catch(error => res.status(404).json({ error }));
  };

  // store a new Association
exports.create = (req, res, next) => {
  const Association = new Association({
    ...req.body
  });
  Association.save()
    .then(() => res.status(201).json({ message: 'Association created  !'}))
    .catch(error => res.status(400).json({ error }));
};

// update a Association by id
exports.update = (req, res, next) => {
  Association.updateOne({ _id: req.params.id }, { ...req.body, _id: req.params.id })
    .then(() => res.status(200).json({ message: 'Association updated !'}))
    .catch(error => res.status(400).json({ error }));
};

// delete a Association by id
exports.delete = (req, res, next) => {
  Association.deleteOne({ _id: req.params.id })
    .then(() => res.status(200).json({ message: 'Association deleted !'}))
    .catch(error => res.status(400).json({ error }));
};