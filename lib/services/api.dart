import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:poll_app/models/create_poll.dart';
import 'package:poll_app/models/poll.dart';

class Api {
  static Future<Dio> dioAuth() async {
    BaseOptions options = BaseOptions(
      baseUrl: "http://192.168.1.108",
      // headers: {"Accept": "application/json"},
      responseType: ResponseType.json,
    );
    return Dio(options);
  }

  static Future<List<PollModel>?> getAllPoll() async {
    try {
      Dio dio = await Api.dioAuth();
      Response response = await dio.get("/poll/all");

      if (response.statusCode == 200) {
        List<dynamic> items = response.data;
        return items.map((e) => PollModel.fromMap(e)).toList();
      }

      return null;
    } on DioError {
      return null;
    }
  }

  static Future<PollModel?> addPoll(CreatePoll poll) async {
    try {
      Dio dio = await Api.dioAuth();
      Response response = await dio.post("/poll", data: poll.toMap());

      if (response.statusCode == 200) {
        return PollModel.fromMap(response.data);
      }

      return null;
    } on DioError catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<PollModel?> getPoll(int id) async {
    try {
      Dio dio = await Api.dioAuth();
      Response response = await dio.get("/poll", queryParameters: {"id": id});

      if (response.statusCode == 200) {
        return PollModel.fromMap(response.data);
      }

      return null;
    } on DioError catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }

  static Future<List<int>?> patchVotes(int id, int index) async {
    try {
      Dio dio = await Api.dioAuth();
      Response response = await dio.patch("/poll?id=$id&index=$index");

      if (response.statusCode == 200) {
        List<dynamic> items = response.data;

        return items.map((e) => e as int).toList();
      }

      return null;
    } on DioError catch (e) {
      debugPrint(e.toString());
      return null;
    }
  }
}
