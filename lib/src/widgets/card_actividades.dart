import 'package:flutter/material.dart';
import 'package:school_journey/src/models/actividad.dart';


//arma la card de todas las actividades asignadas al alumno

class CardActividades extends StatelessWidget {

  final List<Actividad> actividad;

  CardActividades({
    required this.actividad
    });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: actividad.length,
            itemBuilder: (context, index){
              return _armaTarjeta(index, context, actividad[index]);
            }
    );
  }

  Widget _armaTarjeta(int index, context, Actividad actividad){
   int _numima = actividad.idTipoCategoria;
   return GestureDetector(
            //onTap: ()=> Navigator.push(context, 'actividadDetalle', arguments: actividades[index]),
            onTap: ()=> Navigator.pushNamed(context, 'detalleActividad', arguments: actividad),
            child: Card(
            //elevation: 10.0,
            //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    _circulo(_numima), 
                    Expanded(             
                    child:_descripcion(index)
                    )
                  ],
                )
              ],
            ),
          ),
      );   
  }

  Widget _circulo(int numIma){
    return Container(
        margin: EdgeInsets.all(10.0),
        width: 50,
        height: 50,
        decoration: BoxDecoration(         
          shape:BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/imagen$numIma.jpg')
          )
        )
    );
  }

  Widget _descripcion (int index){
  return  Row(
           // mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
                Column(
                crossAxisAlignment: CrossAxisAlignment.start,                
                  children: [
                    Container(
                      width: 200.0,  
                      child: Text(
                        actividad[index].actividad,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontFamily: "LATO",fontSize: 15.0, fontWeight: FontWeight.bold)             
                      ),
                    ),
                    Text(
                      actividad[index].fechaInicio,
                      style: TextStyle(fontFamily: "LATO",fontSize: 13.0),              
                    ),
                  ],
                ),
            //  SizedBox(width: 20.0),
              
               Expanded(
                 child: Container(
                   padding: EdgeInsets.all(10.0),
                   child: Column(               
                     crossAxisAlignment: CrossAxisAlignment.end, 
                     children: <Widget>[  
                       Text(
                          actividad[index].categoria,
                          style: TextStyle(fontFamily: "LATO",fontSize: 10.0),
                        ),
                     ]
                    ),
                 ),
               )                              

            ],
          );
      
  }

}