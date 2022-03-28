import 'package:flutter/material.dart';

class DailyQuote extends StatefulWidget {
  const DailyQuote({Key? key}) : super(key: key);

  @override
  State<DailyQuote> createState() => _DailyQuoteState();
}

class _DailyQuoteState extends State<DailyQuote> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text('“Focus on being productive instead of busy.”'),
    );
  }
}
