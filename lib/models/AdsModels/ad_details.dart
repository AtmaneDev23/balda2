import 'package:balda2/models/AdsModels/photo.dart';
import 'package:balda2/models/AuthModels/user.dart';

import '../PublicModels/category.dart';
import '../PublicModels/city.dart';
import '../PublicModels/sub_catergory.dart';

class AdDetails {
  int id;
  User user;
  City city;
  Category category;
  SubCategory subCategory;
  String title;
  String details;
  String price;
  String status;
  String endAt;
  List<Photo> photos;
  String isFavorite;
  String rate;
  String createdAt;

  AdDetails({
    required this.id,
    required this.user,
    required this.city,
    required this.category,
    required this.subCategory,
    required this.title,
    required this.details,
    required this.price,
    required this.status,
    required this.endAt,
    required this.photos,
    required this.isFavorite,
    required this.rate,
    required this.createdAt,
  });

  factory AdDetails.fromJson(Map<String, dynamic> json) => AdDetails(
        id: json["id"],
        user: User.fromJson(json["user"]),
        city: City.fromJson(json["city"]),
        category: Category.fromJson(json["category"]),
        subCategory: SubCategory.fromJson(json["sub_category"]),
        title: json["title"],
        details: json["details"],
        price: json["price"].toString(),
        status: json["status"],
        endAt: json["end_at"],
        photos: (json['photos'] as List).map((x) => Photo.fromJson(x)).toList(),
        isFavorite: json["is_favorite"].toString(),
        rate: json["rate"].toString(),
        createdAt: json["created_at"],
      );
}
