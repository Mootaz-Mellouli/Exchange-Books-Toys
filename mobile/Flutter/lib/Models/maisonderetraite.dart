class Maisonderetraite {
  String _id;
  String _nomeeMaisonderetraite ;
  String _matricule;
  String _adresse;
  String _numTelMaisonderetraite ;
  String _emailMaisonderetraite ;
  String _motDePasseMaisonderetraite ;

 Maisonderetraite (
      this._id,
      this._nomMaisonderetraite ,
      this._matricule,
      this._adresse,
      this._numTelMaisonderetraite ,
      this._emailMaisonderetraite ,
      this._motDePasseMaisonderetraite );

  String get motDePasseMaisonderetraite  => _motDePasseMaisonderetraite ;

  set motDePasseMaisonderetraite (String value) {
    _motDePasseMaisonderetraite  = value;
  }

  String get emailMaisonderetraite  => _emailMaisonderetraite ;

  set emailMaisonderetraite (String value) {
    _emailMaisonderetraite  = value;
  }

  String get numTelMaisonderetraite  => _numTelMaisonderetraite ;

  set numTelMaisonderetraite (String value) {
    _numTelMaisonderetraite  = value;
  }

  String get adresse => _adresse;

  set adresse(String value) {
    _adresse = value;
  }

  String get matricule => _matricule;

  set matricule(String value) {
    _matricule = value;
  }

  String get nomMaisonderetraite  => _nomMaisonderetraite ;

  set nomMaisonderetraite (String value) {
    _nomMaisonderetraite  = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
