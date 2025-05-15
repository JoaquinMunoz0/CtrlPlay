import 'package:flutter/material.dart';
import '../utils/liked_games.dart';
import '../models/game.dart';
import 'game_detail.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String username = 'JOAKO3020';

  void _editUsername() async {
    final controller = TextEditingController(text: username);

    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: const Text('Editar nombre de usuario', style: TextStyle(color: Colors.white)),
        content: TextField(
          controller: controller,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            labelText: 'Nombre de usuario',
            labelStyle: TextStyle(color: Colors.white70),
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white70),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancelar'),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                username = controller.text;
              });
              Navigator.pop(context);
            },
            child: const Text('Guardar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: likedGames.isEmpty
            ? const Center(
                child: Text(
                  'Aun no has agregado juegos en tus me gustas',
                  style: TextStyle(fontSize: 18, color: Colors.white70),
                ),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person, color: Colors.white),
                      const SizedBox(width: 8),
                      Text(
                        username,
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                      const Spacer(),
                      IconButton(
                        onPressed: _editUsername,
                        icon: const Icon(Icons.edit, color: Colors.white70),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const Text(
                    'Tus Juegos',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: likedGames.length,
                      itemBuilder: (context, index) {
                        Game game = likedGames[index];
                        return Card(
                          color: Colors.grey[900],
                          child: ListTile(
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Image.network(game.imageUrl, width: 80, height: 120, fit: BoxFit.cover),
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
                  ),
                ],
              ),
      ),
    );
  }
}
