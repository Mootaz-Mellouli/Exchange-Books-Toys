const mongoose = require ('mongoose');

const livreSchema = new mongoose.Schema({
    title:{type: String, required:true},
    auteur:{type: String, required:true},
    maison_edition:{type: String, required:true},
    categorie_livre:{required:true}= Object.freeze({"Academic":"Academic" , "Novel":"Novel" , "Scientific":"Scientific" , "Dictionary":"Dictionary","Art":"Art" , "History":"History"}),
    etat_livre:{required:true}=Object.freeze({"Bad":"Bad" , "Acceptable":"Acceptable" , "Good":"Good" , "New":"New"}),
    donate:{type:Boolean,required:false},
    uploaded_by:{type:String,required:true}
});

module.exports = mongoose.model('Livre',livreSchema);

