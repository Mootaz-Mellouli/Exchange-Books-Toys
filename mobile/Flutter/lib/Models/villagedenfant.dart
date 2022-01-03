class Villagedenfant {
  String _id;
  String _nomVillagedenfant;
  String _matricule;
  String _adresse;
  String _numTelVillagedenfant;
  String _emailVillagedenfant;
  String _motDePasseVillagedenfant;

  Villagedenfant(
      this._id,
      this._nomVillagedenfant,
      this._matricule,
      this._adresse,
      this._numTelVillagedenfant,
      this._emailVillagedenfant,
      this._motDePasseVillagedenfant);

  String get motDePasseVillagedenfant => _motDePasseVillagedenfant;

  set motDePasseVillagedenfant(String value) {
    _motDePasseVillagedenfant = value;
  }

  String get emailVillagedenfant => _emailVillagedenfant;

  set emailVillagedenfant(String value) {
    _emailVillagedenfant = value;
  }

  String get numTelVillagedenfant => _numTelVillagedenfant;

  set numTelVillagedenfant(String value) {
    _numTelVillagedenfant = value;
  }

  String get adresse => _adresse;

  set adresse(String value) {
    _adresse = value;
  }

  String get matricule => _matricule;

  set matricule(String value) {
    _matricule = value;
  }

  String get nomVillagedenfant => _nomVillagedenfant;

  set nomVillagedenfant(String value) {
    _nomVillagedenfant = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}
