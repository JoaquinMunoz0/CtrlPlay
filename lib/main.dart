import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'features/themes/theme.dart';
import 'features/themes/util.dart';
import 'features/themes/theme_provider.dart';
import 'features/splash/screens/splash_screen.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky, overlays: []);

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeProvider(),
      child: const CtrlPlayApp(),
    ),
  );
}


class CtrlPlayApp extends StatelessWidget {
  const CtrlPlayApp({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = createTextTheme(context, 'Actor', 'Orbitron');
    final materialTheme = MaterialTheme(textTheme);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      title: 'CtrlPlay',
      debugShowCheckedModeBanner: false,
      theme: materialTheme.light(),
      darkTheme: materialTheme.dark(),
      themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: const SplashScreen(),
    );
  }
}