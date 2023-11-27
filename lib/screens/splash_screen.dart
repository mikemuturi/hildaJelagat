import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_attendance/screens/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SpalshScreenState();
}

class _SpalshScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

  @override 
  void initState(){
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

    Future.delayed(const Duration(seconds: 10),() {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder:(_)=>const HomeScreen(),
      )
      );
        
    });
  }

  @override
  void dispose() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
        width:double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 2, 37, 4), Color.fromARGB(255, 3, 146, 8)],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.how_to_reg,
              size: 100,
              color: Colors.white,
            ),
            SizedBox(height: 20),
            Text(
              'Attendance Management',
              style: TextStyle(
                color:Colors.white,
                fontSize: 30,
              ),
            )
          ],
          ),
      ),
    );
  }
}
