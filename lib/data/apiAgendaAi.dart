import 'package:http/http.dart' as http;

class AgendaAiApi{
  static Future getAtividades() {
    //Use o IPV4 do seu pc no lugar do localhost e a porta 3000
    // caso for usar api local para executar num dispositivo fisico
    Uri url = Uri.parse('http://localhost:3000/atividade');
    return http.get(
        url,
        headers: {
          "Accept": "application/json",
        });
  }

  static Future getVideos() {
    Uri url = Uri.parse('http://localhost:3000/video');
    return http.get(
        url,
        headers: {
          "Accept": "application/json",
        });
  }
}