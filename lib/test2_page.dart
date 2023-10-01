// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:flutter/material.dart';

class Test4Page extends StatefulWidget {
  const Test4Page({Key? key});

  @override
  State<Test4Page> createState() => _Test2PageState();
}

class _Test2PageState extends State<Test4Page> {
  double weight = 50; // Valor inicial del peso
  double height = 150; // Valor inicial de la altura
  double bmi = 0; // Variable para almacenar el resultado del IMC
  String message="Presiona el Boton";

  @override
  Widget build(BuildContext context) {
    bmi = calculateBMI(weight, height);
    Widget imageWithMessage = calculateImageWithMessage(bmi);

    return Scaffold(
      appBar: AppBar(
        title: Text("IMC APP"),
        backgroundColor: const Color.fromARGB(255, 10, 10, 10), // Cambiar el color del AppBar según tu preferencia
      ),
      body: Padding(
        padding: EdgeInsets.all(10.0),
        child: Column(
          children: [
            Text(
              "Bienvenido: Seleccione su peso y altura",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.blue, // Cambiar el color del texto según tu preferencia
                fontWeight: FontWeight.bold,
              ),
            ),
            Slider(
              min: 0,
              max: 150,
              value: weight,
              onChanged: (value) {
                setState(() {
                  weight = value;
                });
              },

              activeColor: Color.fromARGB(255, 219, 93, 9), // Cambia el color del área activa
              inactiveColor: Color.fromARGB(255, 143, 10, 219),
            ),
            Text("Peso: ${weight.toStringAsFixed(1)} kg"),
            Slider(
              min: 0,
              max: 250,
              value: height,
              onChanged: (value) {
                setState(() {
                  height = value;
                });
              },
              activeColor: Color.fromARGB(255, 219, 93, 9),
              inactiveColor: Color.fromARGB(255, 143, 10, 219),
            ),
            Text("Altura: ${height.toStringAsFixed(1)} cm"),
            ElevatedButton(
              onPressed: () {
                // Calcular el IMC cuando se presiona el botón "Calcular"
                setState(() {
                  bmi = calculateBMI(weight, height);
                  imageWithMessage = calculateImageWithMessage(bmi);
                });
              },
              child: Text("Calcular"),
            ),
            Text(
              "Su IMC es: ${bmi.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            imageWithMessage,
          ],
        ),
      ),
    );
  }

  double calculateBMI(double weight, double height) {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  
Widget calculateImageWithMessage(double bmi) {
  String message = "";
  Image image;

  if (bmi < 18.5) {
    image = Image.asset('assets/images/MUY_FLACO.JPG');
    message = "Tu IMC es menor que 18.5. Esto indica bajo peso.";
  } else if (bmi >= 18.5 && bmi < 24.90) {
    image = Image.asset("assets/images/SALUDABLE.JPG");
    message = "Tu IMC está en el rango saludable (18.5 - 24.9).";
  } else if (bmi >= 24.90 && bmi < 29.90) {
    image = Image.asset('assets/images/SOBRE_PESO.jpg');
    message = "Tienes sobrepeso (IMC entre 24.9 y 29.9).";
  } else {
    image = Image.asset('assets/images/OBESO.jpg');
    message = "Tienes obesidad (IMC mayor que 29.9).";
  }

  return Column(
    children: [
      image,
      SizedBox(height: 10), // Espacio entre la imagen y el mensaje
      Text(
        message,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    ],
  );
 }
 }