import 'package:flutter/material.dart';

class NoFavoriteCharactersMessage extends StatelessWidget {
  const NoFavoriteCharactersMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.info_outline, size: 124),
            Text(
              "It looks like you still don't have any favorite characters",
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 8),
            Text(
              "Start by searching a new character.",
              textAlign: TextAlign.center,
            ),
          ],
        )
    );
  }
}
