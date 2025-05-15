import 'package:flutter/material.dart';
import '../utils/mock_data.dart';
import 'game_detail.dart';

class GameListScreen extends StatelessWidget {
  const GameListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todos los juegos')),
      body: ListView.builder(
        itemCount: allGames.length,
        itemBuilder: (context, index) {
          final game = allGames[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: ListTile(
              leading: Image.network(game.imageUrl, width: 60),
              title: Text(game.title),
              subtitle: Text(
                game.description,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GameDetailScreen(
                      title: game.title,
                      imageUrl: game.imageUrl,
                      description: game.description,
                      reviews: game.reviews
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
