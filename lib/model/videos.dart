class Videos {
  final int id;
  final String titulo;
  final String organizacao;
  final List<dynamic> enderecoWeb;

  const Videos({
    required this.id,
    required this.titulo,
    required this.organizacao,
    required this.enderecoWeb
  });

  factory Videos.fromJson(Map<String, dynamic> json) {
    return Videos(
      id: json['id'],
      titulo: json['titulo'],
      organizacao: json['organizacao'],
      enderecoWeb: json['fonte'],
    );
  }
}