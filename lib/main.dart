import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:school_journey/src/pages/actividad_detalle.dart';
import 'package:school_journey/src/pages/pages.dart';
import 'package:school_journey/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:school_journey/src/providers/provider.dart';

import 'package:school_journey/src/services/push_notification_service.dart';

//sha1 52:82:64:5C:72:F9:84:CC:7A:EE:68:42:5F:71:F1:0A:5C:48:F5:D2
//Apple Key P8  ID:3Z625349JZ
// 
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();
  // esta linea nos permite que la clase pushnotifi... se cargue cuando este listo el context
 
  // cargamos la classe creada para cargar el token
  // cargamos las preferencias 
 
  runApp(CargaProviders());
} 

///////////////////////////////////////////////////////////////////////////////////
class CargaProviders extends StatefulWidget {  //cargamos  providers
  @override
  State<CargaProviders> createState() => _CargaProvidersState();
}
 
class _CargaProvidersState extends State<CargaProviders> {
  // estas llaves ayudan a navegar en pantallas al llegar la notificacion almacenan las referencias para despuès poder ser usadas
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ServiceProvider(), lazy: false),
        ChangeNotifierProvider(create: ( _ ) => LoginService()),
      ],
      child: MyApp(),
    );
  }
}
///////////////////////////////////////////////////////////////////////////////////


class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final prefs = new PreferenciasUsuario();
  final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  final GlobalKey<ScaffoldMessengerState> messengerKey = new GlobalKey<ScaffoldMessengerState>();

  @override
  void initState() { 
    super.initState();// ejecuto el servicio de notificaciones
     PushNotificationService.messageStream.listen(( message ) {  // me suscribo 
      //print( 'Mi app: $message ' );
      navigatorKey.currentState?.pushNamed('notificaciones');  // al recibir notifiacion vamos a la pantalla sin enviar argumenteos que es el segundo parametro
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'School Journey',
      initialRoute: prefs.tokenSJ == "login" ? 'login': 'dashboard',
      navigatorKey: navigatorKey, // Navegar 
      //scaffoldMessengerKey: , // snacks 
      routes: {
        'login'             : ( _ ) => LoginScreen(),
        'dashboard'         : ( _ ) => DashBoard(),
        'actividades'       : ( _ ) => Actividades(),
        'detalleActividad'  : ( _ ) => ActividadDetalle(),
        'notificaciones'    : ( _ ) => Notificaciones(),
      }
    );
  }
} 