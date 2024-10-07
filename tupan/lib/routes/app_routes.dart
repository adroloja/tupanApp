import 'package:go_router/go_router.dart';
import '../routes/screens.dart';

final appRouter = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: LoginScreen.NAME,
      builder: (context, state) => LoginScreen(),
    ),
    GoRoute(
      path: '/signup',
      name: SignupScreen.NAME,
      builder: (context, state) => const SignupScreen(),
    ),
    GoRoute(
      path: '/main',
      name: MainScreen.NAME,
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: '/clock',
      name: ClockScreen.NAME,
      builder: (context, state) => ClockScreen(),
    ),
  ],
);
