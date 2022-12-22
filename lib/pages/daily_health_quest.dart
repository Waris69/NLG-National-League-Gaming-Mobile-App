import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';
import 'package:nlg_mobile_application/components/page_header.dart';
import 'package:nlg_mobile_application/homePage.dart';
import 'package:nlg_mobile_application/models/checkbox_state.dart';
import 'package:nlg_mobile_application/models/quest_model.dart';
import 'package:nlg_mobile_application/utils/custom_bottom_navigation_bar.dart';
import 'package:provider/provider.dart';
import '../components/side_bar.dart';
import '../notifier/database.notifier.dart';

class DailyHealthQuest extends StatefulWidget {
  DailyHealthQuest({super.key});

  @override
  State<DailyHealthQuest> createState() => _DailyHealthQuestState();
}

class _DailyHealthQuestState extends State<DailyHealthQuest> {
  GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  final messages = [
    // CheckBoxState(title: 'Eat Healthy Meals With Proper Portions.'),
    // CheckBoxState(title: 'Exercise 45-60 minutes'),
    // CheckBoxState(title: 'Exercise 45-60 minutes'),
    // CheckBoxState(title: 'Hydrate a oz. of water per your bodyweight'),
    // CheckBoxState(title: 'Get outside in the sun for 20 minutes.'),
    // CheckBoxState(title: 'Sleep 7-8 hours'),
    // CheckBoxState(title: 'Socialize with friends in person'),
    // CheckBoxState(title: 'Lorem Ipsum is simply dummy text of the'),
    // CheckBoxState(title: 'Lorem Ipsum is simply dummy text of the'),
    // CheckBoxState(title: 'Lorem Ipsum is simply dummy text of the'),
  ];

  @override
  Widget build(BuildContext context) {
    final DatabaseNotifier databaseNotifier =
        Provider.of<DatabaseNotifier>(context, listen: false);

    return Scaffold(
      key: _globalKey,
      backgroundColor: const Color(0xff020523),
      bottomNavigationBar: CustomBottomBar(globalKey: _globalKey),
      drawer: Drawer(
        width: MediaQuery.of(context).size.width,
        backgroundColor: const Color(0xff000423),
        child:
            // const SideMenuBar(),
            Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/images/sidebarBackground.png'),
            ),
          ),
          child: const SideMenuBar(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            PageHeader(
              child: Text(
                'Daily Health Quest',
                style: GoogleFonts.raleway(
                  fontSize: 22,
                  fontWeight: FontWeight.w800,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: FutureBuilder<void>(
                future: databaseNotifier.getDailyHealthQuest(),
                builder: (context, snapshot) {
                  // if (snapshot.connectionState == ConnectionState.none) {
                  //   return const SpinKitRing(
                  //     lineWidth: 5,
                  //     color: Color(0xffB00B0E),
                  //     size: 70.0,
                  //   );
                  // }
                  if (snapshot.hasData) {
                    List _snapshot = snapshot.data as List;
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: _snapshot.length,
                      itemBuilder: (context, index) {
                        Quest quest = _snapshot[index];
                        messages.add(CheckBoxState(title: quest.category));
                        return buileSingleCheckBox(messages[index]);
                      },
                    );
                  }
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          'assets/icons/serverErrorIcon.png',
                          width: MediaQuery.of(context).size.width * 0.5,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text(
                          'No data to show',
                          style: GoogleFonts.poppins(
                            letterSpacing: 2,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buileSingleCheckBox(CheckBoxState checkBox) => CheckboxListTile(
        activeColor: const Color(0xff15EC1E),
        controlAffinity: ListTileControlAffinity.leading,
        title: Text(
          checkBox.title,
          style: GoogleFonts.roboto(
            decoration: (checkBox.value)
                ? TextDecoration.lineThrough
                : TextDecoration.none,
            // decorationColor: Colors.white,
            // decorationThickness: 1.8,
            fontSize: 12,
            color: Colors.white,
          ),
        ),
        value: checkBox.value,
        onChanged: (value) {
          setState(() {
            checkBox.value = value!;
          });
        },
      );
}
