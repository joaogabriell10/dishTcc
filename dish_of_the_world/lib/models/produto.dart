class Produto {
  final int id;
  final String nome;
  final double preco;
  final String descricao;
  final String? tipoPrato;
  final String? imagemFormato;
  final Map<String, dynamic>? pais;

  Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.descricao,
    this.tipoPrato,
    this.imagemFormato,
    this.pais,
  });

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'] ?? 0,
      nome: json['nome'] ?? '',
      preco: (json['preco'] ?? 0.0).toDouble(),
      descricao: json['descricao'] ?? '',
      tipoPrato: json['tipoPrato'],
      imagemFormato: json['imagemFormato'],
      pais: json['pais'],
    );
  }

  String get imagemUrl => 'http://localhost:8080/produtos/imagem/$id';
}