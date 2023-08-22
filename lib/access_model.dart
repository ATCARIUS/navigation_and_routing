class AccessModel {
  final String rut;
  final String nombre;
  final String contratista;
  final String? rutcontratista; // Opcional
  final String? ubicacion; // Opcional
  final String? patentevehiculo; // Opcional
  final String? contacto; // Opcional
  final String? empresavisita; // Opcional
  final String? autorizadopor; // Opcional
  final String? observacion; // Opcional
  final String? acceso; // Opcional
  final String? coordenadas; // Opcional
  final DateTime? date; // Opcional

  AccessModel({
    required this.rut,
    required this.nombre,
    required this.contratista,
    this.rutcontratista,
    this.ubicacion,
    this.patentevehiculo,
    this.contacto,
    this.empresavisita,
    this.autorizadopor,
    this.observacion,
    this.acceso,
    this.coordenadas,
    this.date,
  });
}
