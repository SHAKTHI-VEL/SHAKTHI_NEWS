import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shakthi_news/features/Cart/ui/cart.dart';
import 'package:shakthi_news/features/Home/ui/home.dart';
import 'package:shakthi_news/features/Login/ui/login.dart';
import 'package:shakthi_news/features/Profile/ui/profile.dart';
import 'package:shakthi_news/features/Subscription/ui/subscription.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
    int _selectedIndex = 0;
  final List<Widget> _widgetOptions = [
    const Home(),
    const Cart(),
    const Subscription(),
    const Profile()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.home,
              size: height * 0.028,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.cart,
              size: height * 0.028,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.money_pound,
              size: height * 0.028,
            ),
            label: 'Subscription',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              CupertinoIcons.person,
              size: height * 0.028,
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: Colors.orange,
      ),
    );
  }
  }
