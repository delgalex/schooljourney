import 'dart:convert';

import 'notificacion.dart';

class NotificacionesResponse {
    NotificacionesResponse({
      required this.meta,
      required this.resNotificaciones,
    });

    Meta meta;
    List<Notificacion> resNotificaciones;

    factory NotificacionesResponse.fromJson(String str) => NotificacionesResponse.fromMap(json.decode(str));

    factory NotificacionesResponse.fromMap(Map<String, dynamic> json) => NotificacionesResponse(
        meta: Meta.fromMap(json["meta"]),
        resNotificaciones: List<Notificacion>.from(json["resNotificaciones"].map((x) => Notificacion.fromMap(x))),
    );
}

class Meta {
    Meta({
        required this.statusCode,
        required this.message,
    });

    String statusCode;
    String message;

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        statusCode: json["statusCode"],
        message: json["message"],
    );

}
