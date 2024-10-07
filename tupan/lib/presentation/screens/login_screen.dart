import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart'; // Asegúrate de importar provider
import 'package:tupan/data/providers/auth_provider.dart';
import 'package:tupan/data/repositories/authenticate.dart';
import 'package:tupan/utils/constants.dart';
import 'package:tupan/utils/secure_storage.dart';

class LoginScreen extends StatefulWidget {
  static const String NAME = "login";
  LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    final double iconSize = screenWidth * 0.69;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 55),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(
                //   height: screenHeight * 0.23,
                //   child: ImageIcon(
                //     const AssetImage('assets/logotipo.png'),
                //     size: iconSize,
                //   ),
                // ),
                SizedBox(
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Introduce un correo',
                      labelText: 'Correo',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, introduce un username';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  child: TextFormField(
                    controller: _passwordController,
                    obscureText: !_isPasswordVisible,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      hintText: 'Introduce la contraseña',
                      labelText: 'Contraseña',
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Por favor, introduce una contraseña';
                      }
                      return null;
                    },
                  ),
                ),
                const SizedBox(height: 6),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed('/recovery');
                  },
                  child: const Text("Olvidé la contraseña"),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _login,
                    child: _isLoading
                        ? const CircularProgressIndicator(color: Colors.white)
                        : const Text('Entrar'),
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "¿Aún no te has registrado?",
                  style: TextStyle(fontSize: 14, color: Colors.black87),
                ),
                const SizedBox(height: 4),
                TextButton(
                  onPressed: _isLoading ? null : _goToSignupScreen,
                  child: const Text('Regístrate'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _login() async {
    setState(() {
      _isLoading = true;
    });

    try {
      final String username = _usernameController.text.trim().toLowerCase();
      final String password = _passwordController.text;

      // Usar el AuthProvider para autenticar
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final bool isValid = await authProvider.login(username, password);

      if (isValid) {
        // Navegar a la pantalla principal
        context.go('/main'); // Ajusta esto a la ruta de tu pantalla principal
      } else {
        Fluttertoast.showToast(
          toastLength: Toast.LENGTH_LONG,
          msg:
              ' Error al iniciar sesión, compruebe que su correo está verificado y/o la contraseña sea correcta ',
        );
      }
    } catch (e) {
      Fluttertoast.showToast(
        toastLength: Toast.LENGTH_LONG,
        msg:
            ' Usuario y/o contraseña incorrectos. Por favor, inténtelo de nuevo ',
      );
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _goToSignupScreen() {
    // Navegar a la pantalla de registro
    context.go('/signup'); // Ajusta esto a la ruta de tu pantalla de registro
  }
}
