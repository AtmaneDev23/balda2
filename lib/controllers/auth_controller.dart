import 'dart:developer';
import 'package:balda2/constants.dart';
import 'package:balda2/models/AuthModels/user.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController with ChangeNotifier {
  ////////////////////////////getUserData///////////////////////////
  static Future<User> getUserData(String userID) async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        "${baseUrl}user_data/$userID",
      );
      log(response.data["data"].toString());
      User user;
      user = User.fromJson(response.data["data"]);
      return user;
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////change phone number///////////////////////////
  static Future changePhoneNumber(
      {required String token, required String phoneNumber}) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.post(
        "${baseUrl}change_phone_number",
        data: {'phone_number': phoneNumber},
      );
      log(response.data["data"].toString());
      User user;
      user = User.fromJson(response.data["data"]);
      return user;
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////change password///////////////////////////
  static Future changePassword(
      {required String token,
      required String currentPass,
      required String newPass}) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.post(
        "${baseUrl}change_password",
        data: {
          'current_password': currentPass,
          'new_password': newPass,
          'password_confirmation': newPass,
        },
      );
      log(response.data["data"].toString());

      return response.data;
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////Login///////////////////////////
  static Future login({
    required String phoneNumber,
    required String password,
  }) async {
    try {
      Dio dio = Dio();
      var response = await dio.post(
        "${baseUrl}login",
        data: {
          'phone_number': phoneNumber,
          'password': password,
          'device_token': '0000000000',
        },
      );
      log(response.data["data"].toString());

      if (response.statusCode == 200) {
        User user;
        user = User.fromJson(response.data["data"]);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('id', user.id);
        prefs.setString('firstName', user.firstName);
        prefs.setString('lastName', user.lastName);
        prefs.setString('phone_number', user.phoneNumber);
        prefs.setString('api_token', user.apiToken);
        prefs.setString('active', user.active);
        prefs.setString('upgrade', user.upgrade);
        prefs.setString('photo', user.photo);
        prefs.setString('crated_at', user.createdAt);
        return user;
      }
    } on DioError catch (error) {
      var statusCode = error.response?.statusCode;
      print(statusCode);
      return error.response?.data['errors'][0]['value'].toString();
    }
  }

  ////////////////////////////LogOut///////////////////////////
  static Future logout(
      {required String token, required String deviceToken}) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.post(
        "${baseUrl}logout",
        data: {
          'device_token': deviceToken,
        },
      );
      log(response.data.toString());
      print(response.statusCode);
      if (response.statusCode == 200) {
        final prefs = await SharedPreferences.getInstance();
        prefs.clear();
      }
    } on DioError catch (error) {
      log(error.response!.data.toString());
    }
  }

  ////////////////////////////Register///////////////////////////
  static Future register(
      {required String deviceToken,
      required String phoneNumber,
      required String firstName,
      required String lastName,
      required String password}) async {
    try {
      Dio dio = Dio();
      var response = await dio.post(
        "${baseUrl}register",
        data: {
          'phone_number': phoneNumber,
          'firstName': firstName,
          'lastName': lastName,
          'password': password,
          'password_confirmation': password,
          'device_token': deviceToken,
        },
      );
      log(response.data["data"].toString());

      if (response.statusCode == 200) {
        User user;
        user = User.fromJson(response.data["data"]);
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('id', user.id);
        prefs.setString('firstName', user.firstName);
        prefs.setString('lastName', user.lastName);
        prefs.setString('phone_number', user.phoneNumber);
        prefs.setString('api_token', user.apiToken);
        prefs.setString('active', user.active);
        prefs.setString('upgrade', user.upgrade);
        prefs.setString('photo', user.photo);
        prefs.setString('crated_at', user.createdAt);
        return user;
      }
    } on DioError catch (error) {
      var statusCode = error.response?.statusCode;
      print(statusCode);
      return error.response?.data['errors'][0]['value'].toString();
    }
  }
}
