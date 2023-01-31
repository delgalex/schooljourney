import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:school_journey/src/models/aviso.dart';

class CardMensajes extends StatelessWidget {
 
  final List<Aviso> avisos;

  const CardMensajes({
    Key? key, 
    required this.avisos
    }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height * 0.7,
      
      //color: Colors.red,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          if ( this.avisos.length>0)
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Text("Avisos",  style: TextStyle(
                             fontSize: 16.0,
                             fontWeight: FontWeight.bold,
                             color: Colors.cyan,
                             fontFamily: 'Lato',
                          )  
                       ),
              
            ),

          SizedBox( height:5 ),

          Expanded(
            child:(
              ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: avisos.length,
                itemBuilder: ( _ , int index) => _AvisosLetrero( avisos[index] ) 
              )
            )
          )
         

        ],
        
      ),
    );
  }
}

class _AvisosLetrero extends StatelessWidget {
  final Aviso avisos;

  const _AvisosLetrero( this.avisos );

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: (
             Html( data: avisos.descripcion)
            ),

    );
  }
}