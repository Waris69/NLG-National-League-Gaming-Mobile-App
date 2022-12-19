import 'package:flutter/cupertino.dart';
import 'package:nlg_mobile_application/service/database.service.dart';

class DatabaseNotifier extends ChangeNotifier {
  final DatabaseService databaseService = DatabaseService();

  // ! Fetching data
  Future getAnnouncements() async {
    await databaseService.getAnnouncements();
  }
}
