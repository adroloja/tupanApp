import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tupan/presentation/screens/login_screen.dart';
import 'package:tupan/routes/screens.dart';
import 'package:tupan/utils/constants.dart';
import 'package:tupan/utils/secure_storage.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 30.0),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 2),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.close,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  CircleAvatar(
                    radius: 50.0,
                    backgroundImage: const NetworkImage(
                        'https://www.example.com/imagen_perfil.jpg'),
                  ),
                  //   CircleAvatar(
                  //   radius: 50.0,
                  //   backgroundImage: Credentials.selfie != null
                  //       ? FileImage(Credentials.selfie!)
                  //       : const NetworkImage(
                  //           'https://www.example.com/imagen_perfil.jpg'),
                  // ),
                  const SizedBox(height: 10.0),
                  Text(
                    Credentials.username!.toUpperCase(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  // TextButton(
                  //   onPressed: () {
                  //     Navigator.of(context).pushNamed('/profile');
                  //   },
                  //   child: const Text(
                  //     "Editar perfil",
                  //     textAlign: TextAlign.center,
                  //     style: TextStyle(
                  //       fontSize: 16.0,
                  //       color: Colors.blue,
                  //     ),
                  //   ),
                  // )
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pushReplacementNamed("/code");
                },
                child: Container(
                  height: 110,
                  width: MediaQuery.of(context).size.width * 0.43,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Icon(Icons.assignment_turned_in, size: 40),
                      Icon(Icons.euro, size: 50),
                      SizedBox(height: 8),
                      Text(
                        "Realizar ventas",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  context.pushNamed(ClockScreen.NAME);
                },
                child: Container(
                  height: 110,
                  width: MediaQuery.of(context).size.width * 0.43,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.route, size: 50),
                      SizedBox(height: 8),
                      Text(
                        "Ir a ruta",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14.0),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.home_filled),
                        title: const Text('Principal'),
                        onTap: () {
                          Navigator.of(context).pushNamed('/terms');
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.watch_later_outlined),
                        title: Text('Fichar'),
                        onTap: () {
                          context.pushNamed(ClockScreen.NAME);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.fact_check),
                        title: Text('Cobrar a clientes'),
                        onTap: () {
                          Navigator.of(context).pushNamed('/inst');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.people_alt_outlined),
                        title: const Text('Gestionar clientes'),
                        onTap: () {
                          Navigator.of(context).pushNamed('/help');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.edit_document),
                        title: const Text('Crear factura'),
                        onTap: () {
                          Navigator.of(context).pushNamed('/priv_menu');
                        },
                      ),
                      ListTile(
                        leading: const Icon(Icons.info_outline),
                        title: const Text('Sobre nosotros'),
                        onTap: () {
                          Navigator.of(context).pushNamed('/terms');
                        },
                      ),
                      // ListTile(
                      //   leading: const Icon(Icons.info_outlined),
                      //   title: const Text('Sobre nosotros'),
                      //   onTap: () {
                      //     Navigator.of(context).pushNamed('/about');
                      //   },
                      // ),
                      ListTile(
                        leading: const Icon(
                          Icons.logout,
                          color: Colors.red,
                        ),
                        title: const Text(
                          'Cerrar sesión',
                          style: TextStyle(
                            color: Colors.red,
                          ),
                        ),
                        onTap: () => _logout(context),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    SecureStorage.delete(key: "username");
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => LoginScreen(),
      ),
    );
  }
}
