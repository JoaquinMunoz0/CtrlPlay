import 'package:flutter/material.dart';
import '../models/game.dart';
import '../utils/mock_data.dart';
import '../utils/liked_games.dart';
import 'game_detail.dart';

class Recomendados extends StatelessWidget {
  const Recomendados({super.key});

  List<Game> getRecommendedGames() {
    return allGames.where((game) => !likedGames.contains(game)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final recommendations = getRecommendedGames();

    return Scaffold(
      body: likedGames.isEmpty
          ? const Center(
              child: Text(
                '¡Comienza a dar me gustas para recibir recomendaciones!',
                style: TextStyle(fontSize: 16, color: Colors.white70),
              ),
            )
          : ListView.builder(
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                final game = recommendations[index];
                return Card(
                  color: Colors.grey[900],
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(game.imageUrl, width: 60, height: 90, fit: BoxFit.cover),
                    ),
                    title: Text(game.title, style: const TextStyle(color: Colors.white)),
                    subtitle: Text(
                      game.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.white70),
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameDetailScreen(
                            title: game.title,
                            imageUrl: game.imageUrl,
                            description: game.description,
                            reviews: game.reviews,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
    );
  }
}
