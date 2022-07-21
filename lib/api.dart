import 'dart:async';

import 'package:dio/dio.dart';

class Api {
  Dio dio = Dio();

  Future<List<ApiModel>> fetchData() async {
    try {
      final response =
          await dio.get("https://jsonplaceholder.typicode.com/todos/");
      List datas = response.data;
      List<ApiModel> apiModelList =
          datas.map((e) => ApiModel.fromJson(e)).toList();
      return apiModelList;
    } catch (e) {
      rethrow;
    }
  }
}

class ApiModel {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  const ApiModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed,
  });

  factory ApiModel.fromJson(Map json) {
    return ApiModel(
      userId: json["userId"],
      id: json["id"],
      title: json["title"],
      completed: json["completed"],
    );
  }
}
