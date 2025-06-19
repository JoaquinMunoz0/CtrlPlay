import 'package:flutter/material.dart';
import '../../games/models/game.dart';
import '../../games/data/mock_data.dart';
import '../../games/data/liked_games.dart';
import '../../games/screens/game_detail.dart';

class Recomendados extends StatelessWidget {
  const Recomendados({super.key});

  List<Game> getRecommendedGames() {
    return allGames.where((game) => !likedGames.contains(game)).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final recommendations = getRecommendedGames();

    return Scaffold(
      body: likedGames.isEmpty
          ? Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  '¡Comienza a dar me gustas para recibir recomendaciones!',
                  style: textTheme.bodyLarge?.copyWith(
                    color: colorScheme.onSurface,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          : ListView.builder(
              itemCount: recommendations.length,
              itemBuilder: (context, index) {
                final game = recommendations[index];
                return Card(
                  color: colorScheme.surfaceContainerHigh,
                  margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12),
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              game.imageUrl,
                              width: 60,
                              height: 90,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  game.title,
                                  style: textTheme.titleMedium?.copyWith(
                                    color: colorScheme.onSurface,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  game.description,
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: textTheme.bodyMedium?.copyWith(
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Icon(Icons.chevron_right, color: colorScheme.onSurfaceVariant),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
