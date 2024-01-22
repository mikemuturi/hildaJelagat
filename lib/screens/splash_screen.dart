import 'package:flutter/material.dart';
//import 'package:my_attendance/screens/home_screen.dart';
import 'package:my_attendance/screens/login_screen.dart';
import 'dart:async';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}
class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Timer(
      const Duration(seconds: 5),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: Center(
          child: Column(
            children: [
              LoadingAnimationWidget.staggeredDotsWave(
                color: const Color.fromARGB(255, 40, 170, 0),
                size: 200,
              ),
            ],
          ),
    )
      );
  }
}




































// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SpalshScreenState();
// }

// class _SpalshScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin{

//   @override 
//   void initState(){
//     super.initState();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);

//     Future.delayed(const Duration(seconds: 2),() {
//       Navigator.of(context).pushReplacement(MaterialPageRoute(
//         builder:(_)=>const LoginScreen(),
//       )
//       );
        
//     });
//   }

//   @override
//   void dispose() {
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,overlays: SystemUiOverlay.values);
//     super.dispose();
//   }


//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(

//       body: Container(
//         width:double.infinity,
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color.fromARGB(255, 2, 37, 4), Color.fromARGB(255, 3, 146, 8)],
//             begin: Alignment.topRight,
//             end: Alignment.bottomLeft,
//           ),
//         ),
//         child: const Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.how_to_reg,
//               size: 100,
//               color: Colors.white,
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Attendance Management',
//               style: TextStyle(
//                 color:Colors.white,
//                 fontSize: 30,
//               ),
//             )
//           ],
//           ),
//       ),
//     );
//   }
// }
