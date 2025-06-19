import 'package:flutter/material.dart';
import 'swipe_screen.dart';
import 'recommended_screen.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this, initialIndex: 1);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colors = theme.colorScheme;

    return Scaffold(
      body: TabBarView(
        controller: _tabController,
        children: const [
          Recomendados(),
          SwipeScreen(),
          Profile(),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(top: BorderSide(color: colors.outlineVariant, width: 0.5)),
        ),
        child: TabBar(
          controller: _tabController,
          labelColor: colors.primary,
          unselectedLabelColor: colors.onSurfaceVariant,
          indicatorColor: colors.primary,
          tabs: const [
            Tab(icon: Icon(Icons.star), text: 'Sugerencias'),
            Tab(icon: Icon(Icons.swipe), text: 'Descubre'),
            Tab(icon: Icon(Icons.person), text: 'Perfil'),
          ],
        ),
      ),
    );
  }
}
