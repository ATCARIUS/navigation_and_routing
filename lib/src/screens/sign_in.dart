import 'package:bookstore/src/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:rut_utils/rut_utils.dart';

var rut = '111111119';
var formattedRut = formatRut(rut); // 11.111.111-9
var isValid = isRutValid(rut);

class MyLogin extends StatefulWidget {
  const MyLogin({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: const EdgeInsets.only(left: 25, top: 140),
              child: const Text(
                'Bienvenido a\nCertilap Control',
                style: TextStyle(
                    color: Color.fromARGB(255, 21, 21, 148), fontSize: 40),
              ),
            ),
            SingleChildScrollView(
                child: Container(
              padding: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.45),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "ID",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: const TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Contraseña",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Iniciar Sesion',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor:
                                    const Color.fromARGB(255, 21, 21, 148),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          // ignore: inference_failure_on_instance_creation
                                          MaterialPageRoute(builder: (context) {
                                        return const MainScreen();
                                      }));
                                    },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          const Row()
                        ],
                      ))
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
