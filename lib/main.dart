import 'package:flutter/material.dart';
import 'theme.dart';
import 'util.dart';
import 'features/splash/screens/splash_screen.dart';

void main() {
  runApp(const CtrlPlayApp());
}

class CtrlPlayApp extends StatelessWidget {
  const CtrlPlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final textTheme = createTextTheme(context, 'Actor', 'Orbitron');
        final materialTheme = MaterialTheme(textTheme);

        return MaterialApp(
          title: 'CtrlPlay',
          debugShowCheckedModeBanner: false,
          theme: materialTheme.light(),
          darkTheme: materialTheme.dark(),
          themeMode: ThemeMode.system,
          home: const SplashScreen(),
        );
      },
    );
  }
}