import 'package:flutter/material.dart';
import '../../games/data/liked_games.dart';
import '../../games/data/mock_data.dart';

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
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;
    final game = allGames[currentIndex];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme.surfaceContainerLowest,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset(
              'lib/assets/icon/icon_small.png',
              height: 40,
            ),
            const SizedBox(width: 8),
            Text(
              'CtrlPlay',
              style: textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.primary,
                fontSize: 28,
              ),
            ),
          ],
        ),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final availableHeight = constraints.maxHeight;
          final imageHeight = availableHeight * 0.6;
          final spacing = availableHeight * 0.01;

          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                color: colorScheme.secondaryContainer,
                elevation: 8,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        game.title,
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primaryContainer,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: spacing),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: Image.network(
                          game.imageUrl,
                          width: double.infinity,
                          height: imageHeight,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: spacing),
                      Text(
                        game.description,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.tertiary,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: spacing),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            heroTag: 'dislike',
                            backgroundColor: Colors.redAccent.shade200,
                            foregroundColor: Colors.white,
                            onPressed: skipGame,
                            mini: true,
                            child: const Icon(Icons.close),
                          ),
                          const SizedBox(width: 40),
                          FloatingActionButton(
                            heroTag: 'like',
                            backgroundColor: Colors.greenAccent.shade400,
                            foregroundColor: Colors.white,
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
