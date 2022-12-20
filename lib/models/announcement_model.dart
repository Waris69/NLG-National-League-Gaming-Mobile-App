import 'dart:convert';

List<Announcement> announcementFromJson(String str) => List<Announcement>.from(
    json.decode(str).map((x) => Announcement.fromJson(x)));

String announcementToJson(List<Announcement> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Announcement {
  Announcement(
    this.id,
    this.title,
    this.description,
    this.image,
    this.icon,
    this.createdAt,
  );

  String id;
  String title;
  String description;
  String image;
  String icon;
  DateTime createdAt;

  factory Announcement.fromJson(Map<String, dynamic> json) => Announcement(
        json["id"].toString(),
        json["title"],
        json["description"],
        json["image"],
        json["icon"],
        DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "image": image,
        "icon": icon,
        "created_at": createdAt.toIso8601String(),
      };
}
