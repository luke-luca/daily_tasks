class Quote {
  final String quoteText;
  final String quoteAuthor;

  const Quote({
    required this.quoteText,
    required this.quoteAuthor,
  });

  factory Quote.fromJson(Map<String, dynamic> json) {
    return Quote(
      quoteText: json['q'],
      quoteAuthor: json['a'],
    );
  }
}
