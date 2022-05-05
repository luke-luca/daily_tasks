import 'package:flutter/material.dart';
import '../../Timer/timerscreen.dart';

class DashboardTile extends StatelessWidget {
  const DashboardTile({
    Key? key,
    required this.editingMode,
    required this.textTaskName,
    required this.textTaskDescription,
    required this.textTaskCategory,
    required this.textTaskMinutes,
    required this.textTaskSeconds,
  }) : super(key: key);

  final bool editingMode;
  final String textTaskName;
  final String textTaskDescription;
  final String textTaskCategory;
  final String textTaskMinutes;
  final String textTaskSeconds;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const TimerScreen()));
      },
      child: GridTile(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 10,
                      blurRadius: 5,
                      offset: Offset(0, 7),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      children: [
                        Text(
                          textTaskName,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          textTaskDescription,
                        ),
                        Text(
                          textTaskCategory,
                        ),
                        Text(textTaskMinutes + ":" + textTaskSeconds),
                      ],
                    ),
                  ),
                )),
            if (editingMode)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.black87,
                  onPressed: () {},
                ),
              ),
          ],
        ),
      ),
    );
  }
}
