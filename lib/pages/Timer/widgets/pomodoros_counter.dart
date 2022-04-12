import 'package:flutter/material.dart';

class CheckRow extends StatelessWidget {
  const CheckRow({
    Key? key,
    this.isDone = false,
  }) : super(key: key);

  final bool isDone;

  BoxDecoration buildBox() {
    if (isDone) {
      return const BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.orange,
      );
    }
    return buildBox();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 200,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Visibility(
                  visible: isDone,
                  child: const Icon(Icons.check),
                ),
              ),
            ),
            const Expanded(child: Divider(color: Colors.black)),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.check),
              ),
            ),
            const Expanded(child: Divider(color: Colors.black)),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.check),
              ),
            ),
            const Expanded(child: Divider(color: Colors.black)),
            Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.orange,
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(Icons.check),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
