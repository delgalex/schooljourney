import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_journey/src/providers/service_provider.dart';
import 'package:school_journey/src/widgets/card_estadistica.dart';
import 'package:school_journey/src/widgets/card_mensajes.dart';
import 'package:school_journey/src/widgets/menu_widget.dart';

class DashBoard extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
     // ve al arbol de widgets, busca EstadisticaProvider y la instancia colocala en estadisticaProvider  
     //(context, listen:true ) por defecto esta en true es para que se redibuje cuando haya cambios        
    final serviceProvider = Provider.of<ServiceProvider>(context);
    serviceProvider.getDisplayEstadistica();
    serviceProvider.getDisplayAvisos();
    //print(estadisticasProvider.muestraEstadistica);
    
    return  Scaffold(      
            appBar:AppBar(
      
              title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:<Widget>[               
                        Container(
                        child: Image(                  
                          image: AssetImage('assets/img/avioncito.png'),
                          width: 120.0,
                        ),
                      ),
                    
                      Text('Home',
                            style: TextStyle(fontFamily: 'Lato',fontSize: 16.0,fontWeight: FontWeight.bold),
                          )
                    ]
                  )
            ),
          drawer: MenuWidget(),  
          body: SingleChildScrollView(
            
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/fondo2.jpg'),
                  //fit: BoxFit.cover
                )
              ),
              child: Column(
                children: [
                  CardEstadistica( estadistica: serviceProvider.muestraEstadistica),
                  CardMensajes( avisos: serviceProvider.muestraAviso ),
                ],
              ),
            ),
          ),
            
    );
  }
}