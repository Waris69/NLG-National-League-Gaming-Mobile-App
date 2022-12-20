import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:nlg_mobile_application/components/announcement_component.dart';
import 'package:provider/provider.dart';

import '../components/side_bar.dart';
import '../models/announcement_model.dart';
import '../notifier/database.notifier.dart';
import '../utils/custom_bottom_navigation_bar.dart';

class AnnouncementPage extends StatefulWidget {
  const AnnouncementPage({super.key});

  @override
  State<AnnouncementPage> createState() => _AnnouncementPageState();
}

class _AnnouncementPageState extends State<AnnouncementPage> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    final DatabaseNotifier databaseNotifier =
        Provider.of<DatabaseNotifier>(context, listen: false);
    return Scaffold(
      key: _globalKey,
      extendBody: true,
      backgroundColor: const Color(0xff020523),
      bottomNavigationBar: CustomBottomBar(globalKey: _globalKey),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width,
        backgroundColor: const Color(0xff000423),
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitWidth,
              image: AssetImage('assets/images/sideMenuImage.png'),
            ),
          ),
          child: const SideMenuBar(),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0, left: 25.0),
              child: Image.asset(
                'assets/images/logo.png',
                width: MediaQuery.of(context).size.width * 0.75,
              ),
            ),
            Expanded(
              // height: 500,
              child: FutureBuilder<void>(
                future: databaseNotifier.getAnnouncements(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.none) {
                    return const SpinKitRing(
                      lineWidth: 5,
                      color: Color(0xffB00B0E),
                      size: 70.0,
                    );
                  }
                  if (snapshot.hasData) {
                    List _snapshot = snapshot.data as List;
                    return ListView.builder(
                      itemCount: _snapshot.length,
                      itemBuilder: (context, index) {
                        Announcement announcement = _snapshot[index];
                        return AnnouncementCard(
                          announcementCardimg: 'announcementCardKeyboard',
                          text: announcement.title,
                          description: announcement.description,
                          icon: 'cupicon',
                          showDescription: true,
                        );
                      },
                    );
                  }
                  return const SpinKitRing(
                    lineWidth: 5,
                    color: Color(0xffB00B0E),
                    size: 70.0,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
