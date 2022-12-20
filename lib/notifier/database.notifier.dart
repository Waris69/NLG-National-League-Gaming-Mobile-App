import 'package:flutter/cupertino.dart';
import 'package:nlg_mobile_application/models/announcement_model.dart';
import 'package:nlg_mobile_application/models/quest_model.dart';
import 'package:nlg_mobile_application/service/database.service.dart';

class DatabaseNotifier extends ChangeNotifier {
  final DatabaseService databaseService = DatabaseService();

  // ! Fetching Announcements
  Future getAnnouncements() async {
    List data = await databaseService.getAnnouncements();
    return data
        .map((announcement) => Announcement.fromJson(announcement))
        .toList();
  }

  // ! Fetching Daily Health Quest
  Future getDailyHealthQuest() async {
    List data = await databaseService.getDailyHealthQuest();
    return data.map((questElement) => Quest.fromJson(questElement)).toList();
  }
}
