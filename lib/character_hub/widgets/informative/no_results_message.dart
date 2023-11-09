import 'package:flutter/material.dart';

class NoResultMessage extends StatelessWidget {
  const NoResultMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.warning_amber_rounded, size: 124),
            Text(
              "Oops! Looks like there are no results for the character",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Try entering a new character name on the search bar.",
              textAlign: TextAlign.center,
            ),
          ],
        )
    );
  }
}
