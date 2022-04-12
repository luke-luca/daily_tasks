import 'package:flutter/material.dart';

class DashboardTile extends StatelessWidget {
  const DashboardTile({
    Key? key,
    required this.editingMode,
    required this.text,
  }) : super(key: key);

  final bool editingMode;
  final String text;

  @override
  Widget build(BuildContext context) {
    return GridTile(
      child: Center(
        child: Stack(
          fit: StackFit.expand,
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              width: 150,
              height: 50,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(text),
              ),
            ),
            if (editingMode)
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  icon: const Icon(Icons.delete),
                  color: Colors.black87,
                  onPressed: _delete,
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _delete() {
    // ...
  }
}
