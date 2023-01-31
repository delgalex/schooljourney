import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:school_journey/src/models/actividad.dart';
import 'package:url_launcher/url_launcher.dart';



class ActividadDetalle extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    
    final Actividad actividad = ModalRoute.of(context)!.settings.arguments as Actividad;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          _crearAppBar(actividad),
          SliverList(
            delegate: SliverChildListDelegate(
              [
              SizedBox( height: 10.0 ),
               _descripcion(actividad)
              ]
            ),
          )
        ],
      ),
      
    );
  }

  Widget _crearAppBar( Actividad actividad) {
    int _numima = actividad.idTipoCategoria;
    return SliverAppBar(
      elevation: 2.0,
  //    backgroundColor: Colors.indigoAccent,
      expandedHeight: 200.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: Text(
        actividad.actividad,
          style: TextStyle(color: Colors.white, fontFamily: 'Lato',fontSize: 17.0, fontWeight: FontWeight.bold),
        ),
        
        background: Image(image: AssetImage( 'assets/img/imagen$_numima.jpg' ), fit:BoxFit.cover),/*FadeInImage(
          image: NetworkImage( 'https://i.pinimg.com/originals/1c/22/25/1c2225e20b5be3575382abf2fdd42ff5.jpg' ),
          //image: AssetImage( 'assets/img/loading.gif' ),
          placeholder: AssetImage('assets/img/loading.gif'),
          fadeInDuration: Duration(microseconds: 150),
          fit: BoxFit.cover,
        ),*/
      ),
    );
  }

  Widget _descripcion( Actividad actividad ) {

    return Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            children: [
              Flexible(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Instrucciones:',
                      textAlign: TextAlign.left,
                      style: TextStyle(fontFamily: 'Lato',fontSize: 18.0,fontWeight: FontWeight.bold),
                    ),
                    Divider(height: 10.0),
                    Html(
                        data:actividad.descripcion,
                         //onLinkTap: (url) => _cargaUrl(url)
                         onLinkTap: (url, _, __, ___) {
                                      print("Opening $url...");
                                      //_cargaUrl(url!);
                                    },
                        ),
                    Divider(height: 50.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(children: [
                            Icon(Icons.calendar_today, color: Colors.indigo),
                            Text(
                              'Inicio:',
                              textAlign: TextAlign.left,
                              style: TextStyle(fontFamily: 'Lato',fontSize: 15.0, fontWeight: FontWeight.bold),
                            ),
                           
                            Text(
                              actividad.fechaInicio,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontFamily: 'Lato',fontSize: 14.0),
                            ),
                          ],
                        ),
                        Column(children: [
                              Icon(Icons.calendar_today, color: Colors.indigo),
                              Text(
                                'Final:',
                                style: TextStyle(fontFamily: 'Lato',fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                actividad.fechaFinal,
                                style: TextStyle(fontFamily: 'Lato',fontSize: 14.0),
                              ),                          
                          ],
                        ),

                        Column(children: [
                             createStar(),              
                              Text(
                                'Puntos:',                            
                                style: TextStyle(fontFamily: 'Lato',fontSize: 15.0, fontWeight: FontWeight.bold),
                              ),
                               Text(
                                actividad.puntos.toString(),
                                style: TextStyle(fontFamily: 'Lato',fontSize: 14.0),
                              )                                                    
                          ],                      
                        ),
                                          
                      ],
                    ),


                    Divider(height: 25.0),                
                    Row(
                       mainAxisAlignment: MainAxisAlignment.spaceAround,
                     children: <Widget>[
                       Column(
                         children: [
                            Text(
                              'Evidencia:',
                              style: TextStyle(fontFamily: 'Lato',fontSize: 15.0,fontWeight: FontWeight.bold),
                            ),
                            Text(
                              actividad.evidencia,
                              style: TextStyle(fontFamily: 'Lato',fontSize: 14.0),
                            ),
                         ],
                       ),
                        Column(
                         children: [
                            Text(
                                  'Fase:',
                                  style: TextStyle(fontFamily: 'Lato',fontSize: 15.0,fontWeight: FontWeight.bold),
                                ),
                           Text(
                                actividad.fase,
                                style: TextStyle(fontFamily: 'Lato',fontSize: 14.0),
                              ), 
                         ],
                       )                  
                     
                     ],   
                    ),
                     Divider(height: 50.0),
                  ],
                ),
         ),
            ],
          ),
     );
  }

  Widget createStar() {
      Widget star = Container(
          child: Icon(
            Icons.star,
            color: Color(0xFFf2C611),
          ),
      );
      return star;
  }

  List<Widget> printStars( Actividad actividad ) {
      List<Widget> estrellas = [];
      int _rellenas = actividad.puntos;
      for (int i = 0; i < _rellenas; i++) {
        estrellas.add(createStar());
      }
      return estrellas;
  }
  

  Future<void> _cargaUrl(String url) async{
    if( await canLaunch(url) ){
        await launch( url );  
    }else{
      throw 'No pudimos resolver el link';
    }
  }



}