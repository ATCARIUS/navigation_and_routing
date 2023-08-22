import 'package:bookstore/src/screens/qr_code.dart';
import 'package:bookstore/src/screens/settings.dart';
import 'package:bookstore/src/screens/views/busqueda_rut.dart';
import 'package:bookstore/src/screens/views/consulta.dart';
import 'package:connectivity_plus/connectivity_plus.dart'; // Agrega esta importación
import 'package:flutter/material.dart';

import '../../access_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    checkInternet();
  }

  Future<void> checkInternet() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    setState(() {
      isConnected = connectivityResult != ConnectivityResult.none;
    });
  }

  Widget buildMainScreen() {
    // ignore: unused_local_variable
    final colors = Theme.of(context).colorScheme;

    final screens = [
      const MyCustomWidget(),
      const ConsultaPorRutScreen(),
      isConnected
          ? Consulta(
              newAccess: AccessModel(
                  rut: '18638654k',
                  nombre: 'Juan Pérez',
                  contratista: 'Salmoneras SSA'),
            )
          : const Center(
              child: Text(
                  'No hay conexión a internet,\npor lo que no podrá acceder a todas las funciones.'),
            ),
      const SettingsScreen()
    ];

    return IndexedStack(
      index: selectedIndex,
      children: screens,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildMainScreen(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        currentIndex: selectedIndex,
        onTap: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        elevation: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            activeIcon: Icon(Icons.qr_code),
            label: 'Escáner QR',
            backgroundColor: Color.fromARGB(255, 21, 21, 148),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.perm_identity),
            activeIcon: Icon(Icons.perm_identity),
            label: 'Busqueda por Rut',
            backgroundColor: Color.fromARGB(255, 21, 21, 148),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_accessibility),
            activeIcon: Icon(Icons.settings_accessibility),
            label: 'Control de accesos',
            backgroundColor: Color.fromARGB(255, 21, 21, 148),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            activeIcon: Icon(Icons.settings),
            label: 'Configuracion',
            backgroundColor: Color.fromARGB(255, 21, 21, 148),
          ),
        ],
      ),
    );
  }
}
