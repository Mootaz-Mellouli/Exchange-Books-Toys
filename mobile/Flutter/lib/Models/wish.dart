class Wish  {

  String? _id;
  String? _description;
  String? _categorieWish;

  Wish(this._id, this._description, this._categorieWish);

  String? get categorieWish => _categorieWish;

  String? get id => _id;

  set id(String? value) {
    _id = value;
  }

  set categorieWish(String? value) {
    _categorieWish = value;
  }

  String? get description => _description;

  set description(String? value) {
    _description = value;
  }

}