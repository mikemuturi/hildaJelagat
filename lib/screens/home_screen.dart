import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:my_attendance/screens/dashboard_screen.dart';
import 'package:my_attendance/screens/insights_Screen.dart';
import 'package:my_attendance/screens/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen( {Key?key}):super(key:key);

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {

  int _selectedindex=0;

  static  final List<Widget> _widgetoptions =<Widget>[
    DashboardScreen(),
    const InsightsScreen(),
    const ProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    return  Scaffold(

      body: Center(
        child:_widgetoptions.elementAt(_selectedindex),
        ),

      bottomNavigationBar: Container(
        color: Colors.green,
        child:  Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20 ,
            vertical: 12
          ),
          child: GNav(
            backgroundColor: Colors.green,
            color: Colors.white,
            activeColor: Colors.white,
            tabBackgroundColor: Colors.grey,
            gap: 20,
            iconSize: 24,
            padding: const EdgeInsets.all(16),
            tabs: const [
              GButton(
                icon: Icons.dashboard,
                text: 'Dashboard'
              ),
              GButton(
                icon: Icons.insights,
                text: 'Insights',
              ),
              GButton(
                icon: Icons.person,
                text: 'Profile',
              ),
            ],
            selectedIndex: _selectedindex,
            onTabChange: (index){
              setState(() {
                _selectedindex=index;
              });
            },

          ),
        ),
      ),
    );
  }
}
