import 'package:flutter/material.dart';
import 'package:tupan/logic/controller/authenticate.dart';

class AuthProvider extends ChangeNotifier {
  final Authenticate _authenticate = Authenticate();
  String? _userId;
  bool _isAuthenticated = false;

  // Getter para saber si el usuario está autenticado
  bool get isAuthenticated => _isAuthenticated;

  // Getter para obtener el ID del usuario
  String? get userId => _userId;

  Future<bool> login(String username, String password) async {
    bool emailVerified = await _authenticate.auth(username, password);

    if (emailVerified) {
      _userId = username; // Almacena el nombre de usuario o ID del usuario
      _isAuthenticated = true;

      notifyListeners(); // Notifica a los oyentes sobre el cambio de estado
      return true; // Retorna verdadero si la autenticación fue exitosa
    } else {
      return false; // Retorna falso si la autenticación falló
    }
  }
}
