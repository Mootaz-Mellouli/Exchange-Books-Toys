const Livre = require('../Models/Livre');

// get all courses
exports.all = (req, res) => {
    Livre.find()
    .then(livre => res.status(200).json(livre))
    .catch(err => res.status(400).json({error: err.message}));
};

// get a course by id
exports.get = (req, res, next) => {
  Livre.findOne({ _id: req.params.id })
      .then(livre => res.status(200).json(livre))
      .catch(error => res.status(404).json({ error }));
  };

  // store a new course
exports.create = (req, res, next) => {
  const course = new Livre({
    ...req.body
  });
  course.save()
    .then(() => res.status(201).json({ message: 'Livre created  !'}))
    .catch(error => res.status(400).json({ error }));
};

// update a course by id
exports.update = (req, res, next) => {
  Livre.updateOne({ _id: req.params.id }, { ...req.body, _id: req.params.id })
    .then(() => res.status(200).json({ message: 'Livre updated !'}))
    .catch(error => res.status(400).json({ error }));
};

// delete a course by id
exports.delete = (req, res, next) => {
  Livre.deleteOne({ _id: req.params.id })
    .then(() => res.status(200).json({ message: 'Livre deleted !'}))
    .catch(error => res.status(400).json({ error }));
};