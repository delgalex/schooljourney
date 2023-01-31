
import 'dart:convert';

class Estadistica {

    Estadistica({
        this.numActividades,
        this.numRealizadas,
        this.misPuntos,
        this.rank,
    });

    int? numActividades;
    int? numRealizadas;
    int? misPuntos;
    int? rank;

    factory Estadistica.fromJson(String str) => Estadistica.fromMap(json.decode(str));

    factory Estadistica.fromMap(Map<String, dynamic> json) => Estadistica(
        numActividades: json["numActividades"] == null ? 0 : json["numActividades"],
        numRealizadas: json["numRealizadas"] == null ? 0 : json["numRealizadas"],
        misPuntos: json["misPuntos"] == null ? 0 : json["misPuntos"],
        rank: json["rank"] == null ? 0 : json["rank"],
    );

}
