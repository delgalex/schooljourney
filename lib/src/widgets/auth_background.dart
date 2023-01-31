import 'package:flutter/material.dart';

class AuthBackground extends StatelessWidget {
  
  final Widget child;

  const AuthBackground({
    Key? key, 
    required this.child
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
     // color: Colors.red,
      width: double.infinity,
      height: double.infinity,
      child: Stack( // es una columna pero los pone unos sobre otros
        children: [
          _PurpleBox(),
          _HeaderIcon(),
          this.child,// esta es la caja de login se pasa como widget
        ],
      )
    );
  }
}

class _HeaderIcon extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SafeArea( // con el safearea evitamos el nouch
      child: Container(
        width: double.infinity,
        //height: 200, con esto identifico donde voya a estar trabajando
        //color: Colors.red,  porque se pinta el àrea
        margin: EdgeInsets.only( top: 30 ),
        child: Column(
            children: [
              Image.asset('assets/img/logoSJ2.png', width: 300.0),
              SizedBox( height: 10.0, width: double.infinity ),// este widget hace que la columna tome todo el ancho y centra todos los objetos de la columna            
            ],
          ),
      ),
    );
  }
}

//clase que arma la caja morada
class _PurpleBox extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: double.infinity,
      height: size.height * 0.4,
      decoration: _purpuleBackground(),
      child: Stack(
        children: [
          Positioned(child: _Bubble(), top: 90, left:30),
          Positioned(child: _Bubble(), top: -40, left:-30),
          Positioned(child: _Bubble(), top: -50, right:-20),
          Positioned(child: _Bubble(), bottom: -50, left:10),
          Positioned(child: _Bubble(), bottom: 120, right:20),
        ],
      ),
    );
  }

  BoxDecoration _purpuleBackground() => BoxDecoration( // metodo que arma el gradiente del fondo morado
    gradient: LinearGradient(
      colors: [
        Color.fromRGBO(50, 88, 211, 1),
        Color.fromRGBO(14, 69, 247, 1)
      ]
    )
  );
}
 
class _Bubble extends StatelessWidget { // clase que arma las burnujas

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100, 
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.5),
      ),   
    );
  }
}