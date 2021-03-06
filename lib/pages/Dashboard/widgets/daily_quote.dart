import 'package:daily_tasks/styles.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../models/quote.dart';

class DailyQuote extends StatefulWidget {
  const DailyQuote({Key? key}) : super(key: key);

  @override
  State<DailyQuote> createState() => _DailyQuoteState();
}

class _DailyQuoteState extends State<DailyQuote> {
  late Future<List<Quote>> futureQuote;

  @override
  void initState() {
    super.initState();
    futureQuote = _fetchQuote();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Quote>>(
      future: futureQuote,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (!snapshot.hasData) {
          return const Center(
            child: Text('Failed to load quote'),
          );
        } else {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                    snapshot.data!.first.quoteText +
                        ' - ' +
                        snapshot.data!.first.quoteAuthor,
                    style: CustomStyles.quote,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }

  Future<List<Quote>> _fetchQuote() async {
    Dio dio = Dio();
    RequestOptions options = RequestOptions(
      baseUrl: 'https://zenquotes.io',
      path: '/api/today',
      method: 'GET',
      responseType: ResponseType.json,
    );
    Response response = await dio.fetch(options);
    List<Quote> quoteList = [];
    for (Map<String, dynamic> json in response.data) {
      quoteList.add(Quote.fromJson(json));
    }
    return quoteList;
  }
}
