import 'package:daily_tasks/styles.dart';
import 'package:flutter/material.dart';

class Achievements extends StatefulWidget {
  const Achievements({Key? key}) : super(key: key);

  @override
  State<Achievements> createState() => _AchievementsState();
}

class _AchievementsState extends State<Achievements> {
  late List<Achievement> achievementsList = [
    Achievement(
      isUnlocked: true,
      iconType: 0xe04a,
      title: 'Worker',
      description: 'Work Streak of 7 days',
    ),
    Achievement(
      isUnlocked: true,
      iconType: 0xe04c,
      title: 'Worker',
      description: 'Work Streak of 14 days',
    ),
    Achievement(
      isUnlocked: false,
      iconType: 0xe04b,
      title: 'Worker',
      description: 'Work Streak of 21 days',
    ),
    Achievement(
      isUnlocked: true,
      iconType: 0xe04a,
      title: 'Worker',
      description: 'Work Streak of 7 days',
    ),
    Achievement(
      isUnlocked: true,
      iconType: 0xe04c,
      title: 'Worker',
      description: 'Work Streak of 14 days',
    ),
    Achievement(
      isUnlocked: false,
      iconType: 0xe04b,
      title: 'Worker',
      description: 'Work Streak of 21 days',
    ),
    Achievement(
      isUnlocked: true,
      iconType: 0xe04a,
      title: 'Worker',
      description: 'Work Streak of 7 days',
    ),
    Achievement(
      isUnlocked: true,
      iconType: 0xe04c,
      title: 'Worker',
      description: 'Work Streak of 14 days',
    ),
    Achievement(
      isUnlocked: false,
      iconType: 0xe04b,
      title: 'Worker',
      description: 'Work Streak of 21 days',
    ),
    Achievement(
      isUnlocked: true,
      iconType: 0xe04a,
      title: 'Worker',
      description: 'Work Streak of 7 days',
    ),
    Achievement(
      isUnlocked: true,
      iconType: 0xe04c,
      title: 'Worker',
      description: 'Work Streak of 14 days',
    ),
    Achievement(
      isUnlocked: false,
      iconType: 0xe04b,
      title: 'Worker',
      description: 'Work Streak of 21 days',
    ),
    Achievement(
      isUnlocked: true,
      iconType: 0xe04a,
      title: 'Worker',
      description: 'Work Streak of 7 days',
    ),
    Achievement(
      isUnlocked: true,
      iconType: 0xe04c,
      title: 'Worker',
      description: 'Work Streak of 14 days',
    ),
    Achievement(
      isUnlocked: false,
      iconType: 0xe04b,
      title: 'Worker',
      description: 'Work Streak of 21 days',
    ),
    Achievement(
      isUnlocked: true,
      iconType: 0xe04a,
      title: 'Worker',
      description: 'Work Streak of 7 days',
    ),
    Achievement(
      isUnlocked: true,
      iconType: 0xe04c,
      title: 'Worker',
      description: 'Work Streak of 14 days',
    ),
    Achievement(
      isUnlocked: false,
      iconType: 0xe04b,
      title: 'Worker',
      description: 'Work Streak of 21 days',
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          Text('Achievements', style: CustomStyles.h1),
          FutureBuilder(
            future: Future.delayed(const Duration(seconds: 1), () {
              return achievementsList;
            }),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Expanded(
                  child: GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 190,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: achievementsList.length,
                    itemBuilder: (context, index) {
                      return AchievementTile(
                        isUnlocked: achievementsList[index].isUnlocked,
                        iconType: achievementsList[index].iconType,
                        title: achievementsList[index].title,
                        description: achievementsList[index].description,
                      );
                    },
                  ),
                );
              } else {
                return const Center(
                  child: const CircularProgressIndicator(),
                );
              }
            },
          ),
        ]),
      ),
    );
  }

  Widget AchievementTile(
      {required bool isUnlocked,
      required int iconType,
      required String title,
      required String description}) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: isUnlocked ? Colors.green : Colors.red,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(IconData(iconType)),
          Text(title, style: CustomStyles.h3),
          Text(
            description,
            style: CustomStyles.paragraph,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class Achievement {
  final bool isUnlocked;
  final int iconType;
  final String title;
  final String description;

  Achievement({
    required this.isUnlocked,
    required this.iconType,
    required this.title,
    required this.description,
  });
}
