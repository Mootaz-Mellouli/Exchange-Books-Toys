const express = require('express');
const router = express.Router();

const associationController = require('../controllers/userController')

router.get('/', userController.all);
router.get('/:id', userController.get);
router.post('/', userController.create);
router.put('/:id', userController.update);
router.delete('/:id', userController.delete);

module.exports = router;