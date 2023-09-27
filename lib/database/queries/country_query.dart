class CountryQuery {
  static const String TABLE_NAME = "countries";
  static const String CREATE_TABLE =
      " CREATE TABLE IF NOT EXISTS $TABLE_NAME ( id INTEGER PRIMARY KEY AUTOINCREMENT, NAME TEXT ) ";
  static const String SELECT = "select * from $TABLE_NAME";
}

class Country {
  int id;
  String name;

  Country({required this.id, required this.name});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
      id: json['id'],
      name: json['NAME'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['NAME'] = name;
    return data;
  }
}
