import 'package:flutter/material.dart';
import 'quote.dart';

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

  Widget quoteTemplate(quote) {
    return Card(
      margin: EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
                quote.text,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[600],
                ),
            ),
            SizedBox(height: 6,),
            Text(
                quote.author,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[800],
                ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Awesome Quotes'),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Column(children: quoteList.map((quote) => quoteTemplate(quote)).toList()),
    );
  }
}
