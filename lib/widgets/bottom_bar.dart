import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:real_estate_ui/provider/auth_provider.dart';
import 'package:real_estate_ui/screens/add_property.dart';
import 'package:real_estate_ui/screens/home.dart';
import 'package:real_estate_ui/screens/user_profile.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int _selectedTab = 0;

  void _handleIndexChanged(int i) {
    setState(() {
      _selectedTab = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<AuthProvider>(context, listen: false)
        .getUser(FirebaseAuth.instance.currentUser.uid);
    return Scaffold(
      body: selectedTabs[_selectedTab],
      bottomNavigationBar: SalomonBottomBar(
        currentIndex: _selectedTab,
        onTap: _handleIndexChanged,
        items: [
          /// Home
          SalomonBottomBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),
            selectedColor: Colors.orange,
          ),

          /// Likes
          SalomonBottomBarItem(
            icon: Icon(Icons.favorite_border),
            title: Text("Likes"),
            selectedColor: Colors.orange,
          ),

          /// Search
          SalomonBottomBarItem(
            icon: Icon(Icons.add),
            title: Text("Add Property"),
            selectedColor: Colors.orange,
          ),

          /// Profile
          SalomonBottomBarItem(
            icon: Icon(Icons.person),
            title: Text("Profile"),
            selectedColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}

enum _SelectedTab { home, likes, search, profile }
List selectedTabs = [
  Home(),
  Home(),
  AddPropertyScreen(),
  UserProfile(),
];
