import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuario {

  static final PreferenciasUsuario _instancia = new PreferenciasUsuario._internal();

  factory PreferenciasUsuario() {
    return _instancia;
  }

  PreferenciasUsuario._internal();
  // esta es la instancia inicializada que estara lista cuando la ocupaemos
  late SharedPreferences _prefs;//late = cuando ocupe las preferencias ya tendrán un valor

  initPrefs() async {
    this._prefs = await SharedPreferences.getInstance();
  }

  borrarPrefs()async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();  
  }

  // GET y SET de la última página

  String get programa {
    return _prefs.getString('programa') ?? '';
  }

  set programa( String value ) {
    _prefs.setString('programa', value);
  }



  String get institucion {
    return _prefs.getString('institucion') ?? '';
  }

  set institucion( String value ) {
    _prefs.setString('institucion', value);
  }

  int get idInstitucion {
    return _prefs.getInt('idInstitucion') ?? 0;
  }

  set idInstitucion( int value ) {
    _prefs.setInt('idInstitucion', value);
  }


  String get paterno {
    return _prefs.getString('paterno') ?? '';
  }

  set paterno( String value ) {
    _prefs.setString('paterno', value);
  }


  String get nombre {
    return _prefs.getString('nombre') ?? '';
  }

  set nombre( String value ) {
    _prefs.setString('nombre', value);
  }



  int get idUsuario {
    return _prefs.getInt('idUsuario') ?? 0;
  }

  set idUsuario( int value ) {
    _prefs.setInt('idUsuario', value);
  }



  int get perfil {
    return _prefs.getInt('perfil') ?? 0;
  }

  set perfil( int value ) {
    _prefs.setInt('perfil', value);
  }


  String get tokenSJ {
    return _prefs.getString('tokenSJ') ?? "login";
  }

  set tokenSJ( String value ) {
    _prefs.setString('tokenSJ', value);
  }

  String get tokenFB {
    return _prefs.getString('tokenFB') ?? '';
  }

  set tokenFB( String value ) {
    _prefs.setString('tokenFB', value);
  }

   String get filtroActividad {
    return _prefs.getString('filtroActividad') ?? '0';
  }

  set filtroActividad( String value ) {
    _prefs.setString('filtroActividad', value);
  }
  
}

