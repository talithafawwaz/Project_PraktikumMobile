import 'package:flutter/material.dart';
import 'package:project_kel6/views/menu_bantuan.dart';
import 'package:project_kel6/views/menu_profil.dart';
import 'package:project_kel6/views/menu_resep.dart';

class MenuUtama extends StatefulWidget {
  const MenuUtama({Key? key}) : super(key: key);

  @override
  State<MenuUtama> createState() => _MenuUtamaState();
}

class _MenuUtamaState extends State<MenuUtama> {
  int _currentIndex = 0;

  final List<Widget> _children = [MenuResep(), Profil(), Bantuan()];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        backgroundColor: Colors.teal,
        unselectedItemColor: Colors.white,
        selectedItemColor: Colors.lightGreenAccent,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu_book),
            label: 'Resep',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: 'Profil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.help),
            label: 'Bantuan',
          ),
        ],
      ),
    );
  }
}