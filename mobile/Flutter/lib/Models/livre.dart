class Livre {
  String? _id;
  String? _titre;
  String? _auteur;
  String? _maisonEdition;
  String? _etatLivre;
  String? _categorieLivre;

  Livre(this._id, this._titre, this._auteur, this._maisonEdition, this._etatLivre,
      this._categorieLivre);

  String? get categorieLivre => _categorieLivre;

  set categorieLivre(String? value) {
    _categorieLivre = value;
  }

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  String? get etatLivre => _etatLivre;

  set etatLivre(String? value) {
    _etatLivre = value;
  }

  String? get maisonEdition => _maisonEdition;

  set maisonEdition(String? value) {
    _maisonEdition = value;
  }

  String? get auteur => _auteur;

  set auteur(String? value) {
    _auteur = value;
  }

  String? get titre => _titre;

  set titre(String? value) {
    _titre = value;
  }
}