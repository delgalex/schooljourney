import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_journey/src/providers/provider.dart';
import 'package:school_journey/src/widgets/card_actividades.dart';
import 'package:school_journey/src/widgets/menu_widget.dart';

class Actividades extends StatelessWidget {
  const Actividades({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final serviceProvider = Provider.of<ServiceProvider>(context);
    serviceProvider.getActividades();

      return SafeArea(
          child: Scaffold(
        
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
                    
                      Text('Mis actividades',
                            style: TextStyle(fontFamily: 'Lato',fontSize: 16.0,fontWeight: FontWeight.bold),
                          )
                    ]
                  )
                ),
          
          drawer: MenuWidget(),
          body: Container(
              padding: EdgeInsets.only(top: 10.0),
              child: CardActividades( actividad: serviceProvider.muestraActividad),
            ) 
      ),
    );
  }

}


 