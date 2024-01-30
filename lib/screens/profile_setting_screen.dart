import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_attendance/screens/login_screen.dart';
import 'package:my_attendance/screens/utiils.dart';
// import 'package:profile/main.dart';


class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List img = await pickImage(ImageSource.camera);
    // Uint8List imag = await pickImage(ImageSource.gallery);
    setState(() {
      _image = img;
      // _image = imag;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Profile'),
    centerTitle: true,
      backgroundColor: Colors.greenAccent,
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
      onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          },
      ),
      ),
      body:  SingleChildScrollView(
        child: Center(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 32,
            ),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 24,),
                          Stack(
                children: [
                  _image != null
                      ? CircleAvatar(
                          radius: 64,
                          backgroundImage: MemoryImage(_image!),
                        )
                      : const CircleAvatar(
                          radius: 64,
                          // Provide a valid image name or remove the AssetImage if not needed
                          backgroundImage: AssetImage("lib/images/avatar.png"),
                        ),
                  Positioned(
                    child: IconButton(
                      onPressed: selectImage,
                      icon: const Icon(Icons.add_a_photo),
                    ),
                    bottom: -10,
                    left: 80,
                  ),
                ],
              ),
            const SizedBox(height: 24,),
            const Text("mike"),
            const SizedBox(height: 8),
            const Text("Developer"),
            const Divider(
            ),
            const SizedBox(height: 30,),
            ItemProfile("Employee No", "KNDC/22200888", CupertinoIcons.person),
            const SizedBox(height: 15,),
            ItemProfile("Department", "ICT", CupertinoIcons.folder_circle_fill),
              const SizedBox(height: 15,),
              ItemProfile("Availability", "No", CupertinoIcons.phone),

                          ],
            ),
          ),
        ),
      ),
    );
  }
  ItemProfile(String title, String subtittle, IconData iconData)
  {
    return             Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    offset: const Offset(0, 5),
                    color: Colors.deepOrangeAccent.withOpacity(0.1),
                    spreadRadius: 2,
                    blurRadius: 10
                  )
                ]
              ),
              child:  ListTile( 
                title: Text(title),
                subtitle: Text(subtittle),
                leading:  Icon(iconData),
                trailing: const Icon(CupertinoIcons.chevron_right),
                tileColor: Colors.white,
                iconColor: Colors.grey[400],
              ),
            ) ;
  }
}