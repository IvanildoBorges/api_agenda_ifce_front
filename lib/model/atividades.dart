class Atividade {
  final int id;
  final String titulo;
  final String descricao;
  final DateTime dataDePostagem;

  const Atividade({
    required this.id,
    required this.titulo,
    required this.descricao,
    required this.dataDePostagem
  });

  factory Atividade.fromJson(Map<String, dynamic> json) {
    return Atividade(
      id: json['id'],
      titulo: json['titulo'],
      descricao: json['descricao'],
      dataDePostagem: DateTime.parse(json['datadaatividade']).toLocal(),
    );
  }
}