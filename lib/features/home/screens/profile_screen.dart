import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../themes/theme_provider.dart';
import '../../auth/screens/login_screen.dart';
import '../../feedback/feedback_screen.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String _username = '';
  String _profileImageUrl = '';
  String _email = '';
  bool _isLoading = true;
  bool _isUploadingImage = false;

  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const LoginScreen()),
        );
      }
      return;
    }

    FirebaseFirestore.instance.collection('users').doc(user.uid).snapshots().listen((doc) {
      if (doc.exists) {
        setState(() {
          _username = doc.data()?['username'] ?? '';
          _profileImageUrl = doc.data()?['profileImageUrl'] ?? '';
          _email = user.email ?? '';
          _isLoading = false;
        });
      } else {
        setState(() {
          _username = '(Usuario sin nombre)';
          _profileImageUrl = '';
          _email = user.email ?? '';
          _isLoading = false;
        });
      }
    });
  }

  Future<bool> _requestPermission(Permission permission) async {
    var status = await permission.status;
    if (!status.isGranted) {
      status = await permission.request();
    }
    return status.isGranted;
  }

  Future<void> _pickAndUploadImage(ImageSource source) async {
    final user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Debes iniciar sesión para cambiar tu foto de perfil.')),
        );
      }
      return;
    }

    Permission permission = source == ImageSource.camera ? Permission.camera : Permission.photos;
    bool granted = await _requestPermission(permission);

    if (!granted) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Permiso para usar ${source == ImageSource.camera ? 'cámara' : 'galería'} denegado')),
      );
      return;
    }

    try {
      final pickedFile = await _picker.pickImage(source: source, imageQuality: 75);
      if (pickedFile == null) return;

      final File imageFile = File(pickedFile.path);
      final fileSize = await imageFile.length();
      if (fileSize > 5 * 1024 * 1024) {
        if (!mounted) return;
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('La imagen debe ser menor a 5 MB')),
        );
        return;
      }

      setState(() {
        _isUploadingImage = true;
      });

      final ref = FirebaseStorage.instance.ref().child('profile_images/${user.uid}.jpg');
      await ref.putFile(imageFile);
      final downloadUrl = await ref.getDownloadURL();

      await FirebaseFirestore.instance.collection('users').doc(user.uid).update({
        'profileImageUrl': downloadUrl,
      });

      if (!mounted) return;
      setState(() {
        _profileImageUrl = downloadUrl;
        _isUploadingImage = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Foto de perfil actualizada exitosamente.')),
      );
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isUploadingImage = false;
      });
      String errorMessage = 'Error al actualizar la foto de perfil. Inténtalo de nuevo.';
      if (e.toString().contains('unauthorized')) {
        errorMessage = 'No tienes permiso para subir esta imagen. Verifica las reglas de almacenamiento.';
      }
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(errorMessage)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;
    final textTheme = theme.textTheme;

    if (_isLoading) {
      return Scaffold(
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Datos del usuario en una Container
            Container(
              decoration: BoxDecoration(
                color: colors.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 0, // Sin difuminado
                    spreadRadius: 3, // Extiende la sombra para contorno
                    offset: Offset(0, 4), // Posición para relieve
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Stack(
                      children: [
                        CircleAvatar(
                          radius: 40,
                          backgroundImage: _profileImageUrl.isNotEmpty ? NetworkImage(_profileImageUrl) : null,
                          child: _profileImageUrl.isEmpty ? const Icon(Icons.person, size: 40) : null,
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: GestureDetector(
                            onTap: () {
                              if (_isUploadingImage) return;
                              showModalBottomSheet(
                                context: context,
                                builder: (_) => SafeArea(
                                  child: Wrap(
                                    children: [
                                      ListTile(
                                        leading: const Icon(Icons.camera_alt),
                                        title: const Text('Tomar foto'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          _pickAndUploadImage(ImageSource.camera);
                                        },
                                      ),
                                      ListTile(
                                        leading: const Icon(Icons.photo_library),
                                        title: const Text('Seleccionar de la galería'),
                                        onTap: () {
                                          Navigator.pop(context);
                                          _pickAndUploadImage(ImageSource.gallery);
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            child: CircleAvatar(
                              radius: 15,
                              backgroundColor: colors.primary,
                              child: _isUploadingImage
                                  ? const CircularProgressIndicator(strokeWidth: 2, color: Colors.white)
                                  : Icon(Icons.edit, size: 15, color: colors.onPrimary),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            _username,
                            style: GoogleFonts.orbitron(
                              textStyle: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            _email,
                            style: textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            // Sección de preferencias
            Container(
              decoration: BoxDecoration(
                color: colors.secondaryContainer,
                borderRadius: BorderRadius.circular(12),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 0, // Sin difuminado
                    spreadRadius: 3, // Extiende la sombra para contorno
                    offset: Offset(0, 4), // Posición para relieve
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Preferencias',
                      style: GoogleFonts.orbitron(
                        textStyle: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colors.onSurface,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    SwitchListTile(
                      title: Text(
                        'Tema oscuro',
                        style: textTheme.bodyLarge?.copyWith(color: colors.onSurface),
                      ),
                      value: Provider.of<ThemeProvider>(context).isDarkMode,
                      onChanged: (value) {
                        Provider.of<ThemeProvider>(context, listen: false).toggleTheme(value);
                      },
                      activeColor: colors.primary,
                      inactiveTrackColor: colors.surfaceContainerHigh,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const FeedbackScreen()),
                  );
                },
                icon: const Icon(Icons.feedback),
                label: const Text('Dame tu opinión'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                  foregroundColor: colors.onPrimary,
                ),
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const LoginScreen()),
                      (route) => false,
                    );
                  }
                },
                icon: const Icon(Icons.logout),
                label: const Text('Cerrar sesión'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.error,
                  foregroundColor: colors.onError,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}