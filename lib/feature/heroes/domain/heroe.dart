class Heroe {
  String id;
  String name;
  String gender;
  String intelligence;
  String image;

  Heroe(
      {required this.id,
      required this.name,
      required this.gender,
      required this.intelligence,
      required this.image});

  factory Heroe.fromMap(Map<String, dynamic> map) {
    return Heroe(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      gender: map['gender'] ?? '',
      intelligence: map['intelligence'] ?? '',
      image: map['image'] ?? '',
    );
  }
}

extension HeroeMapper on Heroe {
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'gender': gender,
      'intelligence': intelligence,
      'image': image,
    };
  }
}
