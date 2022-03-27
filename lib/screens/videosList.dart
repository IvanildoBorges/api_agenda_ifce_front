import 'dart:developer';

import 'package:agenda_ai_ifce/model/videos.dart';
import 'package:agenda_ai_ifce/widgetsExtras/playerDeVideo.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';

class VideosListPage extends StatefulWidget {
  String copyright;
  List<dynamic> enderecos = <dynamic>[];

  VideosListPage({
    required this.copyright,
    required this.enderecos
  });

  @override
  State<StatefulWidget> createState() {
    return VideosListPageState();
  }
}

class VideosListPageState extends State<VideosListPage> {
  List<String> enderecosString = <String>[];

  void converteString() {
    if (widget.enderecos.isEmpty) {
      print("\n\nVazia!\n\n");
    } else {
      final tamanho = widget.enderecos.length;
      var i;
      String aux = '';
      for (i=0; i<tamanho; i++) {
        aux = widget.enderecos[i].toString();
        enderecosString.add(aux);
      }
    }
  }

  bool valor(int indice) {
    bool boleano = false;

    if (indice == 0) {
      boleano = true;
    } else {
      boleano = false;
    }

    return boleano;
  }

  @override
  void initState() {
    super.initState();
    converteString();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff4CAF50),
      appBar: AppBar(
        title: Text("LISTA DE VIDEOS",
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
          itemCount: widget.enderecos.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(18),
              child: Container(
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
                              child: Text(widget.copyright,
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
                      padding: const EdgeInsets.only(top: 18, bottom: 18),
                      child: Container(
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
                          children: [
                            PlayerDeVideo(
                              controller: VideoPlayerController.network(widget.enderecos[index]),
                              looping: true,
                              autoPlay: valor(index),
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