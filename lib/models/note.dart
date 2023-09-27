class Notes {
  int? id;
  String? judul;
  String? isi;

  Notes({this.id, this.judul, this.isi});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{};

    if (id != null) {
      map['id'] = id;
    }
    map['judul'] = judul;
    map['isi'] = isi;
    return map;
  }

  Notes.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    judul = map['judul'];
    isi = map['isi'];
  }
}
