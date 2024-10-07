import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:timezone/data/latest.dart' as tz;

class RealTimeClock extends StatefulWidget {
  const RealTimeClock({super.key});

  @override
  _RealTimeClockState createState() => _RealTimeClockState();
}

class _RealTimeClockState extends State<RealTimeClock> {
  late StreamController<DateTime> _timeController;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    tz.initializeTimeZones();
    _timeController = StreamController<DateTime>();

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final now = DateTime.now()
          .add(const Duration(hours: 2)); // Añade dos horas al tiempo actual
      _timeController.add(now);
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    _timeController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DateTime>(
      stream: _timeController.stream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final formattedTime = DateFormat('HH:mm:ss').format(snapshot.data!);
          return Text(
            formattedTime,
            style: const TextStyle(fontSize: 44),
          );
        } else {
          return const CircularProgressIndicator();
        }
      },
    );
  }
}
