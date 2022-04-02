import 'dart:convert';
import 'package:agenda_ai_ifce/screens/home.dart';
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

  String dataConvertida(DateTime dataDdoida) {
    String aux = dataDdoida.toString();
    String data = aux.substring(0, 10);
    String hora_minuto_segundo = aux.substring(11);
    String brazilianDate = '01/01/2000';
    List<String> dataSplit = data.split('-');
    List<String> horarioSplit = hora_minuto_segundo.split(":");

    if(dataSplit.length > 1) {
      String year = dataSplit[0].toString();
      String month = dataSplit[1].toString();
      String day = dataSplit[2].toString();

      if (horarioSplit.length > 1) {
        String hora = horarioSplit[0].toString();
        String min = horarioSplit[1].toString();
        //String seg = horarioSplit[2].toString();

        brazilianDate = '$day/$month/$year $hora:$min';
      }
    }

    return brazilianDate;
  }

  void deleteAtividade(Atividade atividade, int indice, BuildContext context,) {
    if (atividade == lista.elementAt(indice)) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          //Retorna um objeto do tipo Dialog
          return AlertDialog(
            title: Text("Deseja mesmo excluir?",
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            content: Text("Aviso: Está opção é irreversível!"),
            actions: <Widget>[
              // define os botões na base do dialogo
              TextButton(
                child: Text("OK",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(30.0, 30.0)),
                ),
                onPressed: () {
                  setState(() {
                    lista.remove(atividade);
                  });
                  AgendaAiApi.apagarAtividade(atividade.id);
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text("Cancelar",
                  style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold
                  ),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size>(
                      Size(30.0, 30.0)),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
    else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Já foi excluído!",
              style: TextStyle(
                  fontWeight: FontWeight.bold
              ),
            ),
            actions: [
              TextButton(
                child: Text("OK",
                  style: TextStyle(
                      fontWeight: FontWeight.bold
                  ),
                ),
                style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all<Size> (Size(30.0, 30.0)),
                ),
                onPressed: () => Navigator.of(context).pop(),
              )
            ],
          );
        },
      );
    }
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
                height: 370,
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 50.0),
                            child: Text("ATIVIDADE",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xffC7FCC9),
                                fontSize: 18,
                              ),
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete),
                            tooltip: 'Excluir',
                            color: Colors.white,
                            onPressed: (){
                              deleteAtividade(lista[index], index, context);
                            },
                          )
                        ],
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20, top: 18, bottom: 18),
                      child: Container(
                        height: 45,
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
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 18),
                      child: Container(
                        height: 136,
                        width: double.infinity,
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
                              padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
                              child: Text("Descrição:",
                                style: TextStyle(
                                    color: Color(0xFFC7FCC9),
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18, right: 18, top: 10),
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
                      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 18),
                      child: Container(
                        height: 45,
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