import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_attendance/screens/home_screen.dart'; // Import this package for date formatting

class CreateTask extends StatefulWidget {
  CreateTask({super.key});

  @override
  _CreateTaskState createState() => _CreateTaskState();
}

class _CreateTaskState extends State<CreateTask> {
  TextEditingController locationController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController noteController = TextEditingController();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );

    if (pickedTime != null && pickedTime != selectedTime) {
      setState(() {
        selectedTime = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Create Task"),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(10),
          height: 800,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  controller: locationController,
                  decoration: const InputDecoration(
                    hintText: 'Location',
                    labelText: 'Location',
                    errorStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Location is required';
                    }
                    return null;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: TextFormField(
                  controller: descriptionController,
                  decoration: const InputDecoration(
                    hintText: 'Description',
                    labelText: 'Description',
                    errorStyle: TextStyle(fontSize: 18),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Description is required';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(height: 15,),
              TextField(
                maxLines: 6,
                controller: noteController,
                decoration: const InputDecoration(
                  hintText: "List Activities",
                  label: Text("Activities"),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2),
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                ),
              ),
              const SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () => _selectDate(context),
                child: const Text('Select Date'),
              ),
              const SizedBox(height: 15,),
              ElevatedButton(
                onPressed: () => _selectTime(context),
                child: const Text('Select Time'),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.all(28.0),
                child: GestureDetector(
                  onTap: () {
                    // Handle the save logic with the selected date and time
                    final formattedDate = DateFormat('yyyy-MM-dd').format(selectedDate);
                    final formattedTime = selectedTime.format(context);
                    print('Date: $formattedDate, Time: $formattedTime');

                    // Navigate to the home screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const HomeScreen()),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text('Save'),
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
