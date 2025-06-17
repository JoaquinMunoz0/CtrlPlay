import 'package:flutter/material.dart';
import 'swipe.dart';
import 'recomendados.dart';
import 'profile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'CtrlPlay',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: const [
              DrawerHeader(
                decoration: BoxDecoration(color: Color.fromARGB(255, 229, 9, 20)),
                child: Text(
                  'Inicio',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
              ListTile(
                leading: Icon(Icons.swipe),
                title: Text('Descubre juegos'),
              ),
              ListTile(
                leading: Icon(Icons.star),
                title: Text('Recomendados'),
              ),
              ListTile(
                leading: Icon(Icons.person),
                title: Text('Perfil'),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SwipeScreen(),
            Recomendados(),
            Profile(),
          ],
        ),
        bottomNavigationBar: const TabBar(
          labelColor: Color(0xFFE50914),
          unselectedLabelColor: Colors.grey,
          indicatorColor: Color(0xFFE50914),
          tabs: [
            Tab(icon: Icon(Icons.swipe), text: 'Descubre'),
            Tab(icon: Icon(Icons.star), text: 'Recomendados'),
            Tab(icon: Icon(Icons.person), text: 'Perfil'),
          ],
        ),
      ),
    );
  }
}
