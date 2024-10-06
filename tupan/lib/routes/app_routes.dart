import 'package:go_router/go_router.dart';
import 'package:tupan/presentation/screens/login_screen.dart';
import 'package:tupan/presentation/screens/screens.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      builder: (context, state) => const SignupScreen(),
    ),
    // GoRoute(
    //   path: '/contact',
    //   page: ContactPage(),
    // ),
    // GoRoute(
    //   path: '*',
    //   page: NotFoundPage(),
    // ),
  ],
);
