import 'dart:convert';

import 'package:agenda_ai_ifce/data/apiAgendaAi.dart';
import 'package:agenda_ai_ifce/model/atividades.dart';
import 'package:agenda_ai_ifce/screens/criarAtividade.dart';
import 'package:agenda_ai_ifce/screens/videosScreen.dart';
import 'package:agenda_ai_ifce/screens/atividadesScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State<Home> {
  List<Atividade> lista = <Atividade>[];

  void getAtividadesFromApi() async {
    AgendaAiApi.getAtividades().then((response) {
      setState(() {
        Iterable listaAux = json.decode(response.body)['data'];
        lista = listaAux.map((model) => Atividade.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState(){
    getAtividadesFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4CAF50),
      appBar: AppBar(
        title: Text("AGENDA AÍ IFCE",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          )),
        centerTitle: true,
        backgroundColor: Color(0xff009706),
      ),
      body: Container(
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(18),
              child: Container(
                height: 431,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff009706),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text("Opções:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xffC7FCC9),
                        fontSize: 18,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFC7FCC9),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(
                                          style: BorderStyle.solid,
                                          color: Colors.transparent
                                      )
                                  )
                              ),
                              elevation: MaterialStateProperty.all<double>(20.0),
                              shadowColor: MaterialStateProperty.all<Color>(Color(0xffC7FCC9)),
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xffC7FCC9)),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AtividadesPage(),
                                ),
                              );
                            },
                            child: Text("Ver Atividades",
                              style: TextStyle(
                                color: Color(0xff009706),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFC7FCC9),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(
                                          style: BorderStyle.solid,
                                          color: Colors.transparent
                                      )
                                  )
                              ),
                              elevation: MaterialStateProperty.all<double>(20.0),
                              shadowColor: MaterialStateProperty.all<Color>(Color(0xffC7FCC9)),
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xffC7FCC9)),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => FilmesPage(),
                                ),
                              );
                            },
                            child: Text("Ver videos",
                              style: TextStyle(
                                color: Color(0xff009706),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFC7FCC9),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(
                                          style: BorderStyle.solid,
                                          color: Colors.transparent
                                      )
                                  )
                              ),
                              elevation: MaterialStateProperty.all<double>(20.0),
                              shadowColor: MaterialStateProperty.all<Color>(Color(0xffC7FCC9)),
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xffC7FCC9)),
                            ),
                            onPressed: (){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => NovaAtividade(),
                                ),
                              );
                            },
                            child: Text("Criar atividade",
                              style: TextStyle(
                                color: Color(0xff009706),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Color(0xFFC7FCC9),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: ElevatedButton(
                            style: ButtonStyle(
                              shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                      side: BorderSide(
                                          style: BorderStyle.solid,
                                          color: Colors.transparent
                                      )
                                  )
                              ),
                              elevation: MaterialStateProperty.all<double>(20.0),
                              shadowColor: MaterialStateProperty.all<Color>(Color(0xffC7FCC9)),
                              backgroundColor: MaterialStateProperty.all<Color>(Color(0xffC7FCC9)),
                            ),
                            onPressed: (){
                              //Informe a rota aqui
                            },
                            child: Text("Lorem ipsum",
                              style: TextStyle(
                                color: Color(0xff009706),
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
          ],
        ),
      ),
    );
  }

}