const express = require('express');
const router = express.Router();

const associationController = require('../controllers/associationController')

router.get('/', associationController.all);
router.get('/:id', associationController.get);
router.post('/', associationController.create);
router.put('/:id', associationController.update);
router.delete('/:id', associationController.delete);

module.exports = router;