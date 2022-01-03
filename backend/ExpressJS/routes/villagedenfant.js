const express = require('express');
const router = express.Router();

const associationController = require('../controllers/villagedenfantController')

router.get('/', villagedenfantController.all);
router.get('/:id', villagedenfantController.get);
router.post('/', villagedenfantController.create);
router.put('/:id', villagedenfantController.update);
router.delete('/:id', villagedenfantController.delete);

module.exports = router;