const express = require ('express'); 
const router = express.Router(); 
const jouetController = require('./../controllers/jouetController'); 

router.get('/', jouetController.all);
router.post('/add', jouetController.create);
router.put('/:id', jouetController.update);
router.delete('/:id', jouetController.delete);






module.exports= router; 