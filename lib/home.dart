import 'pages/Achivments/achivments.dart';
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
    Dashboard(),
    const Calendar(),
    const Achivments(),
    const Settings(),
  ];

  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = Dashboard();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageStorage(
        child: currentScreen,
        bucket: bucket,
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
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
                        currentScreen = Dashboard();
                        currentTab = 0;
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home_sharp,
                            color: currentTab == 0
                                ? Colors.deepOrange
                                : Colors.grey,
                            size: 32,
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
                                ? Colors.deepOrange
                                : Colors.grey,
                            size: 32,
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
                        currentScreen = const Achivments();
                        currentTab = 2;
                      });
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.emoji_events_sharp,
                            color: currentTab == 2
                                ? Colors.deepOrange
                                : Colors.grey,
                            size: 32,
                          ),
                        ]),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 255, 255, 255),
                      elevation: 0,

                      // background
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
                                ? Colors.deepOrange
                                : Colors.grey,
                            size: 32,
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
