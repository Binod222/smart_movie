import 'package:flutter/material.dart';
import 'package:smart_movie/features/home/presentation/view/bottom_view/about_us_view.dart';
import 'package:smart_movie/features/home/presentation/view/bottom_view/filter_view.dart';
import 'package:smart_movie/features/home/presentation/view/bottom_view/profile_view.dart';
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _BottomNavigationViewState();
}

class _BottomNavigationViewState extends State<HomeView> {
  int _selectedIndex = 0;

  List<Widget> lstBottomScreen = [
    HomeView(),
    const AboutView(),
    const FilterView(),
    const ProfilePage(),
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
