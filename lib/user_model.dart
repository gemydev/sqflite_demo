class User {
  int id;
  String _firstName;
  String _lastName;
  String _dob;

  User(this._firstName, this._lastName, this._dob);

  User.map(dynamic obj) {
    this._firstName = obj["firstName"];
    this._lastName = obj["lastName"];
    this._dob = obj["dob"];
  }

  String get firstName => _firstName;

  String get lastName => _lastName;

  String get dob => _dob;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map["firstName"] = _firstName;
    map["lastName"] = _lastName;
    map["dob"] = _dob;
    return map;
  }

  void setUserId(int id) {
    this.id = id;
  }
}
