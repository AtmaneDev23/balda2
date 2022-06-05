import 'dart:developer';
import 'package:balda2/constants.dart';
import 'package:balda2/models/PublicModels/sub_catergory.dart';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../models/PublicModels/bank.dart';
import '../models/PublicModels/category.dart';
import '../models/PublicModels/city.dart';
import '../models/PublicModels/settings.dart';

class PublicContoller with ChangeNotifier {
  ////////////////////////////categories///////////////////////////
  static Future<List<Category>> getCategoties() async {
    Map<String, String> headers = {
      'Accept': 'application/json',
    };
    try {
      // http.Response response =
      //     await http.get(Uri.parse(baseUrl + 'categories'), headers: headers);
      // log(response.body);
      //final Map<String, dynamic> responseData = json.decode(response.data);
      // if (response.statusCode == 200) {
      //   List<Category> _categories = [];
      //   for (var i = 0; i < responseData['data'].length; i++) {
      //     _categories.add(Category.fromMap(responseData['data'][i]));
      //   }
      // print("length of categoies" + _categories.length.toString());
      // return _categories;

      Dio dio = Dio();
      //dio.options.headers['Accept'] = 'application/json';
      var response = await dio.get(
        "${baseUrl}categories",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Category> categories = [];
        categories = (response.data['data'] as List)
            .map((x) => Category.fromJson(x))
            .toList();
        print("number of categoies" + categories.length.toString());
        return categories;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  ////////////////////////////Settings///////////////////////////
  static Future<Settings> getSettings() async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        "${baseUrl}settings",
      );
      log(response.data["data"].toString());
      Settings settings;
      settings = Settings.fromJson(response.data["data"]);
      return settings;
    } catch (e) {
      return throw Exception(e);
    }
  }

////////////////////////////Banks///////////////////////////
  static Future<List<Bank>> getBanks() async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        "${baseUrl}banks",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Bank> banks = [];
        banks = (response.data['data'] as List)
            .map((x) => Bank.fromJson(x))
            .toList();
        print("number of banks" + banks.length.toString());
        return banks;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  ////////////////////////////Citys///////////////////////////
  static Future<List<City>> getCities() async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        "${baseUrl}cities",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<City> cities = [];
        cities = (response.data['data'] as List)
            .map((x) => City.fromJson(x))
            .toList();
        print("number of citys" + cities.length.toString());
        return cities;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }

  ////////////////////////////Sub_Categories///////////////////////////
  static Future<List<SubCategory>> getSubCategories(int catID) async {
    try {
      Dio dio = Dio();
      var response = await dio.get(
        "${baseUrl}sub_categories/$catID",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<SubCategory> subCatrgories = [];
        subCatrgories = (response.data['data'] as List)
            .map((x) => SubCategory.fromJson(x))
            .toList();
        print("number of sub_catrgories" + subCatrgories.length.toString());
        return subCatrgories;
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
