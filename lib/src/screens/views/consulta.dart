import 'package:flutter/material.dart';
import 'package:showcaseview/showcaseview.dart';
import 'package:intl/intl.dart';

import '../../../access_model.dart';

class Consulta extends StatelessWidget {
  final AccessModel newAccess;
  const Consulta({Key? key, required this.newAccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: ShowCaseWidget(
          builder: Builder(
            builder: (context) => MailPage(
              accessList: [
                AccessModel(
                  rut: '18638654k',
                  nombre: 'Juan Pérez',
                  contratista: 'Salmoneras SSA',
                  acceso: 'Entrada',
                  date:
                      DateFormat('dd/MM/yyyy HH:mm').parse('14/08/2023 15:10'),
                ),
                AccessModel(
                  rut: '210928489',
                  nombre: 'María González',
                  contratista: 'Mineras Toro.S',
                ),
                AccessModel(
                  rut: '210928489',
                  nombre: 'María González',
                  contratista: 'Mineras Toro.S',
                ),
                AccessModel(
                  rut: '210928489',
                  nombre: 'María González',
                  contratista: 'Mineras Toro.S',
                ),
                AccessModel(
                  rut: '210928489',
                  nombre: 'María González',
                  contratista: 'Mineras Toro.S',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MailPage extends StatefulWidget {
  final List<AccessModel> accessList;

  const MailPage({super.key, required this.accessList});

  @override
  State<MailPage> createState() => _MailPageState();
}

class _MailPageState extends State<MailPage> {
  late List<AccessModel> filteredAccessList;
  TextEditingController searchController = TextEditingController();
  RangeValues dateRange = const RangeValues(0, 100);

  @override
  void initState() {
    super.initState();
    filteredAccessList = widget.accessList;
  }

  void _filterAccessList(String query) {
    setState(() {
      filteredAccessList = widget.accessList
          .where((access) =>
              access.rut.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  void _filterAccessListByDate(RangeValues values) {
    setState(() {
      filteredAccessList = widget.accessList
          .where((access) =>
              access.date != null &&
              access.date!.isAfter(DateTime.now()
                  .subtract(Duration(days: values.end.toInt()))) &&
              access.date!.isBefore(DateTime.now()
                  .subtract(Duration(days: values.start.toInt()))))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: RangeSlider(
                    values: dateRange,
                    onChanged: (values) {
                      setState(() {
                        dateRange = values;
                        _filterAccessListByDate(dateRange);
                      });
                    },
                    min: 0,
                    max: 100,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_today),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              onChanged: _filterAccessList,
              decoration: const InputDecoration(
                labelText: 'Buscar por RUT',
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: filteredAccessList.length,
                itemBuilder: (context, index) {
                  final access = filteredAccessList[index];
                  return AccessListItem(access: access);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AccessListItem extends StatefulWidget {
  final AccessModel access;

  const AccessListItem({required this.access});

  @override
  State<AccessListItem> createState() => _AccessListItemState();
}

class _AccessListItemState extends State<AccessListItem> {
  bool showDetails = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(widget.access.rut),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.access.nombre),
              Text('Acceso: ${widget.access.acceso ?? ""}'),
              Text('Fecha: ${widget.access.date?.toString() ?? ""}'),
            ],
          ),
          trailing: ElevatedButton(
            onPressed: () {
              setState(() {
                showDetails = !showDetails;
              });
            },
            child: Text(showDetails ? 'Ver menos' : 'Ver más'),
          ),
        ),
        if (showDetails)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Contratista: ${widget.access.contratista ?? ""}'),
                Text('Ubicación: ${widget.access.ubicacion ?? ""}'),
                Text(
                    'Patente del vehículo: ${widget.access.patentevehiculo ?? ""}'),
                Text('Contacto: ${widget.access.contacto ?? ""}'),
                Text('Empresa visita: ${widget.access.empresavisita ?? ""}'),
                Text('Autorizado por: ${widget.access.autorizadopor ?? ""}'),
                Text('Observación: ${widget.access.observacion ?? ""}'),
                Text('Coordenadas: ${widget.access.coordenadas ?? ""}'),
                // Agregar más detalles aquí
              ],
            ),
          ),
        Divider(),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: Consulta(
      newAccess: AccessModel(
        rut: '1',
        rutcontratista: '1',
        nombre: 'a',
        acceso: 'entrada',
        ubicacion: '',
        patentevehiculo: '',
        contacto: '',
        empresavisita: '',
        autorizadopor: '',
        observacion: '',
        coordenadas: '',
        contratista: 'a',
        date: DateTime.now(),
      ),
    ),
  ));
}
