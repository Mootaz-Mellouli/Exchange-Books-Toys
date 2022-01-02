const mongoose = require('mongoose');

const wishSchema = new mongoose.Schema({
    description: { type: String, required: true },
    quantite: { type: String, required: true },
    categorie_wish: { required: true } = Object.freeze({ "Toy": "Toy", "Book ": "Book", })
});

module.exports = mongoose.model('Wish', WishSchema);