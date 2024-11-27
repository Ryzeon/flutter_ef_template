
import 'package:flutter/material.dart';
import 'package:flutter_ef_template/feature/heroes/domain/heroe.dart';
@immutable
class HeroeDto {
  final String? id;

  final String? name;

  final String? gender;

  final String? intelligence;

  final String? image;

  const HeroeDto(
      {this.id, this.name, this.gender, this.intelligence, this.image});

  factory HeroeDto.fromJson(Map<String, dynamic> json) {
    return HeroeDto(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      gender: json['appearance']['gender'] ?? '',
      intelligence: json['powerstats']['intelligence'] ?? '',
      image: json['image']['url'] ?? '',
    );
  }
}

extension HeroDtoToDomain on HeroeDto {
  Heroe toDomain() {
    return Heroe(
      id: id ?? "",
      name: name ?? "",
      gender: gender ?? "",
      intelligence: intelligence ?? "",
      image: image ?? "",
    );
  }
}
