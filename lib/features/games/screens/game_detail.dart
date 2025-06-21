import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/review.dart';
import '../../games/data/liked_games.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GameDetailScreen extends StatefulWidget {
  final int initialIndex;

  const GameDetailScreen({
    super.key,
    this.initialIndex = 0,
  });

  @override
  State<GameDetailScreen> createState() => _GameDetailScreenState();
}

class _GameDetailScreenState extends State<GameDetailScreen> with SingleTickerProviderStateMixin {
  String _username = 'Usuario'; // valor por defecto
  late int currentIndex;
  late TabController _tabController;
  final TextEditingController _commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    currentIndex = widget.initialIndex;
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      FirebaseFirestore.instance
          .collection('users')
          .doc(user.uid)
          .get()
          .then((doc) {
        if (doc.exists && mounted) {
          setState(() {
            _username = doc.data()?['username'] ?? 'Usuario';
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    _commentController.dispose();
    super.dispose();
  }

  void _goToPrevious() {
    if (currentIndex > 0) {
      setState(() {
        currentIndex--;
      });
    }
  }

  void _goToNext() {
    if (currentIndex < likedGames.length - 1) {
      setState(() {
        currentIndex++;
      });
    }
  }

  void _submitComment() {
    if (_commentController.text.trim().isNotEmpty) {
      setState(() {
        likedGames[currentIndex].reviews.add(
          Review(
            username: _username,
            comment: _commentController.text.trim(),
          ),
        );
        _commentController.clear();
      });
    }
  }

  Color _getDisabledColor(ColorScheme colorScheme) {
    return colorScheme.onSurface.withAlpha(76); // 0.3 de opacidad
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final game = likedGames[currentIndex];
    final disabledColor = _getDisabledColor(colorScheme);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          game.title,
          style: GoogleFonts.orbitron(
            textStyle: textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme.onPrimaryContainer,
            ),
          ),
        ),
        backgroundColor: colorScheme.primaryContainer,
        automaticallyImplyLeading: false,
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: colorScheme.outlineVariant, width: 0.5)),
        ),
        child: TabBar(
          controller: _tabController,
          labelColor: colorScheme.primary,
          unselectedLabelColor: disabledColor,
          indicatorColor: Colors.transparent,
          tabs: [
            Tab(
              icon: Icon(
                Icons.arrow_back,
                color: currentIndex > 0 ? colorScheme.primary : disabledColor,
              ),
              text: 'Anterior',
            ),
            Tab(
              icon: const Icon(Icons.gamepad, color: Color(0xFFFFD700)),
              text: 'Tus Juegos',
            ),
            Tab(
              icon: Icon(
                Icons.arrow_forward,
                color: currentIndex < likedGames.length - 1 ? colorScheme.primary : disabledColor,
              ),
              text: 'Siguiente',
            ),
          ],
          labelStyle: GoogleFonts.orbitron(fontSize: 12),
          unselectedLabelStyle: GoogleFonts.orbitron(fontSize: 12),
          onTap: (index) {
            if (index == 0) {
              _goToPrevious();
            } else if (index == 1) {
              Navigator.pop(context);
            } else if (index == 2) {
              _goToNext();
            }
          },
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  game.imageUrl,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              game.description,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurfaceVariant,
              ),
            ),
            const SizedBox(height: 24),
            Divider(color: colorScheme.outlineVariant),
            const SizedBox(height: 12),
            Text(
              'Reseñas de usuarios',
              style: GoogleFonts.orbitron(
                textStyle: textTheme.titleMedium?.copyWith(
                  color: colorScheme.onSurface,
                  shadows: const [
                    Shadow(
                      color: Colors.black,
                      offset: Offset(0, 2),
                      blurRadius: 0,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 0,
                    spreadRadius: 1,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  TextField(
                    controller: _commentController,
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                    decoration: InputDecoration(
                      hintText: 'Escribe tu reseña...',
                      hintStyle: textTheme.bodyMedium?.copyWith(
                        color: colorScheme.onSurfaceVariant,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: colorScheme.outline),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(color: colorScheme.primary),
                      ),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: _submitComment,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: colorScheme.primary,
                        foregroundColor: colorScheme.onPrimary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        'Enviar',
                        style: GoogleFonts.orbitron(
                          textStyle: textTheme.labelLarge,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            if (game.reviews.isEmpty)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Center(
                  child: Text(
                    'Todavía no hay reseñas.',
                    style: textTheme.bodyMedium?.copyWith(
                      color: colorScheme.onSurfaceVariant,
                    ),
                  ),
                ),
              )
            else
              Column(
                children: game.reviews.map((review) {
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 6),
                    decoration: BoxDecoration(
                      color: colorScheme.surfaceContainerLow,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black,
                          blurRadius: 0,
                          spreadRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: ListTile(
                      leading: Icon(Icons.person, color: colorScheme.primary),
                      title: Text(
                        review.username,
                        style: GoogleFonts.orbitron(
                          textStyle: textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                        ),
                      ),
                      subtitle: Text(
                        review.comment,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
          ],
        ),
      ),
    );
  }
}
