class User {
  String _id;
  String _nomUser;
  String _cin;
  String _adresse;
  String _numTelUser;
  String _emailUser;
  String _motDePasseUser;

  User(
      this._id,
      this._nomUser,
      this._cin,
      this._adresse,
      this._numTelUser,
      this._emailUser,
      this._motDePasseUser);

  String get motDePasseUser => _motDePasseUser;

  set motDePasseUser(String value) {
    _motDePasseUser = value;
  }

  String get emailUser => _emailUser;

  set emailUser(String value) {
    _emailUser = value;
  }

  String get numTelUser => _numTelUser;

  set numTelUser(String value) {
    _numTelUser = value;
  }

  String get adresse => _adresse;

  set adresse(String value) {
    _adresse = value;
  }

  String get cin => _cin;

  set cin(String value) {
    _cin = value;
  }

  String get nomUser => _nomUser;

  set nomUser(String value) {
    _nomUser = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}