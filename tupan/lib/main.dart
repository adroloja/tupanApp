import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tupan/data/providers/auth_provider.dart';
import 'package:tupan/data/providers/clock_provider.dart';
import 'package:tupan/presentation/themes/app_theme.dart';
import 'package:tupan/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => ClockProvider()),
      ],
      child: MaterialApp.router(
        title: 'Flutter Demo',
        routerConfig: appRouter,
        debugShowCheckedModeBanner: false,
        theme: AppTheme(selectedColor: 1).theme(),
      ),
    );
  }
}
