import 'dart:convert';

class Aviso {
    Aviso({
        required this.titulo,
        required this.descripcion,
    });

    String titulo;
    String descripcion;

    factory Aviso.fromJson(String str) => Aviso.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory Aviso.fromMap(Map<String, dynamic> json) => Aviso(
        titulo: json["titulo"],
        descripcion: json["descripcion"],
    );

    Map<String, dynamic> toMap() => {
        "titulo": titulo,
        "descripcion": descripcion,
    };
}
