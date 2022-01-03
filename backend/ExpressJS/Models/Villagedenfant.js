const mongoose = require("mongoose");

const villagedenfantSchema = new mongoose.Schema({
    nom_villagedenfant: {
        type: String,
        required: true
    },
    matricule: {
        type: String,
        required: true
    },
    num_tel: {
        type: String,
        required: true
    },
    email: {
        type: String,
        required: true
    },
    mot_de_passe: {
        type: String,
        required: true
    },
});
module.exports = mongoose.model("villagedenfant", villagedenfantSchema);