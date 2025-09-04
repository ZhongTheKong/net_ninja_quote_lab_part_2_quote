import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp(MaterialApp(home: QuoteList()));
}

class QuoteList extends StatefulWidget {
  const QuoteList({super.key});

  @override
  State<QuoteList> createState() => _QuoteListState();
}

class _QuoteListState extends State<QuoteList> {

  List<Quote> quotes = [
    Quote(author: "Oscar Wilde", text: "Be yourself; everyone else is already taken", category: "philosophical", createdAt: DateTime(1999)),
    Quote(author: "Oscar Wilde", text: "I have nothing to declare except my genius", category: "witty", createdAt: DateTime(1882, 1, 3)),
    Quote(author: "Oscar Wilde", text: "The truth is rarely pure and never simple", category: "philosophical", createdAt: DateTime(1895)),
    Quote(author: "Bob Ross", text: "We don't make mistakes, just happy little accidents", category: "motivational", createdAt: DateTime(1987, 4, 29)),
    Quote(author: "Franklin D. Roosevelt", text: "We have nothing to fear but fear itself", category: "philosophical", createdAt: DateTime(1983, 3, 4)),
    Quote(author: "Mahatma Gandhi", text: "Be the change that you wish to see in the world", category: "motivational", createdAt: DateTime(1913)),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          "Awesome Quotes",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
        children: quotes.map((quote) => QuoteCard(
          quote: quote,
          delete: () { 
            setState(() {
              quotes.remove(quote);
            }); 
          },
        )).toList(),
      ),
    );
  }
}