
import 'dart:convert';
import 'estadistica.dart';

class EstadisticaModel {

    EstadisticaModel({
        required this.meta,
        required this.resEstadisticas,
    });

    Meta meta;
    List<Estadistica> resEstadisticas;

    factory EstadisticaModel.fromJson(String str) => EstadisticaModel.fromMap(json.decode(str));

    factory EstadisticaModel.fromMap(Map<String, dynamic> json) => EstadisticaModel(
        meta: Meta.fromMap(json["meta"]),
        resEstadisticas: List<Estadistica>.from(json["resEstadisticas"].map((x) => Estadistica.fromMap(x))),
    );
}

class Meta {
    Meta({
       required this.statusCode,
       required  this.message,
    });

    String statusCode;
    String message;

    factory Meta.fromJson(String str) => Meta.fromMap(json.decode(str));

    factory Meta.fromMap(Map<String, dynamic> json) => Meta(
        statusCode: json["statusCode"],
        message: json["message"],
    );

}

