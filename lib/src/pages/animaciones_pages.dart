import 'package:flutter/material.dart';
import 'dart:math' as Math;

class AnimacionPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  CuadradoAnimado(),
      ),
    );
  }
}


// clase que construye el cuadrddo
class CuadradoAnimado extends StatefulWidget {

  @override
  _CuadradoAnimadoState createState() => _CuadradoAnimadoState();
}

class _CuadradoAnimadoState extends State<CuadradoAnimado> with SingleTickerProviderStateMixin {

  // controladores de las animaciones 
  AnimationController  controller;
  Animation<double> rotacion;
  Animation<double> opacidad;
  Animation<double> opacidadOut;
  Animation<double> moverDerecha;
  Animation<double> agrandar;


  @override
  void initState() {
    
    controller = new AnimationController(vsync: this, duration: Duration(milliseconds: 4000));

    rotacion = Tween( begin: 0.0, end: 2 * Math.pi ).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    opacidad = Tween(begin: 0.1, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0, 0.25, curve: Curves.easeOut))
    );

    opacidadOut = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: controller, curve: Interval(0.75, 1.0, curve: Curves.easeOut))
    );

    moverDerecha = Tween(begin: 0.0, end: 200.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    agrandar = Tween(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(parent: controller, curve: Curves.easeOut)
    );

    controller.addListener((){

      // print('Status: ${controller.status}');
      if( controller.status == AnimationStatus.completed ) {
       // controller.reverse();
        controller.reset();
      }
          
    });

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
   
   // con esta opcion le estamos dando inicio a la animacion
   controller.forward();
   
   return AnimatedBuilder(
     animation: controller,
      child: _Cuadrado(),
     builder: (BuildContext context, Widget childCuadrado) {
       return Transform.translate(
         offset: Offset(moverDerecha.value, 0),
          child: Transform.rotate(
           angle: rotacion.value,
           child: Opacity(
             opacity: opacidad.value - opacidadOut.value,
             child: Transform.scale(
               scale: agrandar.value,
               child:  childCuadrado
               ),
             )
           ),
       );
         
     },
   );
  }
}





class _Cuadrado extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
    return Container(
       width: 70,
       height: 70,
       decoration: BoxDecoration(
         color: Colors.red
       ),
     );
   }
}

