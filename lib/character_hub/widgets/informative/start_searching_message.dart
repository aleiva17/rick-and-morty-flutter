import 'package:flutter/material.dart';

class StartSearchingMessage extends StatelessWidget {
  const StartSearchingMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.search, size: 124),
          Text(
            "Start searching a character",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold
            ),
          ),
          SizedBox(height: 8),
          Text(
            "Enter a character name on the search bar",
            textAlign: TextAlign.center,
          ),
        ],
      )
    );
  }
}
