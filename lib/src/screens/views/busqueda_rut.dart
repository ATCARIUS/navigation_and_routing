import 'package:flutter/material.dart';

class ConsultaPorRutScreen extends StatefulWidget {
  const ConsultaPorRutScreen({super.key});

  @override
  _ConsultaPorRutScreenState createState() => _ConsultaPorRutScreenState();
}

class _ConsultaPorRutScreenState extends State<ConsultaPorRutScreen> {
  String rut = '';
  String errorMessage = '';
  String resultadoConsulta = '';

  bool _validateRut(String input) {
    input = input.replaceAll('-', '').toLowerCase();
    if (input.length > 10) {
      return false;
    }
    final regex = RegExp(r'^(\d{1,9}k?)$');
    if (!regex.hasMatch(input)) {
      return false;
    }
    return true;
  }

  void _consultar() {
    if (_validateRut(rut)) {
      Map<String, String> data = {
        '123456789': 'Juan Pérez',
        '210928489': 'María González',
      };

      if (data.containsKey(rut)) {
        setState(() {
          resultadoConsulta = 'Nombre: ${data[rut]}';
          errorMessage = '';
        });

        // Navegar a la pantalla de formulario de ingreso de datos
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FormularioIngresoDatos(rut: rut),
          ),
        );
      } else {
        setState(() {
          resultadoConsulta = 'RUT no encontrado';
        });
      }
    } else {
      setState(() {
        resultadoConsulta = '';
        errorMessage = 'RUT inválido';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Consultar por RUT'),
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Ingrese el RUT:',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            TextField(
              onChanged: (value) {
                setState(() {
                  rut = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Ingresar sin puntos ni guion, Ejemplo: 205875689',
                errorText: errorMessage,
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _consultar,
              child: const Text('Consultar'),
            ),
            const SizedBox(height: 16),
            Text(
              resultadoConsulta,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

class FormularioIngresoDatos extends StatelessWidget {
  final String rut;
  FormularioIngresoDatos({required this.rut});

  final TextEditingController nombreController = TextEditingController();
  final TextEditingController rutContratistaController =
      TextEditingController();
  final TextEditingController accesoController = TextEditingController();
  final TextEditingController ubicacionController = TextEditingController();
  final TextEditingController patenteController = TextEditingController();
  final TextEditingController contactoController = TextEditingController();
  final TextEditingController empresaController = TextEditingController();
  final TextEditingController autorizadoController = TextEditingController();
  final TextEditingController observacionController = TextEditingController();
  final TextEditingController coordenadasController = TextEditingController();

  void _enviarDatos() {
    String nombre = nombreController.text;
    String rutContratista = rutContratistaController.text;
    String acceso = accesoController.text;
    String ubicacion = ubicacionController.text;
    String patente = patenteController.text;
    String contacto = contactoController.text;
    String empresa = empresaController.text;
    String autorizado = autorizadoController.text;
    String observacion = observacionController.text;
    String coordenadas = coordenadasController.text;

    // Aquí  se pueden enviar los datos a través de una API y manejar la respuesta
    // Se Utiliza los valores ingresados: rut, nombre, contratista, acceso, etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ingreso de Datos'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: nombreController,
              decoration: InputDecoration(labelText: 'Nombre'),
            ),
            TextFormField(
              controller: rutContratistaController,
              decoration: InputDecoration(labelText: 'RUT Contratista'),
            ),
            TextFormField(
              controller: accesoController,
              decoration: InputDecoration(labelText: 'Acceso'),
            ),
            TextFormField(
              controller: ubicacionController,
              decoration: InputDecoration(labelText: 'Ubicación'),
            ),
            TextFormField(
              controller: patenteController,
              decoration: InputDecoration(labelText: 'Patente Vehículo'),
            ),
            TextFormField(
              controller: contactoController,
              decoration: InputDecoration(labelText: 'Contacto'),
            ),
            TextFormField(
              controller: empresaController,
              decoration: InputDecoration(labelText: 'Empresa Visita'),
            ),
            TextFormField(
              controller: autorizadoController,
              decoration: InputDecoration(labelText: 'Autorizado por'),
            ),
            TextFormField(
              controller: observacionController,
              decoration: InputDecoration(labelText: 'Observación'),
            ),
            TextFormField(
              controller: coordenadasController,
              decoration: InputDecoration(labelText: 'Coordenadas'),
            ),
            ElevatedButton(
              onPressed: _enviarDatos,
              child: Text('Enviar Datos'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: ConsultaPorRutScreen()));
}
