const mongoose = require("mongoose");

const retirementSchema = new mongoose.Schema({
    nom_etablissement: {
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
module.exports = mongoose.model("retirement", retirementSchema);