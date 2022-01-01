const mongoose = require ('mongoose');

const jouetShema = new mongoose.Schema({

    titre:{type: String, required:true},
    description:{type: String, required:true},
   // etat_jouet:[{Bad:String,Acceptable:String,Good:String,New:String}],
   etat_jouet:{type: String, required:true},
   // etat_jouet:Object.freeze({"Bad":"Bad" , "Acceptable":"Acceptable" , "Good":"Good" , "New":"New"}),
  //  categorie_jouet:Object.freeze({"Society":"Society" , "Educative":"Educative" , "Awkening":"Awkening" , "Puzzle":"Puzzle","Exterior":"Exterior" , "Imitation":"Imitation"}),
  //categorie_jouet:[{Society:String , Educative:String , Awkening:String , Puzzle:String ,Exterior:String , Imitation:String}],
  categorie_jouet:{type: String, required:true},
    donate:{type:Boolean,required:false},
    uploaded_by:{type:String,required:true}
}); 

module.exports = mongoose.model('Jouet',jouetShema,'jouet');