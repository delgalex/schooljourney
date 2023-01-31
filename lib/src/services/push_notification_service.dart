import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:school_journey/src/preferencias_usuario/preferencias_usuario.dart';

class PushNotificationService {

  static FirebaseMessaging messaging = FirebaseMessaging.instance; //obtiene la instancia
  static String? token;
  static StreamController<String> _messageStream = new StreamController.broadcast();
  static Stream<String> get messageStream => _messageStream.stream;// get estatico para escuchar el stream y solo se expone el stream

  static Future _backgroundHandler( RemoteMessage message) async {
    //print('onBackground handler ${ message.messageId }');
    //cuando recibo una notificaciòn, lo añado al stream
    _messageStream.add( message.notification?.body ?? 'No titulo' );
  }

  static Future _onMessageHandler( RemoteMessage message) async {
    //print('onMessage handler ${ message.messageId }');
    _messageStream.sink.add( message.notification?.body ?? 'No titulo' );
  }

  static Future _onMessageOpenApp( RemoteMessage message) async {
    //print('onMessageOpenApp handler ${ message.messageId }');
    _messageStream.sink.add( message.notification?.body ?? 'No titulo' );
  }

  static Future initializeApp() async {
    // Push Notifications
    await Firebase.initializeApp();
    await requestPermission();
    //final fcmToken = await FirebaseMessaging.instance.getToken();
    final token = await FirebaseMessaging.instance.getToken();
    print('Token: obtenido de FireBase $token'); 
       
    final prefs = PreferenciasUsuario();   
    
    prefs.tokenFB = token!;
    
    FirebaseMessaging.onBackgroundMessage( _backgroundHandler );
    FirebaseMessaging.onMessage.listen( _onMessageHandler ); //aplicacion abierta
    FirebaseMessaging.onMessageOpenedApp.listen( _onMessageOpenApp ); //aplicacion abierta

  }
  
/// apple persmisos
  static requestPermission() async {
    NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional:  false,
      sound: true
    );

    print('Usuario notificaciones estatus ${ settings.authorizationStatus }');

  }

  static closeStreams(){ // cierra el Stream es obligatorio poner este metodo
    _messageStream.close();
  }

}