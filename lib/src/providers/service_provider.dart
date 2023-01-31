import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:school_journey/src/models/avisos_model.dart';
import 'package:school_journey/src/models/estadistica_model.dart';
import 'package:school_journey/src/models/models.dart';
import 'package:school_journey/src/models/notificacion.dart';
import 'package:school_journey/src/models/notificacionesResponse.dart';
import 'package:school_journey/src/preferencias_usuario/preferencias_usuario.dart';

class ServiceProvider extends ChangeNotifier{
  
  final prefs = PreferenciasUsuario();
  String _baseUrl      = 'plataformasintegrales.com';

  List<Estadistica> muestraEstadistica = [];
  List<Aviso> muestraAviso = [];
  List<Actividad> muestraActividad = [];
  List<Notificacion> muestraNotificacion = [];

  ServiceProvider(){
    //print("provider inicializado ");
    //this.getDisplayEstadistica();
    //this.getDisplayAvisos();
  }

  getDisplayEstadistica() async{
    
    String _tipoUsuario  = prefs.perfil.toString();
    String _idUsuario    = prefs.idUsuario.toString();
    String _tokenSJ      = prefs.tokenSJ;
    
    var url = Uri.https(_baseUrl, 'v2/tareas/estadistica', {
      'tipoUsuario'  : _tipoUsuario,
      'id'           : _idUsuario,
      'tokenSJ'      : _tokenSJ
    });

    final response = await http.get(url);
    final Map<String, dynamic> decodificado = json.decode( response.body );
  

    if(decodificado['meta']['statusCode'] == '200'){
      final responseEstadistica = EstadisticaModel.fromJson(response.body);
      muestraEstadistica = responseEstadistica.resEstadisticas;
      notifyListeners(); //informa a todos los widget para que se redibujen cuando haya un cambio
    }else{
      print("Sin datos");
    }
    //print (responseEstadistica.resEstadisticas[0].misPuntos);
    // print( responseEstadistica.meta.statusCode );
     
  }

  getDisplayAvisos() async {
    
    String _tipoUsuario  = prefs.perfil.toString();
    String _idUsuario    = prefs.idUsuario.toString();
    String _tokenSJ      = prefs.tokenSJ;

     var url = Uri.https(_baseUrl, 'v2/tareas/avisos', {
      'tipoUsuario'  : _tipoUsuario,
      'id'           : _idUsuario,
      'tokenSJ'      : _tokenSJ
    });
    final response = await http.get(url);
    final responseAvisos = AvisosModel.fromJson(response.body);
   // print (responseAvisos.resAvisos[0].descripcion);
    muestraAviso = responseAvisos.resAvisos;
    notifyListeners(); //informa a todos los widget para que se redibu

  }

  getActividades() async {
    
    String _tipoUsuario  = prefs.perfil.toString();
    String _idUsuario    = prefs.idUsuario.toString();
    String _filtro      = prefs.filtroActividad;
    String _tokenSJ      = prefs.tokenSJ;
    
    var url = Uri.https(_baseUrl, 'v2/tareas/tareas', {
      'tipoUsuario'  : _tipoUsuario,
      'id'           : _idUsuario,
      'filtro'       : _filtro,
      'tokenSJ'      : _tokenSJ
    });

    //print(url);

    final response = await http.get(url);
    final Map<String, dynamic> decodificado = json.decode( response.body );
    //print(decodificado['meta']['statusCode']);
    if(decodificado['meta']['statusCode'] == '200'){
      final responseActividades = ActividadesResponse.fromJson(response.body);
      muestraActividad = responseActividades.resActividades;
      notifyListeners(); //informa a todos los widget para que se redibu
    }else if(decodificado['meta']['statusCode'] == '203'){
      //print("pa fuera");
      prefs.borrarPrefs();
       //mostrarAlerta( context, "Tu sessión ha cerrado correctamente. ¡Te esperamos!", "Hasta pronto" );
      //Future.delayed(const Duration(milliseconds: 2000), () {
      exit(0);
       //});
    }else{
      final responseActividades = ActividadesResponse.fromJson(response.body);
      muestraActividad = responseActividades.resActividades;
      notifyListeners(); //informa a
      //print("Sin datos");
    }
    
  }
  
  getNotificaciones() async {
    
    String _tipoUsuario  = prefs.perfil.toString();
    String _idUsuario    = prefs.idUsuario.toString();
    String _tokenSJ      = prefs.tokenSJ;
    
    var url = Uri.https(_baseUrl, 'v2/tareas/notificaciones', {
      'tipoUsuario'  : _tipoUsuario,
      'id'           : _idUsuario
    });
    final response = await http.get(url);
    final responseNotificaciones = NotificacionesResponse.fromJson(response.body);
    muestraNotificacion = responseNotificaciones.resNotificaciones;
    notifyListeners(); //informa a todos los widget para que se redibu
  }

}