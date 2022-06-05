import 'dart:developer';
import 'package:balda2/constants.dart';
import 'package:balda2/models/AdsModels/ad.dart';
import 'package:balda2/models/AdsModels/ad_details.dart';
import 'package:balda2/models/AdsModels/paid_ad.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class AdsController with ChangeNotifier {
  ////////////////////////////ads///////////////////////////
  static Future<List<Ad>> getAds(String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}get_ads",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['data'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        print("number of ads${ads.length}");
        return ads;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  ////////////////////////////adDetails///////////////////////////
  static Future<AdDetails> getAdDetails(int id, String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}ad_details/$id",
      );
      log(response.data["data"].toString());
      AdDetails adDetails;
      adDetails = AdDetails.fromJson(response.data["data"]["ad"]);
      return adDetails;
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////similar_ads///////////////////////////
  static Future<List<Ad>> getSimilarAds(int id, String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}ad_details/$id",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> similarAds = [];
        similarAds = (response.data['data']['similar_ads'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        print("number of Similar Ads${similarAds.length}");
        return similarAds;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  ////////////////////////////_activeAds///////////////////////////
  static Future<List<Ad>> gatActiveAds(String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}my_ads",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['active_ads'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        print("number of active ads${ads.length}");
        return ads;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  ////////////////////////////finished ads///////////////////////////
  static Future<List<Ad>> getFinishedAds(String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}my_ads",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['finished_ads'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        print("number of finished ads${ads.length}");
        return ads;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  ////////////////////////////re_publish-ad///////////////////////////
  static Future rePublishAds(int id, String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}re_publish_ad/$id",
      );
      log(response.data["data"].toString());
      return response.data["data"]["message"] ??
          response.data["error"]["message"];
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////delete-ad///////////////////////////
  static Future deleteAd(int id, String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}delete_ad/$id",
      );
      log(response.data["data"].toString());
      return response.data["data"]["message"] ??
          response.data["error"]["message"];
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////delete-ad_photo///////////////////////////
  static Future deleteAdPhoto(int id, String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}delete_ad_photo/$id",
      );
      log(response.data["data"].toString());
      return response.data["data"]["message"] ??
          response.data["error"]["message"];
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////special gelleries///////////////////////////
  static Future<List<Ad>> getSpecailGaleries(String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}special_galleries",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['data'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        print("number of special galleries${ads.length}");
        return ads;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  ////////////////////////////favorite ads///////////////////////////
  static Future<List<Ad>> getFavoriteAds(String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}my_favorite_ads",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['data'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        print("number of favorite ads${ads.length}");
        return ads;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  ////////////////////////////add_ad_to_favorite///////////////////////////
  static Future addAdToFavorite(int id, String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}add_ad_to_favorite/$id",
      );
      log(response.data["data"].toString());
      return response.data["data"]["message"] ??
          response.data["error"]["message"];
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////Paid ads///////////////////////////
  static Future<List<PaidAd>> getPaidAds(String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";
      var response = await dio.get(
        "${baseUrl}paid_ads",
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<PaidAd> paidAds = [];
        paidAds = (response.data['data'] as List)
            .map((x) => PaidAd.fromJson(x))
            .toList();
        print("number of paid Ads ${paidAds.length}");
        return paidAds;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  ////////////////////////////reate_ad///////////////////////////
  static Future rateAd(int id, String rate, String token) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";

      var response = await dio
          .post("${baseUrl}rate_ad", data: {"ad_id": id, "rate": rate});

      log(response.data["data"].toString());
      return response.data["data"]["message"] ??
          response.data["error"]["message"];
    } catch (e) {
      return throw Exception(e);
    }
  }

  ////////////////////////////As search///////////////////////////
  static Future<List<Ad>> searhAd(String token, String keySearch) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";

      var response = await dio.post(
        "${baseUrl}ads_search",
        data: {
          "search_key": keySearch,
        },
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['data'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        print("number of ads${ads.length}");
        return ads;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  ////////////////////////////Ads filter///////////////////////////
  static Future<List<Ad>> adsFilter(
    String token,
    String cityID,
    String categoryId,
    String subCategoryID,
  ) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";

      var response = await dio.post(
        "${baseUrl}ads_filter",
        data: {
          if (cityID != "0") "city_id": cityID,
          if (categoryId != "0") "category_id": categoryId,
          if (subCategoryID != "0") "sub_category_id": subCategoryID,
        },
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['data'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        print("number of ads${ads.length}");
        return ads;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }

  ////////////////////////////ads_category_filter///////////////////////////
  static Future<List<Ad>> adCategoryFilter({
    required String token,
    required String categoryId,
    required String subCategoryID,
  }) async {
    try {
      Dio dio = Dio();
      dio.options.headers["Authorization"] = "Bearer $token";

      var response = await dio.post(
        "${baseUrl}ads_category_filter",
        data: {
          if (categoryId != "0") "category_id": categoryId,
          if (subCategoryID != "0") "sub_category_id": subCategoryID,
        },
      );
      log(response.toString());
      if (response.statusCode == 200) {
        List<Ad> ads = [];
        ads = (response.data['data']['data'] as List)
            .map((x) => Ad.fromJson(x))
            .toList();
        print("number of ads${ads.length}");
        return ads;
      } else {
        return [];
      }
    } catch (e) {
      print(e);
      return [];
    }
  }
}
