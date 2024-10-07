import 'package:flutter/material.dart';
import 'package:tupan/presentation/widgets/custom_app_bar.dart';
import 'package:tupan/presentation/widgets/custom_drawer.dart';

class MainScreen extends StatefulWidget {
  static const String NAME = "main_screen";
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(),
      drawer: CustomDrawer(),
      body: SafeArea(child: Text("Hola")),
    );
  }
}
