import 'package:flutter/material.dart';
import 'package:tupan/presentation/widgets/custom_app_bar.dart';
import 'package:tupan/presentation/widgets/custom_drawer.dart';
import 'package:tupan/presentation/widgets/real_time_clock.dart';
import 'package:tupan/presentation/widgets/round_button.dart';

class ClockScreen extends StatefulWidget {
  static const String NAME = "clock_screen";
  const ClockScreen({Key? key}) : super(key: key);

  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SafeArea(
          child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            RealTimeClock(),
            RoundButton(
                activeText: "Empezar jornada", inactiveText: "Terminar jornada")
          ],
        ),
      )),
    );
  }
}
