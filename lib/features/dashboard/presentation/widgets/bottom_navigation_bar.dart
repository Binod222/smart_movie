import 'package:flutter/material.dart';
import 'package:smart_movie/features/dashboard/presentation/views/about_screen.dart';
import 'package:smart_movie/features/dashboard/presentation/views/filter_screen.dart';
import 'package:smart_movie/features/dashboard/presentation/views/home_screen.dart';
import 'package:smart_movie/features/dashboard/presentation/views/profile_screen.dart';

class BottomNavigationView extends StatefulWidget {
  const BottomNavigationView({super.key});

  @override
  State<BottomNavigationView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<BottomNavigationView> {
  int _selectedIndex = 0;

  List<Widget> lstBottomScreen = [
    HomeView(),
    const AboutView(),
    const FilterView(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Smart Movie"),
      ),
      body: lstBottomScreen[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.blue,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.filter),
            label: 'Filter',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.white, // Set selected icon color to white
        unselectedItemColor:
            Colors.white54, // Set unselected icon color to a lighter white
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
