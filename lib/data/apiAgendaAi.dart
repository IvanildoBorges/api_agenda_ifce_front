import 'package:http/http.dart' as http;

class AgendaAiApi{
  static Future getAtividades() {
    //Use o IPV4 do seu pc no lugar do localhost e a porta 3000
    // caso for usar api local para executar num dispositivo fisico
    Uri url = Uri.parse('http://192.168.1.65:3000/atividade');
    return http.get(
      url,
      headers: {
        "Accept": "application/json",
      }
    );
  }

  static Future setAtividade(String titulo, String descricao, DateTime data) {
    //Use o IPV4 do seu pc no lugar do localhost e a porta 3000
    // caso for usar api local para executar num dispositivo fisico
    Uri url = Uri.parse('http://localhost:3000/atividade/cadastrar');
    return http.post(
      url,
      headers: {
        "Accept": "application/json",
      },
      body: {
        "titulo": "$titulo",
        "descricao": "$descricao",
        "dataDaAtividade": "$data"
      }
    );
  }

  static Future apagarAtividade(int id) {
    //Use o IPV4 do seu pc no lugar do localhost e a porta 3000
    // caso for usar api local para executar num dispositivo fisico
    Uri url = Uri.parse('http://localhost:3000/atividade/delete/$id');
    return http.delete(
      url,
      headers: {
        "Accept": "application/json",
      }
    );
  }

  static Future getVideos() {
    Uri url = Uri.parse('http://localhost:3000/video');
    return http.get(
      url,
      headers: {
        "Accept": "application/json",
      }
    );
  }
}