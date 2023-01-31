import 'dart:convert';

class Notificacion {
    Notificacion({
        required this.mensaje,
        required this.fecha,
    });

    String mensaje;
    String fecha;

    factory Notificacion.fromJson(String str) => Notificacion.fromMap(json.decode(str));

    factory Notificacion.fromMap(Map<String, dynamic> json) => Notificacion(
        mensaje: json["mensaje"],
        fecha: json["fecha"],
    );
}
