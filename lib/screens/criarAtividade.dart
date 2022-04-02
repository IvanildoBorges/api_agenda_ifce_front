import 'dart:convert';

import 'package:agenda_ai_ifce/data/apiAgendaAi.dart';
import 'package:flutter/material.dart';

class NovaAtividade extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NovaAtividadeState();
  }
}

TextField criarCampoTexto(String texto, TextEditingController controller) {
  return TextField(
    controller: controller,
    cursorColor: Color(0xffC7FCC9),
    style: TextStyle(
      color: Color(0xffC7FCC9),
      fontSize: 16,
    ),
    keyboardType: TextInputType.text,
    maxLines: 1,
    decoration: InputDecoration(
        labelText: texto,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(15.0)
          ),
        ),
        labelStyle: TextStyle(
          fontSize: 18.0,
          color: Colors.white,
        ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Color(0xffC7FCC9),
          style: BorderStyle.solid,
          width: 4
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(15.0)
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(15.0)
        ),
      ),
    ),
  );
}

TextField criarCampoTexto2(String texto, TextEditingController controller2) {
  return TextField(
    controller: controller2,
    cursorColor: Color(0xffC7FCC9),
    style: TextStyle(
      color: Color(0xffC7FCC9),
      fontSize: 16,
    ),
    keyboardType: TextInputType.text,
    maxLines: 5,
    autofocus: false,
    decoration: InputDecoration(
      labelText: texto,
      hintText: '(Preencha com a descrição da atividade)',
      hintStyle: TextStyle(
        color: Colors.white,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
            Radius.circular(15.0)
        ),
      ),
      labelStyle: TextStyle(
        fontSize: 18.0,
        color: Colors.white,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: Color(0xffC7FCC9),
            style: BorderStyle.solid,
            width: 4
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(15.0)
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 2,
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(15.0)
        ),
      ),
    ),
  );
}

String dataConvertida(DateTime dataDdoida, String hora) {
  String aux = dataDdoida.toString();
  String data = aux.substring(0, 10);
  String brazilianDate = '';

  if(data.length > 1) {
    brazilianDate = '${data}T${hora}';
  }

  return brazilianDate;
}

class NovaAtividadeState extends State<NovaAtividade> {
  TextEditingController _nome = TextEditingController();
  TextEditingController _descricao = TextEditingController();
  DateTime dataSelecionada = DateTime.now();
  late String horarioAtual;
  String dataString = "";
  String _texto = "Selecione uma data";

  @override
  void initState(){
    String hora = DateTime.now().hour.toString().padLeft(2, '0');
    String minuto = DateTime.now().minute.toString().padLeft(2, '0');
    String segundo = DateTime.now().second.toString().padLeft(2, '0');
    setState(() {
      horarioAtual = "$hora:$minuto:$segundo";
    });
    super.initState();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: dataSelecionada,
      firstDate: DateTime(2022, 1),
      lastDate: DateTime(2100)
    );
    if (picked != null && picked != dataSelecionada) {
      setState(() {
        dataSelecionada = picked;
        _texto = "$dataSelecionada".substring(0, 10);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4CAF50),
      appBar: AppBar(
        title: Text("CRIAR ATIVIDADE",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 24,
            )),
        centerTitle: true,
        backgroundColor: Color(0xff009706),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: criarCampoTexto("Digite o nome da atividade: ", _nome),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, bottom: 18),
            child: criarCampoTexto2("Digite a descrição: ", _descricao),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: ElevatedButton(
              child: Text(_texto,
                style: TextStyle(
                  color: Color(0xff009706),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
              onPressed: () {
                _selectDate(context);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0),
            child: ElevatedButton(
              child: Text("CRIAR",
                style: TextStyle(
                  color: Color(0xff009706),
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
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
              onPressed: () {
                String tituloDaAtividade = _nome.text;
                String descricaoDaAtividade = _descricao.text;
                setState(() {
                  dataString = dataConvertida(dataSelecionada, horarioAtual);
                });
                if (tituloDaAtividade != '' && descricaoDaAtividade != '') {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      //Retorna um objeto do tipo Dialog
                      return AlertDialog(
                        title: Text("Criado com sucesso!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        content: Text("Vá para Ver Tarefas e veja a nova lista!"),
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
                              AgendaAiApi.setAtividade(
                                  tituloDaAtividade,
                                  descricaoDaAtividade,
                                  DateTime.parse(dataString)
                              );
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
                      //Retorna um objeto do tipo Dialog
                      return AlertDialog(
                        title: Text("Erro ao criar!",
                          style: TextStyle(
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        content: Text("Campos não podem ficarem vazios!"),
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
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}