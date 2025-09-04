import 'package:flutter/material.dart';
import 'quote.dart';
import 'package:intl/intl.dart';

class QuoteCard extends StatelessWidget {

  final Quote quote;
  final Function delete;

  const QuoteCard({ super.key, required this.quote, required this.delete });

  @override
  Widget build(BuildContext context) {

    final String dateStr = DateFormat('MMM d, yyyy').format(quote.createdAt);

    return Card(
      margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),

      // fixed shape, border colors
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.zero,
      ),
      color: getCategoryColor(quote.category, 100),
      child: Container(
        
        // background colors
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: getCategoryColor(quote.category, 50),
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              
              // Chip with category
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    label: Text(
                      quote.category.toUpperCase(),
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    backgroundColor: getCategoryColor(quote.category, 600),
                  ),
                ],
              ),

              SizedBox(height: 6.0),
              Text(
                quote.text,
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 6.0),
              Text(
                "- ${quote.author} ($dateStr)",
                style: TextStyle(
                  fontSize: 14.0,
                  color: Colors.grey[400],
                ),
              ),
              SizedBox(height: 8.0),
              TextButton.icon(
                onPressed: () {
                  delete();
                },
                label: Text("delete quote"),
                icon: Icon(Icons.delete)
              )
            ],
          ),
        ),
      ),

    );
  }

  Color? getCategoryColor(String category, int shade)
  {
    return switch(category) {
      "philosophical" => Colors.green[shade],
      "witty" => Colors.yellow[shade],
      "motivational" => Colors.purple[shade],
      _ => Colors.red[shade]
    };
  }
}