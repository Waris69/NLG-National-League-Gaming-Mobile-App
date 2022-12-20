import 'dart:convert';

List<Quest> questFromJson(String str) =>
    List<Quest>.from(json.decode(str).map((x) => Quest.fromJson(x)));

String questToJson(List<Quest> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Quest {
  Quest(
    this.id,
    this.category,
    this.picture,
    this.createdAt,
    this.day,
  );

  String id;
  String category;
  String picture;
  DateTime createdAt;
  String day;

  factory Quest.fromJson(Map<String, dynamic> json) => Quest(
        json["id"].toString(),
        json["category"],
        json["picture"],
        DateTime.parse(json["created_at"]),
        json["day"].toString(),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "picture": picture,
        "created_at": createdAt.toIso8601String(),
        "day": day,
      };
}
