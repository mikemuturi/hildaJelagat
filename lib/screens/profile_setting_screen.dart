import 'package:flutter/material.dart';


class ProfileSettingScreen extends StatefulWidget {
  const ProfileSettingScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingScreen> createState() => _ProfileSettingScreen();
}

class _ProfileSettingScreen extends State<ProfileSettingScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              child: Stack(
                children: [
                  //widget
                  greenWidget(context),

                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                        width: 180,
                        height: 180,
                        margin: EdgeInsets.only(bottom: 20),
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.grey),
                        child: const Center(
                          child: Icon(Icons.camera_alt_outlined,
                              size: 40, color: Colors.white),
                        )),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(70),
              alignment: Alignment.center,
              child: MaterialButton(
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius:BorderRadius.circular(5) 
                  ),
                color: Colors.green,
                child: const Text(
                  'Upload',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget greenWidget(BuildContext context) {
  return Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        // image: DecorationImage(
        //   image:AssetImage('assets/konza.png'),
        //   fit: BoxFit.fill
        //    ),
        color: Colors.green,
      ),
      height: MediaQuery.of(context).size.height * 0.3,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width,
        margin:
            EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.05),
        child: const Center(
          child: Text(
            "Image Upload",
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
      ));
}
