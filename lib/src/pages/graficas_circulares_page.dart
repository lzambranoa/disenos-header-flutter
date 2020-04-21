import 'package:flutter/material.dart';


import 'package:disenos_app/src/widgets/radial_progress.dart';

class GraficasCircularesPage extends StatefulWidget {

  @override
  _GraficasCircularesPageState createState() => _GraficasCircularesPageState();
}

class _GraficasCircularesPageState extends State<GraficasCircularesPage> {

  double porcentaje = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        onPressed: (){
          setState(() {
            porcentaje += 10;
            if(porcentaje > 100){
              porcentaje = 0;
            }
          });
        }
        ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            CustomRadialProgress(porcentaje: porcentaje, color: Colors.red),
            CustomRadialProgress(porcentaje: porcentaje, color: Colors.green),

          ],),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
            CustomRadialProgress(porcentaje: porcentaje, color: Colors.pink),
            CustomRadialProgress(porcentaje: porcentaje, color: Colors.blue),
          ])
        ]
      )
    );
  }
}

class CustomRadialProgress extends StatelessWidget {

  final Color color;

  const CustomRadialProgress({
    @required this.porcentaje,
    @required this.color
  });

  final double porcentaje;

  @override
  Widget build(BuildContext context) {
    return Container(
      
      width: 150,
      height: 150,
      child: RadialProgress(
        porcentaje: porcentaje,
        colorPrimario: this.color,
        colorSecundario: Colors.grey,
        grosorPrimario: 4,
        grosorSecundario: 10,
        ),
    );
  }
}