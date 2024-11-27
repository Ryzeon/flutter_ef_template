import 'package:flutter_ef_template/core/resource.dart';
import 'package:flutter_ef_template/feature/heroes/data/local/heroe_dao.dart';
import 'package:flutter_ef_template/feature/heroes/data/remote/heroe_dto.dart';
import 'package:flutter_ef_template/feature/heroes/data/remote/heroe_service.dart';
import 'package:flutter_ef_template/feature/heroes/domain/heroe.dart';

class HeroeRepository {
  Future<List<Heroe>> searchHeroes({String name = ""}) async {
    Resource<List<HeroeDto>> response = await HeroeService().searchHeroe(name);
    if (response is Success) {
      return response.data!.map((e) => e.toDomain()).toList();
    } else {
      throw Exception((response as Error).message);
    }
  }

  Future<Heroe> getHeroeById(String id) async {
    Resource<HeroeDto> response = await HeroeService().getHeroe(id);
    if (response is Success) {
      return response.data!.toDomain();
    } else {
      throw Exception((response as Error).message);
    }
  }

  Future<List<Heroe>> getAll() async {
    return HeroeDao().getAll();
  }
}
