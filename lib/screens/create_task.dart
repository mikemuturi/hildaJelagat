import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
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

TimeOfDay _timeOfDay = const TimeOfDay(hour: 0, minute: 00);

DateTime _dateTime = DateTime.now();

  void _ShowTimePicker(){
    showTimePicker(context: context,
    initialTime: TimeOfDay.now()).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }


  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2050),
    ).then((value) {
      if (value != null) {
        setState(() {
          // Use toLocal() once to convert UTC time to local time
          _dateTime = DateTime(value.year, value.month, value.day).toLocal();
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Attendance"),
      ),
      body: Center(
        child: Material(
          elevation: 10.0,
            child: Container(
            padding: const EdgeInsets.all(10),
            height: 700,
            width: 350,
            decoration:  BoxDecoration(
              border: Border.all(color: Colors.white54),
              // color: Colors.blue[100],
              borderRadius: BorderRadius.circular(12),
              boxShadow: const [
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(5.0, 5.0)
                )
              ]
            ),
            child: Column(
              children: [
                const Gap(10),
                const Text("Clock In Details",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
                const Gap(25),
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
                Gap(10),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                      hintText: 'Location Description',
                      labelText: 'Location Description',
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
                const Gap(10),
                Row(
                  children: [
                    MaterialButton(onPressed: _ShowTimePicker,
                        child:  Padding(
                          padding:  const EdgeInsets.all(8.0),
                          child:  Text(_timeOfDay.format(context).toString(),
                          style: const TextStyle( fontSize: 30),),
                        ),
                        ),
                        MaterialButton(
                          onPressed: _showDatePicker,
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Text(
                              "${_dateTime.toLocal().toLocal()}".split(' ')[0], // Extracting only the date part
                              style: const TextStyle(fontSize: 20),
                            ),
                          ),
                        )

                  ],
                ),
                const Gap(20),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: TextField(
                    maxLines: 6,
                    controller: noteController,
                    decoration: const InputDecoration(
                      hintText: "Planned Day Activities ",
                      label: Text("Activities"),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(28.0),
                  child: GestureDetector(
                    onTap: () {
                      // Navigate to the home screen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const HomeScreen()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: const Center(
                        child: Text('Clock In',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                        ),),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
