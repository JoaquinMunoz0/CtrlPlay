import 'review.dart';

class Game {
  final String title;
  final String imageUrl;
  final String description;
  final List<Review> reviews;

  Game({
    required this.title,
    required this.imageUrl,
    required this.description,
    this.reviews = const [],
  });
}
