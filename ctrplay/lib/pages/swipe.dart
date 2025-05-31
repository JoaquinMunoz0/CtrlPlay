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
      body: LayoutBuilder(
        builder: (context, constraints) {
          final availableHeight = constraints.maxHeight;
          final imageHeight = availableHeight * 0.4; // 40% de la pantalla
          final spacing = availableHeight * 0.02; // Espaciado proporcional

          return Center(
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
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: Image.network(
                          game.imageUrl,
                          width: double.infinity,
                          height: imageHeight,
                          fit: BoxFit.contain, // Se ve completa sin recortes
                        ),
                      ),
                      SizedBox(height: spacing),
                      Text(
                        game.title,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: spacing / 2),
                      Text(
                        game.description,
                        style: const TextStyle(fontSize: 16, color: Colors.white70),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: spacing),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'dislike',
                            backgroundColor: Colors.grey[800],
                            onPressed: skipGame,
                            mini: true,
                            child: const Icon(Icons.close, color: Colors.white),
                          ),
                          const SizedBox(width: 40),
                          FloatingActionButton(
                            heroTag: 'like',
                            backgroundColor: const Color(0xFFE50914),
                            onPressed: likeGame,
                            mini: true,
                            child: const Icon(Icons.favorite),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
