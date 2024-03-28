import 'package:quotes/headers.dart';

class Quote {
  final String quote;
  final String author;
  final String category;

  Quote({required this.quote, required this.author, required this.category});

  factory Quote.formMap({required Map data}) => Quote(
      quote: data['quote'], author: data['author'], category: data['category']);

  Map<String, dynamic> get toMap => {
        'quote': quote,
        'author': author,
        'category': category,
      };
}
