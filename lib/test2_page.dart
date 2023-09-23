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

  @override
  Widget build(BuildContext context) {
    bmi = calculateBMI(weight, height);
    Image image = calculateImage(bmi);

    return Scaffold(
      appBar: AppBar(
        title: Text("IMC APP"),
        backgroundColor: Colors.blue, // Cambiar el color del AppBar según tu preferencia
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
            ),
            Text("Altura: ${height.toStringAsFixed(1)} cm"),
            ElevatedButton(
              onPressed: () {
                // Calcular el IMC cuando se presiona el botón "Calcular"
                setState(() {
                  bmi = calculateBMI(weight, height);
                  image = calculateImage(bmi);
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
            image,
          ],
        ),
      ),
    );
  }

  double calculateBMI(double weight, double height) {
    double heightInMeters = height / 100;
    return weight / (heightInMeters * heightInMeters);
  }

  Image calculateImage(double bmi) {
    if (bmi < 18.5) {
      return Image.asset('assets/images/flaco.jpg');
    } else if (bmi < 24.90) {
      return Image.asset('assets/images/gordo.jpg');
    } else if (bmi < 29.90) {
      return Image.asset('assets/images/gordo.png');
    } else {
      return Image.asset('assets/images/ramon.jpg');
    }
  }
}


