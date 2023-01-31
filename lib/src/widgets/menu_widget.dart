import 'dart:io';

import 'package:flutter/material.dart';
import 'package:school_journey/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:school_journey/src/utils/utils.dart';



class MenuWidget extends StatelessWidget {
  final prefs = PreferenciasUsuario();
  static const IconData solecito = IconData(0xf0d1, fontFamily: 'MaterialIcons');
  @override
  Widget build(BuildContext context) {
    final String versionApp = 'Ver 1.0.8';  
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Expanded(child: 
            DrawerHeader(
              child: _userInfo(),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img/menu-img.jpg'),
                  fit: BoxFit.cover
                )
              ),
            ),
          ),

          Divider(height: 15.0,),
         
          ListTile(
            leading: Icon( Icons.house_rounded, color: Colors.cyan),
            title: Text(
                        'Home',
                          style: TextStyle(
                             fontSize: 16.0,
                             fontWeight: FontWeight.bold,
                             color: Colors.cyan,
                             fontFamily: 'Lato',
                          )  
                       ),



            onTap: (){
              Navigator.pushReplacementNamed(context, "dashboard");
            },
          ),

           Divider(height: 15.0,),
         
          ListTile(
            leading: Icon( Icons.brightness_7, color: Colors.cyan),
            title: Text(
                        'Todas las publicadas',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                            fontFamily: 'Lato',
                          )  
                       ),
            onTap: (){
              prefs.filtroActividad = '0';
              Navigator.pushReplacementNamed(context, "actividades");              
            },
          ),

           ListTile(
            leading: Icon( solecito, color: Colors.cyan),
            title: Text(
                        'Para hoy',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                            fontFamily: 'Lato',
                          )  
                       ),
            onTap: (){
              prefs.filtroActividad = '1';
              Navigator.pushReplacementNamed(context, "actividades");
            },
          ),

          ListTile(
            leading: Icon( Icons.brightness_6_rounded, color: Colors.cyan),
            title: Text(
                        'Semana corriendo',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                            fontFamily: 'Lato',
                          )  
                       ),
            onTap: (){
              prefs.filtroActividad = '2';
              Navigator.pushReplacementNamed(context, "actividades");
            },
          ),

          ListTile(
            leading: Icon( Icons.messenger_outline, color: Colors.cyan),
            title: Text(
                        'Mis notificaciones',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                            fontFamily: 'Lato', 
                          )  
                       ),
            onTap: (){
              Navigator.pushReplacementNamed(context, "notificaciones");
            },
          ),

         Divider(height: 15.0,),

         ListTile(
            leading: Icon( Icons.exit_to_app, color: Colors.cyan),
            title: Text(
                        'Logout',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.cyan,
                            fontFamily: 'Lato',
                          )  
                       ),
            onTap: (){
              prefs.borrarPrefs();
              mostrarAlerta( context, "Tu sessión ha cerrado correctamente. ¡Te esperamos!", "Hasta pronto" );
              Future.delayed(const Duration(milliseconds: 2000), () {
                exit(0);
              });

            },
          ),

           Divider(height: 15.0,),

          ListTile(            
              title: Text(
                          versionApp,
                          style: TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey,
                              fontFamily: 'Lato',
                            )  
                        ),            
            ),
         
        ],
      ), 
    );

  }


  Widget _userInfo(){
    
    final _foto = Container(
      width: 90.0,
      height: 90.0,
      margin: EdgeInsets.only(right: 20.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(50.00),
        child: Container(

            child: ( prefs.idInstitucion > 1 ) 
              ? FadeInImage(
                  placeholder: AssetImage( 'assets/img/loading.gif' ), 
                  image: NetworkImage('https://www.schooljourney.app/logos/logoInstituto'+prefs.idInstitucion.toString()+'.jpg')
                )
              : Image( image: AssetImage('assets/img/logoSJpeque.png'), )


        ),
      )
   
    );

    final _info = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: Text(prefs.nombre,
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontFamily: 'Lato',
                    )
            )
        ),
        Text(prefs.programa,
            style: TextStyle(
              fontSize: 15.0, 
              color: Colors.white, 
              fontFamily: 'Lato'
            )
        ),
        Text(prefs.institucion,
            style: TextStyle(
              fontSize: 15.0, 
              color: Colors.white, 
              fontFamily: 'Lato'
            )
        ),
      ],
    );

    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
      child: Row(
        children: <Widget>[
          _foto, 
          _info]
      ),
    );

  }


}