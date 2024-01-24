// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:my_attendance/screens/create_task.dart';
import 'package:my_attendance/screens/dashboard_screen.dart';
import 'package:my_attendance/screens/login_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ImagePickerScreen(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('DashBoard'),
//       ),
//       body: const Center(
//         child: Text('Welcome Back!'),
//       ),
//     );
//   }
// }

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  XFile? image;

  Future<void> uploadImage() async {
    try {
      if (image == null) {
        // No image selected
        return;
      }

      // Create a Dio instance for handling multipart/form-data requests
      Dio dio = Dio();

      // Send the image to the server using multipart/form-data
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(image!.path, filename: 'image.jpg'),
      });

      Response response = await dio.post(
        'http://102.220.23.55:8089/api/employees',
        data: formData,
      );

      // Check the response status code
      if (response.statusCode == 200) {
        // Successful request
        print('Success: ${response.data}');

        // Check if image match is found (adjust this condition based on your API response)
        if (response.data['imageMatch']) {
          // Navigate to the home page
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>  DashboardScreen()),
          );
        } else {
          // Handle the case when image match is not found
          // print('Image match not found');
          // ignore: use_build_context_synchronously
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>    CreateTask ()),
          );
        }
      } else {
        // Handle error response
        // ignore: avoid_print
        print('Error: ${response.statusCode}, ${response.data}');
      }
    } catch (error) {
      // Handle any exceptions that occur during the request
      // ignore: avoid_print
      print('Error: $error');
    }
  }

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
                    onPressed: uploadImage,
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
