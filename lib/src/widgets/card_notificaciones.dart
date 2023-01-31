import 'package:flutter/material.dart';
import 'package:school_journey/src/models/notificacion.dart';


class CardNotificaciones extends StatelessWidget {

  final List<Notificacion> notificacion;

  const CardNotificaciones({Key? key, 
    required this.notificacion
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
            itemCount: notificacion.length,
            itemBuilder: (context, index){
              return _armaTarjeta(index, context, notificacion[index]);
            }
    );
  }

  Widget _armaTarjeta(int index, context, Notificacion notificacion){

   return Card(
            
            child: Container(
              padding: EdgeInsets.only(bottom:10),
    
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  _circulo(), 
                  Expanded(             
                    child:_descripcion(index)
                  )
                ],
              )
                
              ),
            
          );  
  }

  Widget _circulo(){
    return Container(
        margin: EdgeInsets.all(10.0),
        width: 25,
        height: 25,
        decoration: BoxDecoration(         
          shape:BoxShape.circle,
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/img/imagen1.jpg')
          )
        )
    );
  }

  Widget _descripcion (int index){
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,                
            children: [
              Text(
                notificacion[index].mensaje,        
              ),
              SizedBox(height: 10),
              Text(
                notificacion[index].fecha,
                style: TextStyle(color: Colors.blue),              
              ),
            ],
    );
  }

}