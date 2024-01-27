import 'package:flutter/material.dart';


class Show extends StatefulWidget {
  const Show({super.key});

  @override
  State<Show> createState() => _ShowState();
}

class _ShowState extends State<Show> {
  TimeOfDay _timeOfDay = TimeOfDay(hour: 0, minute: 00);

  void _ShowTimePicker(){
    showTimePicker(context: context,
    initialTime: TimeOfDay.now()).then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: MaterialButton(onPressed: _ShowTimePicker,
        child:  Padding(
          padding:  const EdgeInsets.all(8.0),
          child:  Text(_timeOfDay.format(context).toString(),
          style: const TextStyle( fontSize: 30),),
        ),
        color: Colors.blue,
        ),
      ),
    );
  }
}