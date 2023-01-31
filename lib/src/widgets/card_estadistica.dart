import 'package:flutter/material.dart';
import 'package:school_journey/src/models/estadistica.dart';

class CardEstadistica extends StatelessWidget {
  final List<Estadistica> estadistica;
  
  const CardEstadistica({
    Key? key, 
    required this.estadistica
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    String actividades = "0";
    String realizadas = "0";
    String misPuntos = "0";
    String rank = "0";

    final textStyle = TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      );

    if(estadistica.length > 0){
      actividades  = estadistica[0].numActividades.toString();
      realizadas = estadistica[0].numRealizadas.toString();
      misPuntos = estadistica[0].misPuntos.toString();
      rank = estadistica[0].rank.toString();
    }

    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      padding: EdgeInsets.only(left: 15.0, top: 15.0),
      child: Column(
        children: [
          Row(
              children: <Widget>[
                  Icon( Icons.bar_chart),
                  SizedBox(width: 20.0),
                  Text(
                    "${actividades} actividades, ${realizadas} realizadas",
                      style: textStyle
                  )
                ],
            ),
            Divider(height: 10.0),
                Row(
                  children: <Widget>[
                      Icon( Icons.casino_outlined),
                      SizedBox(width: 20.0),
                      Text(
                        "Mis Puntos: ${misPuntos}",
                         style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                         )
                        )
                    ],
                ),
                Divider(height: 10.0),
                 Row(
                  children: <Widget>[
                      Icon( Icons.star_rate, color: Color(0xFFf2C611)),
                      SizedBox(width: 20.0),
                      Text(
                        "Rank: ${rank}",
                         style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                         )
                        )
                    ],
                ),
                Divider(height: 10.0),
        ],
      )
    );
  }
}