class Admin {
  String _id;
  String _login;
  String _password;

  Admin(
      this._id,
      this._login,
      this._password);

  String get password => _password;

  set password(String value) {
    _password = value;
  }


  String get login => _login;

  set login(String value) {
    login = value;
  }

  String get id => _id;

  set id(String value) {
    _id = value;
  }
}