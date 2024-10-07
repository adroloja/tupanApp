import 'package:flutter/material.dart';
import 'package:tupan/presentation/widgets/custom_app_bar.dart';
import 'package:tupan/presentation/widgets/custom_drawer.dart';

class ClockScreen extends StatefulWidget {
  static const String NAME = "clock_screen";
  const ClockScreen({Key? key}) : super(key: key);

  @override
  _ClockScreenState createState() => _ClockScreenState();
}

class _ClockScreenState extends State<ClockScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SafeArea(
        child: Text("clock"),
      ),
    );
  }
}
