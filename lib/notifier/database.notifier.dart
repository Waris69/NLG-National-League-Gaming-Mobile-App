import 'package:flutter/cupertino.dart';
import 'package:nlg_mobile_application/models/quest_model.dart';
import 'package:nlg_mobile_application/service/database.service.dart';

class DatabaseNotifier extends ChangeNotifier {
  final DatabaseService databaseService = DatabaseService();

  // ! Fetching Announcements
  Future getAnnouncements() async {
    await databaseService.getAnnouncements();
  }

  // ! Fetching Daily Health Quest
  Future getDailyHealthQuest() async {
    List data = await databaseService.getDailyHealthQuest();
    return data.map((questElement) => Quest.fromJson(questElement)).toList();
  }
}
