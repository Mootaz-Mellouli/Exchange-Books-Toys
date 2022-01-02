const express = require('express');
const router = express.Router();
const wishController = require('./../controllers/wishController');

router.get('/', wishController.all);
router.post('/add', wishController.create);
router.put('/:id', wishController.update);
router.delete('/:id', wishController.delete);



module.exports = router;