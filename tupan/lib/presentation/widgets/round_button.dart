import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:tupan/data/models/clock.dart';
import 'package:tupan/data/providers/clock_provider.dart';
import 'package:tupan/utils/constants.dart';
import 'package:tupan/utils/geolocaion.dart';

class RoundButton extends StatefulWidget {
  final String activeText;
  final String inactiveText;

  const RoundButton({
    super.key,
    required this.activeText,
    required this.inactiveText,
  });

  @override
  _RoundButtonState createState() => _RoundButtonState();
}

class _RoundButtonState extends State<RoundButton> {
  final Geolocation _geolocation = Geolocation();
  Position? _currentPosition;
  String? _locationMessage;
  bool _isActive = true;
  Clock? lastClockData;
  bool isComplete = true;

  @override
  void initState() {
    super.initState();
    _fetchLastClockData();
    getGeolocation();
    setState(() {});
  }

  Future<Position?> getGeolocation() async {
    Position? position = await _geolocation.getCurrentLocation();
    if (position != null) {
      print(position);
    } else {
      print("Position es null");
    }
    return null;
  }

  Future<void> _fetchLastClockData() async {
    final clockProvider = Provider.of<ClockProvider>(context, listen: false);
    _isActive = await clockProvider.getLastClockAndEvaluate(Credentials.id!);
  }

  void _toggleButtonState() {
    setState(() {
      _isActive = !_isActive;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Confirmación'),
            content: Text(_isActive
                ? '¿Desea ${widget.activeText.toLowerCase()}?'
                : '¿Desea ${widget.inactiveText.toLowerCase()}?'),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  _toggleButtonState();

                  Navigator.of(context).pop();
                },
                child: const Text('Aceptar'),
              ),
            ],
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 92),
        backgroundColor: _isActive ? Colors.green : Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100),
        ),
      ),
      child: Text(
        _isActive ? widget.activeText : widget.inactiveText,
        style: const TextStyle(
          fontSize: 22,
          color: Colors.white,
        ),
      ),
    );
  }
}
