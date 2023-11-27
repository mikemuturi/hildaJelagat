import 'package:flutter/material.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({Key? key}) : super(key: key);

  @override
  State<CheckInScreen> createState() => _CheckInScreen();
}

class _CheckInScreen extends State<CheckInScreen> {
  final _formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Check-In Screen',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.place,
                    color: Colors.red,
                  ),
                  hintText: 'Location',
                  labelText: 'Location',
                ),
              ),
              TextFormField(
                maxLines: 2,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.create,
                    color: Colors.red,
                  ),
                  hintText: 'Enter description of the location',
                  labelText: 'Location description',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please Enter the  description of the location';
                  }
                  return null;
                },
              ),
              TextFormField(
                maxLines: 4,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.edit_note,
                    color: Colors.red,
                  ),
                  hintText: 'Enter the planned daily activities',
                  labelText: 'Planned Activities',
                ),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please outline planned activities';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  // It returns true if the form is valid, otherwise returns false
                  if (_formKey.currentState!.validate()) {
                    // If the form is valid, display a Snackbar.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Data is in processing.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                },
                child: const Text('Clock In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
