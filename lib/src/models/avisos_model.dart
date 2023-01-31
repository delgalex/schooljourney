import 'dart:convert';
import 'package:school_journey/src/models/aviso.dart';

class AvisosModel {
    AvisosModel({
        required this.meta,
        required this.resAvisos,
    });

    Meta meta;
    List<Aviso> resAvisos;

    factory AvisosModel.fromJson(String str) => AvisosModel.fromMap(json.decode(str));

    factory AvisosModel.fromMap(Map<String, dynamic> json) => AvisosModel(
        meta: Meta.fromMap(json["meta"]),
        resAvisos: List<Aviso>.from(json["resAvisos"].map((x) => Aviso.fromMap(x))),
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
