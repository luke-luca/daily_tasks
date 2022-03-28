import 'package:flutter/material.dart';

class ImageHolder extends StatefulWidget {
  const ImageHolder({Key? key}) : super(key: key);

  @override
  State<ImageHolder> createState() => _ImageHolderState();
}

class _ImageHolderState extends State<ImageHolder> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
            '/Users/lukaszmazurkiewicz/Documents/dev/daily_tasks/lib/widget/human.png'),
      ],
    );
  }
}
