import 'package:daily_tasks/pages/Achievements/achievements.dart';
import 'package:daily_tasks/pages/Dashboard/widgets/addtask.dart';
import 'pages/Calendar/calendar.dart';
import 'pages/Dashboard/dashboard.dart';
import 'pages/Settings/settings.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentTab = 0;
  final List<Widget> screens = [
    const Dashboard(),
    const Calendar(),
    const Achievements(),
    const Settings(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const Dashboard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) => const AddTask(),
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 2,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 255, 255, 255),
                      elevation: 0,
                    ),
                    onPressed: () {
                      setState(() {
                        currentScreen = const Dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_sharp,
                            color: currentTab == 0
                                ? const Color.fromARGB(255, 255, 156, 111)
                                : Colors.black,
                            size: 36,
                          ),
                        ]),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 255, 255, 255),
                      elevation: 0,
                    ),
                    onPressed: () {
                      setState(() {
                        currentScreen = const Calendar();
                        currentTab = 1;
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.calendar_month_sharp,
                            color: currentTab == 1
                                ? const Color.fromARGB(255, 255, 156, 111)
                                : Colors.black,
                            size: 36,
                          ),
                        ]),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 255, 255, 255),
                      elevation: 0,

                      // background
                    ),
                    onPressed: () {
                      setState(() {
                        currentScreen = const Achievements();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.emoji_events_sharp,
                            color: currentTab == 2
                                ? const Color.fromARGB(255, 255, 156, 111)
                                : Colors.black,
                            size: 36,
                          ),
                        ]),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 255, 255, 255),
                      elevation: 0,
                    ),
                    onPressed: () {
                      setState(() {
                        currentScreen = const Settings();
                        currentTab = 3;
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.settings_sharp,
                            color: currentTab == 3
                                ? const Color.fromARGB(255, 255, 156, 111)
                                : Colors.black,
                            size: 36,
                          ),
                        ]),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
