

import 'package:flutter/material.dart';

class Test2Page extends StatefulWidget {
  const Test2Page({super.key});

  @override
  State<Test2Page> createState() => _Test2PageState();
}

class _Test2PageState extends State<Test2Page> {
  //get appBarColor => null;
  double weight = 50; // Valor inicial del peso
  double height = 150; // Valor inicial de la altura
  double bmi = 0; // Variable para almacenar el resultado del IMC

 
  @override
  Widget build(BuildContext context) {
    bmi = calculateBMI(weight, height);
    Color appBarColor = calculateColor(bmi);

    return Scaffold(
      appBar: AppBar(
        title: Text(" IMC APP"),
        backgroundColor: appBarColor,
      ),
      
     Body:Padding(
      padding: EdgeInsets.all(10.0),
      child: Column( 
        children: [
          Text(
            "Bienvenido: Seleccione su peso y altura",
            textAlign: TextAlign.center,
            style: TextStyle(
                color: appBarColor,
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
          ],
        ),
      ),
    );
  }


double calculateBMI(double weight, double height) {
  double heightInMeters =height/100;
  return weight/(heightInMeters * heightInMeters);
}
Color calculateColor(double bmi){ 
  if (bmi<18.5){ 
    return Colors.blue;
    }else if (bmi <24.90){ 
      return Colors.green;
    }else if ( bmi < 29.90){ 
      return Colors.orange;
    }else{ 
      return Colors.red;
    }
    }
    }

