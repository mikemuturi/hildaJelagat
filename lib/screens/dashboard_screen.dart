import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_attendance/screens/checkin_screen.dart';
import 'package:my_attendance/screens/create_task.dart';

class DashboardScreen extends StatefulWidget {

  DashboardScreen({Key? key,}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreen();
}

class _DashboardScreen extends State<DashboardScreen> {
  var _currentTime = '';
  void _updateTime() {
    setState(() {
      _currentTime = DateFormat('hh:mm:ss').format(DateTime.now());
    });
  }

  @override
  void initState() {
    super.initState();
    _updateTime();
    Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Dashboard',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      // body: const Center(
      //   child: Text('Settings Screen'),
      // ),
      // body: Container(
      //   padding: EdgeInsets.all(16),

      //   child: const Card(
      //     elevation: 4.0,
      //     child: Text(
      //        $_currentTime.toString(),
      //       style: TextStyle(
      //         color: Colors.black,
      //       ),
      //     ),
      //   ),
      // ),
      body: Container(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Expanded(
                flex: 3,
                child: Card(
                  color: Colors.white,
                  elevation: 4.0,
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    height: 200.0,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Current Time: $_currentTime',
                          style: const TextStyle(
                            color: Colors.green,
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'TW Cen MT',
                          ),
                        ),
                        const SizedBox(height: 20.0),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CreateTask()),
                            );
                          },
                          child: const Text('Clock In'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Card(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 800,
                    color: Colors.white,
                    child: ListView(
                      children: const [
                        Text(
                          'Recent Check-In Data',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Tw Cent MT',
                          ),
                        ),
                        ListTile(
                          title: Column(
                            children: [
                              // Text($location),
                              // Text($description),
                              // Text($notes),
                            ],
                          )
                        ),
                        ListTile(
                          title: Text('Item 2'),
                        ),
                        ListTile(
                          title: Text('Item 3'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
