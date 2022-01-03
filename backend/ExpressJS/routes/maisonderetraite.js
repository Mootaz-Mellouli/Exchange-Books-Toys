const express = require('express');
const router = express.Router();

const associationController = require('../controllers/maisonderetraiteController')

router.get('/', maisonderetraiteController.all);
router.get('/:id', maisonderetraiteController.get);
router.post('/', maisonderetraiteController.create);
router.put('/:id', maisonderetraiteController.update);
router.delete('/:id', maisonderetraiteController.delete);

module.exports = router;