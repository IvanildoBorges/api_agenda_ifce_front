import 'dart:convert';

import 'package:agenda_ai_ifce/data/apiAgendaAi.dart';
import 'package:agenda_ai_ifce/model/videos.dart';
import 'package:agenda_ai_ifce/screens/videosList.dart';
import 'package:flutter/material.dart';

class FilmesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FilmesPageState();
  }
}

class FilmesPageState extends State<FilmesPage> {
  List<Videos> lista = <Videos>[];

  void getVideosFromApi() async {
    AgendaAiApi.getVideos().then((response) {
      setState(() {
        Iterable listaAux = json.decode(response.body)['data'];
        lista = listaAux.map((model) => Videos.fromJson(model)).toList();
      });
    });
  }

  @override
  void initState(){
    getVideosFromApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4CAF50),
      appBar: AppBar(
        title: Text("VIDEOS",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            )),
        centerTitle: true,
        backgroundColor: Color(0xff009706),
      ),
      body: Container(
        child: ListView.builder(
            itemCount: lista.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(18),
                child: Container(
                  height: 250,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Color(0xff009706),
                    borderRadius: BorderRadius.all(
                      Radius.circular(15.0),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text("Lista ${lista[index].id}",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffC7FCC9),
                            fontSize: 18,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18, bottom: 18),
                        child: Container(
                          height: 45,
                          width: 320,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0,
                                color: Color(0xFFC7FCC9)
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Text("Titulo:",
                                  style: TextStyle(
                                      color: Color(0xFFC7FCC9),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 18),
                                child: Text(lista[index].titulo,
                                  style: TextStyle(
                                      color: Color(0xFFC7FCC9),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Container(
                          height: 45,
                          width: 320,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0,
                                color: Color(0xFFC7FCC9)
                            ),
                            borderRadius: BorderRadius.all(
                              Radius.circular(15.0),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: Text("Organização:",
                                  style: TextStyle(
                                      color: Color(0xFFC7FCC9),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 18),
                                child: Text(lista[index].organizacao,
                                  style: TextStyle(
                                      color: Color(0xFFC7FCC9),
                                      fontSize: 16,
                                      fontWeight: FontWeight.normal
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 18),
                        child: Container(
                          height: 45,
                          width: 320,
                          decoration: BoxDecoration(
                            border: Border.all(
                                width: 1.0,
                                color: Color(0xFFC7FCC9)
                            ),
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
                                  builder: (context) => VideosListPage(
                                    copyright: lista[index].organizacao,
                                    enderecos: lista[index].enderecoWeb
                                  ),
                                ),
                              );
                            },
                            child: Text("Ver os Videos",
                              style: TextStyle(
                                color: Color(0xff009706),
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}