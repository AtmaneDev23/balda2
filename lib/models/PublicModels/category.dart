class Category {
  int id;
  String name;
  String cratedAt;

  Category({
    required this.id,
    required this.name,
    required this.cratedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'],
        name: json['name'],
        cratedAt: json['created_at'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "created_at": cratedAt,
      };
}
