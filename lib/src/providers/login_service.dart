import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:school_journey/src/preferencias_usuario/preferencias_usuario.dart';

class LoginService extends ChangeNotifier {
  final prefs = PreferenciasUsuario();
  String _url = 'plataformasintegrales.com';

  Future<String?> login( String email, String password) async{

     final url = Uri.https(_url, 'v2/tareas/login', {
      'user'  : email,
      'clave' : password
    });
   
    final resp = await http.get( url );
    Map<String, dynamic> decodedResp = json.decode( resp.body );
    //print(decodedResp['meta']['code']);      
    if( decodedResp['meta']['statusCode'] == '200' ){

      int perfil = decodedResp['resActividades'][0]['idPerfil'];
      int idUsuario = decodedResp['resActividades'][0]['idUsuario'];
      String nombre = decodedResp['resActividades'][0]['nombre'];
      String paterno = decodedResp['resActividades'][0]['paterno'];
      String institucion = decodedResp['resActividades'][0]['institucion'];
      String programa = decodedResp['resActividades'][0]['programa'];
      String tokenSJ = decodedResp['resActividades'][0]['sTokenSJ'];
      int idInstitucion = decodedResp['resActividades'][0]['idInstitucion'];

      prefs.perfil = perfil;
      prefs.idUsuario = idUsuario;
      prefs.nombre = nombre;
      prefs.paterno = paterno;
      prefs.institucion = institucion;
      prefs.programa = programa;
      prefs.tokenSJ = tokenSJ; 
      prefs.idInstitucion = idInstitucion;  
      tokenFB();
      return null;
    }else{
      //print("I have a problem whith a login");
      return(decodedResp['meta']['message']);
    }
  
  }

  Future<String> tokenFB() async {

    final url = Uri.https(_url, 'v2/tareas/tokenFB', {
      'user': prefs.idUsuario.toString(),
      'perfil': prefs.perfil.toString(),
      'tokenFB': prefs.tokenFB
    });
    print(prefs.tokenFB);
    print(url);
    final resp = await http.get( url );
    Map<String, dynamic> decodedResp = json.decode( resp.body );
    return(decodedResp['meta']['statusCode']); 
  }

}