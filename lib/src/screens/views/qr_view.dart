import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../../../access_model.dart'; // Importacion clase AccessModel
import 'consulta.dart'; // importacion de la pantalla Consulta

class MyCustomWidget extends StatefulWidget {
  // ignore: use_super_parameters
  const MyCustomWidget({Key? key}) : super(key: key);

  @override
  State<MyCustomWidget> createState() => _MyCustomWidgetState();
}

class _MyCustomWidgetState extends State<MyCustomWidget> {
  var getResult = 'QR Code Result';

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final colors = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Escaner QR'),
        automaticallyImplyLeading: false, // Elimina la flecha de devolución
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                scanQRCode();
              },
              child: const Text('Escanear Codigo QR'),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(getResult),
          ],
        ),
      ),
    );
  }

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancelar', true, ScanMode.QR);

      if (!mounted) return;

      final qrDataParts = qrCode.split(';');
      if (qrDataParts.length >= 4) {
        final rut = qrDataParts[0];
        final name = qrDataParts[1];
        final contratista = qrDataParts[2];

        final newAccess = AccessModel(
          rut: rut,
          nombre: name,
          contratista: contratista,
        );

        await Navigator.push(
          context,
          // ignore: inference_failure_on_instance_creation
          MaterialPageRoute(
            builder: (context) => Consulta(
              newAccess: newAccess,
            ),
          ),
        );
      } else {
        setState(() {
          getResult = 'QR Code inválido';
        });
      }

      // ignore: avoid_print
      print("QRCode_Result:--");
      // ignore: avoid_print
      print(qrCode);
    } on PlatformException {
      setState(() {
        getResult = 'Ha ocurrido un fallo al escanear.';
      });
    }
  }
}
