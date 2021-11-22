class Association {
  int _id;
  String _nomAssociation;
  String _matricule;
  String _adresse;
  int _numTelAssociation;
  String _emailAssociation;
  String _motDePasseAssociation;

  Association(
      this._id,
      this._nomAssociation,
      this._matricule,
      this._adresse,
      this._numTelAssociation,
      this._emailAssociation,
      this._motDePasseAssociation);

  String get motDePasseAssociation => _motDePasseAssociation;

  set motDePasseAssociation(String value) {
    _motDePasseAssociation = value;
  }

  String get emailAssociation => _emailAssociation;

  set emailAssociation(String value) {
    _emailAssociation = value;
  }

  int get numTelAssociation => _numTelAssociation;

  set numTelAssociation(int value) {
    _numTelAssociation = value;
  }

  String get adresse => _adresse;

  set adresse(String value) {
    _adresse = value;
  }

  String get matricule => _matricule;

  set matricule(String value) {
    _matricule = value;
  }

  String get nomAssociation => _nomAssociation;

  set nomAssociation(String value) {
    _nomAssociation = value;
  }

  int get id => _id;

  set id(int value) {
    _id = value;
  }
}