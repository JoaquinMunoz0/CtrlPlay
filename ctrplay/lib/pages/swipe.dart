import 'package:flutter/material.dart';
import '../utils/liked_games.dart';
import '../utils/mock_data.dart';

class SwipeScreen extends StatefulWidget {
  const SwipeScreen({super.key});

  @override
  State<SwipeScreen> createState() => _SwipeScreenState();
}

class _SwipeScreenState extends State<SwipeScreen> {
  int currentIndex = 0;

  void likeGame() {
    if (currentIndex < allGames.length) {
      likedGames.add(allGames[currentIndex]);
    }
    skipGame();
  }

  void skipGame() {
    setState(() {
      if (currentIndex < allGames.length - 1) {
        currentIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final game = allGames[currentIndex];

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Card(
            color: Colors.grey[900],
            elevation: 8,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(game.imageUrl, width: 250, height: 375, fit: BoxFit.cover),
                  ),
                  const SizedBox(height: 20),
                  Text(game.title, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
                  const SizedBox(height: 10),
                  Text(
                    game.description,
                    style: const TextStyle(fontSize: 16, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton(
                        heroTag: 'dislike',
                        backgroundColor: Colors.grey[800],
                        onPressed: skipGame,
                        child: const Icon(Icons.close, color: Colors.white),
                      ),
                      const SizedBox(width: 40),
                      FloatingActionButton(
                        heroTag: 'like',
                        backgroundColor: const Color(0xFFE50914),
                        onPressed: likeGame,
                        child: const Icon(Icons.favorite),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
