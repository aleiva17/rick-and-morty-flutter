import 'dart:math';

class DisplayableImageService {
  static const List<String> displayableImages = [
    "assets/morty-1.png",
    "assets/morty-2.png",
    "assets/morty-3.png",
    "assets/rick-1.png",
    "assets/rick-2.png",
    "assets/rick-3.png",
    "assets/rick-and-morty-1.png",
    "assets/rick-and-morty-2.png",
    "assets/rick-and-morty-3.png",
  ];

  static String getRandomDisplayableImage() {
    final randomGenerator = Random();
    return displayableImages[randomGenerator.nextInt(displayableImages.length)];
  }
}