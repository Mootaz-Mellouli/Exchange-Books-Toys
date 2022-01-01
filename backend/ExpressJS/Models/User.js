const mongoose = require ('mongoose');

const userSchema = new mongoose.Schema({

    nom:{type: String, required:true},
    prenom:{type: String, required:true},
    email:{type: String, required:true},
    email:{type: String, required:true},
    numeroTel:{type: String, required:true},
    cin:{type: String, required:true},
    adresse:{type: String, required:true},
    password:{type: String, required:true},
});

module.exports = mongoose.model('User',userSchema);