// DetallesUsuarioScreen.dart
import 'package:bookstore/access_model.dart';
import 'package:flutter/material.dart';

class DetallesUsuarioScreen extends StatelessWidget {
  final AccessModel access;

  const DetallesUsuarioScreen({Key? key, required this.access})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles de Usuario'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('RUT: ${access.rut}'),
          Text('Nombre: ${access.nombre}'),
          Text('Contratista: ${access.contratista}'),
          Text('Ubicación: ${access.ubicacion}'),
          Text('Patente Vehículo: ${access.patentevehiculo}'),
          Text('Contacto: ${access.contacto}'),
          Text('Empresa Visita: ${access.empresavisita}'),
          Text('Autorizado por: ${access.autorizadopor}'),
          Text('Observación: ${access.observacion}'),
          Text('Acceso: ${access.acceso}'),
          Text('Coordenadas: ${access.coordenadas}'),
          Text('Fecha: ${access.date}'),
          // ... otros detalles
        ],
      ),
    );
  }
}
