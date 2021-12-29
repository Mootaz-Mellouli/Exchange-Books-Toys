class Jouet {
  String? _id;
  String? _titre;
  String? _description;
  String? _etatJouet;
  String? _categorieJouet;

  Jouet(this._id, this._titre, this._description, this._etatJouet, this._categorieJouet);

  String? get categorieJouet => _categorieJouet;

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  set categorieJouet(String? value) {
    _categorieJouet = value;
  }

  String? get etatJouet => _etatJouet;

  set etatJouet(String? value) {
    _etatJouet = value;
  }

  String? get description => _description;

  set description(String? value) {
    _description = value;
  }

  String? get titre => _titre;

  set titre(String? value) {
    _titre = value;
  }
}