import 'dart:convert';
import 'package:intl/intl.dart';
import 'package:agenda_ai_ifce/data/apiAgendaAi.dart';
import 'package:agenda_ai_ifce/model/atividades.dart';
import 'package:flutter/material.dart';

class AtividadesPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AtividadesPageState();
  }
}

class AtividadesPageState extends State<AtividadesPage> {
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

  String dataConvertida(String aux) {
    String aux2 = aux.substring(0, 10);
    String brazilianDate = '01/01/2000';
    List<String> validadeSplit = aux2.split('-');

    if(validadeSplit.length > 1) {
      String year = validadeSplit[0].toString();
      String month = validadeSplit[1].toString();
      String day = validadeSplit[2].toString();

      brazilianDate = '$day/$month/$year';
    }

    return brazilianDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4CAF50),
      appBar: AppBar(
        title: Text("ATIVIDADES",
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
                height: 340,
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
                      child: Text("ATIVIDADE",
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
                              child: Text("Nome:",
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
                        height: 136,
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
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 18, top: 10),
                              child: Text("Descrição:",
                                style: TextStyle(
                                    color: Color(0xFFC7FCC9),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18, top: 10),
                              child: Text(lista[index].descricao,
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
                              child: Text("Data:",
                                style: TextStyle(
                                    color: Color(0xFFC7FCC9),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(right: 18),
                              child: Text(dataConvertida(lista[index].dataDePostagem),
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