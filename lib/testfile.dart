import 'package:flutter/material.dart';
// import 'package:image/picker.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:my_attendance/screens/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context){
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImagePickerScreen(),
    );
  }
}


class ImagePickerScreen extends StatefulWidget {
  // ignore: use_super_parameters
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  XFile? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Attendance Register'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton.icon(
                onPressed: () async {
                  final ImagePicker picker0 = ImagePicker();
                  final img =
                      await picker0.pickImage(source: ImageSource.gallery);
                  setState(() {
                    image = img;
                  });
                },
                label: const Text('Choose Image'),
                icon: const Icon(Icons.image),
              ),
              ElevatedButton.icon(
                onPressed: () async {
                  final ImagePicker picker = ImagePicker();
                  final img =
                      await picker.pickImage(source: ImageSource.camera);
                  setState(() {
                    image = img;
                  });
                },
                label: const Text('Take Photo'),
                icon: const Icon(Icons.camera_alt_outlined),
              ),
            ],
          ),
          if (image != null)
            Expanded(
              child: Column(
                children: [
                  Expanded(child: Image.file(File(image!.path))),
                  ElevatedButton.icon(
                    onPressed: () {
                      setState(() {
                        image = null;
                      });
                    },
                    label: const Text('Upload'),
                    icon: const Icon(Icons.upload_outlined),
                  )
                ],
              ),
            )
          else
            const SizedBox(),
        ],
      ),
    );
  }
}





// ignore_for_file: avoid_unnecessary_containers

// import 'package:flutter/material.dart';
// import 'package:my_attendance/screens/home_screen.dart';

// class CreateTask extends StatelessWidget {

//   CreateTask({super.key});

//   TextEditingController locationController = TextEditingController();
//   TextEditingController  descriptionController = TextEditingController();
//     TextEditingController noteController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text("Create Task"),


//       ),
//       body: Center(
//         child: Container(
//           padding: const EdgeInsets.all(10),
//           height: 500,
//           width: 350,
//           decoration:   BoxDecoration(
//           color: Colors.blue[100],
//             borderRadius: BorderRadius.all(Radius.circular(12)),
//           ),
//           child: Column(
//             children: [
//               Padding(
//                                 padding: const EdgeInsets.all(12),
//                                 child: TextFormField(
//                                   controller: locationController,
//                                   decoration: const InputDecoration(
//                                     hintText: 'location',
//                                     labelText: 'location',
//                                     // icon: Icon(Icons.email),
//                                     errorStyle: TextStyle(fontSize: 18),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.red),
//                                         borderRadius:
//                                             BorderRadius.all(Radius.circular(9))),
//                                   ),
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'location';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                                 ),
//                               Padding(
//                                 padding: const EdgeInsets.all(12),
//                                 child: TextFormField(
//                                   controller: descriptionController,
//                                   decoration: const InputDecoration(
//                                     hintText: 'description',
//                                     labelText: 'description',
//                                     // icon: Icon(Icons.email),
//                                     errorStyle: TextStyle(fontSize: 18),
//                                     border: OutlineInputBorder(
//                                         borderSide: BorderSide(color: Colors.red),
//                                         borderRadius:
//                                             BorderRadius.all(Radius.circular(9))),
//                                   ),
//                                   validator: (value) {
//                                     if (value!.isEmpty) {
//                                       return 'description';
//                                     }
//                                     return null;
//                                   },
//                                 ),
//                                 ),
//                                 const SizedBox(height: 15,),
//                                 TextField(
//                                   maxLines: 6,
//                                   controller: noteController,
//                                 decoration: const InputDecoration(
//                                   hintText: "List  Activities",
//                                   label: Text("Activities"),
//                                   border: OutlineInputBorder(
//                                     borderSide: BorderSide(width: 2),
//                                     borderRadius: BorderRadius.all(Radius.circular(9)),
//                                   )
//                                 ),
//                                 ),
//                                                           Padding(
//                             padding: const EdgeInsets.all(28.0),
//                             child: GestureDetector(
//                               onTap: () {
//                                   Navigator.push(
//                                           context,
//                                     MaterialPageRoute(builder: (context) => const HomeScreen()),
//                                     );
//                               },
//                               child: Container(
//                                 alignment: Alignment.center,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                     color: Colors.green,
//                                     borderRadius: BorderRadius.circular(10)),
//                                 child: const Center(
//                                   child: Text('Save'),
//                                 ),
//                               ),
//                             ),
//                             //   ],
//                             // ),
//                           ),
//             ],
//           ),
//         ),
//       )

//     );
//   }
// }