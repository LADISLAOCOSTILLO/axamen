

import 'package:flutter/material.dart';

class Test2Page extends StatefulWidget {
  const Test2Page({super.key});

  @override
  State<Test2Page> createState() => _Test2PageState();
}

class _Test2PageState extends State<Test2Page> {
  get appBarColor => null;
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
        backgroundColor:  Colors.amber,
      ),
        );
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

            
        ],
      ),

      );
              
  }

}


}