import 'package:flutter/material.dart';

import 'quote.dart';
import 'quoteCard.dart';

void main() => runApp(MaterialApp(home: QuoteList()));

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {
  List<String> quotes = ['quote 1', 'quote 2', 'quote 3'];
  List<String> authors = ['author 1', 'author 2', 'author 3'];

  List<Quote> quoteList = [
    Quote(text: 'quote 1', author: 'author 1'),
    Quote(text: 'quote 2', author: 'author 2'),
    Quote(text: 'quote 3', author: 'author 3'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children:
            quoteList
                .map(
                  (quote) => QuoteCard(
                    quote: quote,
                    delete: () {
                      setState(() {
                        quoteList.remove(quote);
                      });
                    },
                  ),
                )
                .toList(),
      ),
    );
  }
}
