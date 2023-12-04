// ignore_for_file: use_build_context_synchronously

import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:my_attendance/screens/dashboard_screen.dart';
import 'package:http/http.dart';
import 'package:my_attendance/screens/profile_setting_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  // Map userData = {};
  final _formKey = GlobalKey<FormState>();

  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void login(String username, password) async {
    try {
      Response response = await post(
          Uri.parse('http://102.220.23.55:8089/api/auth/login/'),
          body: {'username': username, 'password': password});

      var statusCode = response.statusCode;
      print('$statusCode');

      if (response.statusCode == 200) {
        var data = jsonDecode(response.body.toString());
        print(data['token']);

        var is_employee = data['user']['is_employee'];
        print('$is_employee');

        if (is_employee == 'true') {
       
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );

          print('profile created');
        } else {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const ProfileSettingScreen()),
          );
          print('profile not created');
        }
      } else {
        print('failed');
      }
    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 30),
                child: Center(
                  child: Container(
                    width: 120,
                    height: 120,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(40)),
                    child: Image.asset('assets/images/logo.png'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(12),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextFormField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                            hintText: 'Username',
                            labelText: 'Username',
                            icon: Icon(Icons.email),
                            errorStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Username';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12),
                        child: TextFormField(
                          controller: passwordController,
                          decoration: const InputDecoration(
                            hintText: 'Passowrd',
                            labelText: 'Enter Password',
                            icon: Icon(Icons.email),
                            errorStyle: TextStyle(fontSize: 18),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.red),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(9))),
                          ),
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter password';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(28.0),
                        //   child: Container(
                        //     width: MediaQuery.of(context).size.width,
                        //     height: 50,
                        //     child: ElevatedButton(
                        //       child: const Text(
                        //         'Login',
                        //         style:
                        //             TextStyle(color: Colors.white, fontSize: 22),
                        //       ),
                        //       onPressed: () {
                        //         if (_formKey.currentState!.validate()) {
                        //           print('form submiitted');
                        //           // login(usernameController.text.toString(), passwordController.text.toString());

                        //           Navigator.push(
                        //             context,
                        //             MaterialPageRoute(
                        //                 builder: (context) =>
                        //                     const DashboardScreen()),
                        //           );
                        //         }
                        //       },
                        //       // shape: RoundedRectangleBorder(
                        //       //     borderRadius: BorderRadius.circular(30)),
                        //       // color: Colors.blue,
                        //     ),
                        //   ),
                        child: GestureDetector(
                          onTap: () {
                            //login();
                            //print('Login username: $username');

                            login(usernameController.text.toString(),
                                passwordController.text.toString());
                          },
                          child: Container(
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)),
                            child: const Center(
                              child: Text('Login'),
                            ),
                          ),
                        ),
                        //   ],
                        // ),
                      ),
                    ],
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
