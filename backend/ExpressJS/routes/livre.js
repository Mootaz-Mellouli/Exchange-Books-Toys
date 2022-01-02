const express = require('express');
const router = express.Router();

const livreController = require('../controllers/livreController')

router.get('/', livreController.all);
router.get('/:id', livreController.get);
router.post('/', livreController.create);
router.put('/:id', livreController.update);
router.delete('/:id', livreController.delete);

module.exports = router;