class Pais {
  final int id;
  final String nome;
  final String codigo;
  final int status;

  Pais({
    required this.id,
    required this.nome,
    required this.codigo,
    required this.status,
  });

  factory Pais.fromJson(Map<String, dynamic> json) {
    return Pais(
      id: json['id'] ?? 0,
      nome: json['nome'] ?? '',
      codigo: json['codigo'] ?? '',
      status: json['status'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'nome': nome,
      'codigo': codigo,
      'status': status,
    };
  }

  String get capaUrl => 'https://flagcdn.com/w80/${codigo.toLowerCase()}.png';
  String get capaUrlFallback => 'https://flagcdn.com/w160/${codigo.toLowerCase()}.png';
}