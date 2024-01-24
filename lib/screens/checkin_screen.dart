import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class CheckInScreen extends StatefulWidget {
  const CheckInScreen({Key? key}) : super(key: key);

  @override
  State<CheckInScreen> createState() => _CheckInScreen();
}

class _CheckInScreen extends State<CheckInScreen> {
  final _formKey = GlobalKey<FormState>();

 // TextEditingController _locationController = TextEditingController();
  String? _currentAddress;
  Position? _currentPosition;

 Future<bool> _handleLocationPermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location services are disabled. Please enable the services')));
      return false;
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Location permissions are denied')));
        return false;
      }
    }
    if (permission == LocationPermission.deniedForever) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
              'Location permissions are permanently denied, we cannot request permissions.')));
      return false;
    }
    return true;
  }

Future<void> _getCurrentPostion() async{
  final hasPermission = await _handleLocationPermission();

    if (!hasPermission) return;
    await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high)
        .then((Position position) {
      setState(() => _currentPosition = position);
      _getAddressFromLatLng(_currentPosition!);
    }).catchError((e) {
      debugPrint(e);
    });
}

 Future<void> _getAddressFromLatLng(Position position) async {
    await placemarkFromCoordinates(
            _currentPosition!.latitude, _currentPosition!.longitude)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress =
            '${place.street}, ${place.subLocality}, ${place.subAdministrativeArea}, ${place.postalCode}';
      });
    }).catchError((e) {
      debugPrint(e);
    });
  }

  @override
  void initState() {
    super.initState();
    _getCurrentPostion();
  }

  // void getLocation() async {
  //   try {
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);

  //     setState(() {
  //       _locationController.text =
  //           "Latitude:${position.latitude}. Longitude: ${position.longitude}";
  //     });
  //   } catch (e) {
  //     print("Error Getting location:$e");
  //   }
  // }
 // String _currentPos=_currentPosition!.latitude.toString();

 //final TextEditingController _locationController = TextEditingController(text: 'Lat: $_currentPos');

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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Text('LAT: ${_currentPosition?.latitude ?? ""}'),
              Text('LNG: ${_currentPosition?.longitude ?? ""}'),
              Text('ADDRESS: ${_currentAddress ?? ""}'),
              Text('address: ${_currentAddress}'),
              TextFormField(
                enabled:false,
                //controller: _locationController,
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
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _getCurrentPostion,
                child: const Text("Get Current Location"),
              ),
              const SizedBox(height: 20.0),
              ElevatedButton(
              child: const Text('Clock In'),
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

                  //String locationValue = _locationController.text;
                  //print("Location: $locationValue");
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
