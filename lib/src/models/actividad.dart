
import 'dart:convert';

class Actividad {
    Actividad({
        required this.idActividad,
        required this.idFase,
        required this.fase,
        required this.idCategoria,
        required this.categoria,
        required this.actividad,
        required this.descripcion,
        required this.evidencia,
        required this.puntos,
        required this.fechaInicio,
        required this.fechaFinal,
        required this.idTipoCategoria,
    });

    int idActividad;
    int idFase;
    String fase;
    int idCategoria;
    String categoria;
    String actividad;
    String descripcion;
    String evidencia;
    int puntos;
    String fechaInicio;
    String fechaFinal;
    int idTipoCategoria;

    factory Actividad.fromJson(String str) => Actividad.fromMap(json.decode(str));

    factory Actividad.fromMap(Map<String, dynamic> json) => Actividad(
        idActividad: json["idActividad"],
        idFase: json["idFase"],
        fase: json["fase"],
        idCategoria: json["idCategoria"],
        categoria: json["categoria"],
        actividad: json["actividad"],
        descripcion: json["descripcion"],
        evidencia: json["evidencia"],
        puntos: json["puntos"],
        fechaInicio: json["fechaInicio"],
        fechaFinal: json["fechaFinal"],
        idTipoCategoria: json["idTipoCategoria"],
    );
}
