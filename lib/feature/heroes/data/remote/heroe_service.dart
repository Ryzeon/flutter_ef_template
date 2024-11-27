import 'dart:convert';
import 'dart:io';

import 'package:flutter_ef_template/core/app_constants.dart';
import 'package:flutter_ef_template/core/resource.dart';
import 'package:flutter_ef_template/feature/heroes/data/remote/heroe_dto.dart';

import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class HeroeService {
  final Logger logger = Logger();

  Future<Resource<List<HeroeDto>>> searchHeroe(String name) async {
    logger.i(
        '${AppConstants.baseUrl}/${AppConstants.apiKey}${AppConstants.searchEndPoint}/$name');
    try {
      final response = await http.get(
        Uri.parse(
            '${AppConstants.baseUrl}/${AppConstants.apiKey}${AppConstants.searchEndPoint}/$name'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        final json = jsonDecode(response.body);
        final responseMessage = json['response'];
        if (responseMessage == 'error') {
          return Error(json['error']);
        }
        List results = json['results'];
       final List<HeroeDto> heroesDto =
            results.map((json) => HeroeDto.fromJson(json)).toList();
        return Success(heroesDto);
      } else {
        logger.e('Error on searchHeroe: ${response.statusCode}');
        return Error('Error on searchHeroe: ${response.statusCode}');
      }
    } catch (e) {
      return Error('Something went wrong');
    }
  }

  Future<Resource<HeroeDto>> getHeroe(String id) async {
    try {
      http.Response response = await http.get(
        Uri.parse('${AppConstants.baseUrl}/${AppConstants.apiKey}/id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );
      if (response.statusCode == HttpStatus.ok) {
        final json = jsonDecode(response.body);
        final heroeDto = HeroeDto.fromJson(json);
        return Success(heroeDto);
      } else {
        return Error('Error on searchHeroe: ${response.statusCode}');
      }
    } catch (e) {
      return Error('Error on searchHore: ${e.toString()}');
    }
  }
}
