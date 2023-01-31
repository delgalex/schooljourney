import 'dart:convert';
import 'package:school_journey/src/models/actividad.dart';


class ActividadesResponse {
    ActividadesResponse({
        required this.meta,
        required this.resActividades,
    });

    Meta meta;
    List<Actividad> resActividades;

    factory ActividadesResponse.fromJson(String str) => ActividadesResponse.fromMap(json.decode(str));

    factory ActividadesResponse.fromMap(Map<String, dynamic> json) => ActividadesResponse(
        meta: Meta.fromMap(json["meta"]),
        resActividades: List<Actividad>.from(json["resActividades"].map((x) => Actividad.fromMap(x))),
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
