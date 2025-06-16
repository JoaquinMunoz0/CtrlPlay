import 'package:flutter/material.dart';
import '../utils/liked_games.dart';
import '../utils/current_user.dart';
import 'game_detail.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isEditing = false;
  late TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: currentUser.username);
  }

  void _startEditing() {
    setState(() {
      isEditing = true;
    });
  }

  void _saveUsername() {
    setState(() {
      currentUser.username = _nameController.text.trim();
      isEditing = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Nombre de usuario actualizado')),
    );
  }

  void _cancelEditing() {
    setState(() {
      _nameController.text = currentUser.username;
      isEditing = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mi perfil')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Nombre de usuario:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            isEditing
                ? Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _nameController,
                          decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Ingresa tu nombre',
                          ),
                        ),
                      ),
                      const SizedBox(width: 8),
                      ElevatedButton(
                        onPressed: _saveUsername,
                        child: const Text('Guardar'),
                      ),
                      const SizedBox(width: 8),
                      TextButton(
                        onPressed: _cancelEditing,
                        child: const Text('Cancelar'),
                      ),
                    ],
                  )
                : Row(
                    children: [
                      Text(
                        currentUser.username,
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: _startEditing,
                      ),
                    ],
                  ),
            const SizedBox(height: 24),
            const Text(
              'Tus me gusta:',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Expanded(
              child: likedGames.isEmpty
                  ? const Center(
                      child: Text(
                        'Aún no has dado me gusta a ningún juego.',
                        style: TextStyle(fontSize: 16),
                      ),
                    )
                  : ListView.builder(
                      itemCount: likedGames.length,
                      itemBuilder: (context, index) {
                        final game = likedGames[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 8),
                          child: ListTile(
                            leading: Image.network(game.imageUrl, width: 60, fit: BoxFit.cover),
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
