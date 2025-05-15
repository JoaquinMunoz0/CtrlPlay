import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'pages/home.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    // 3.5 segundos de fade, para que se note más
    _controller = AnimationController(vsync: this, duration: const Duration(milliseconds: 3500));
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);

    _controller.forward();

    // Ahora dura 5 segundos antes de pasar al home
    Future.delayed(const Duration(seconds: 5), () {
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('lib/assets/consola.png', width: 100, height: 100),
              const SizedBox(height: 20),
              Text(
                'CtrlPlay',
                style: GoogleFonts.orbitron(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: const Color(0xFFE50914),
                  letterSpacing: 2,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
