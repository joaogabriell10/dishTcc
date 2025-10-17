class Encomenda {
  final int? id;
  final String? dataEncomenda;
  final String? comentario;
  final int? usuarioId;
  final int? quantidade;
  final double? preco;
  final int? produtoId;
  final int? status;
  final bool? retirada;
  final Usuario? usuario;
  final Produto? produto;

  Encomenda({
    this.id,
    this.dataEncomenda,
    this.comentario,
    this.usuarioId,
    this.quantidade,
    this.preco,
    this.produtoId,
    this.status,
    this.retirada,
    this.usuario,
    this.produto,
  });

  factory Encomenda.fromJson(Map<String, dynamic> json) {
    return Encomenda(
      id: json['id'],
      dataEncomenda: json['dataEncomenda'],
      comentario: json['comentario'],
      usuarioId: json['usuarioId'],
      quantidade: json['quantidade'],
      preco: json['preco']?.toDouble(),
      produtoId: json['produtoId'],
      status: json['status'],
      retirada: json['retirada'],
      usuario: json['usuario'] != null ? Usuario.fromJson(json['usuario']) : null,
      produto: json['produto'] != null ? Produto.fromJson(json['produto']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dataEncomenda': dataEncomenda,
      'comentario': comentario,
      'usuarioId': usuarioId,
      'quantidade': quantidade,
      'preco': preco,
      'produtoId': produtoId,
      'status': status,
      'retirada': retirada,
    };
  }
}

class Usuario {
  final int? id;
  final String? nome;
  final String? email;

  Usuario({this.id, this.nome, this.email});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
    );
  }
}

class Produto {
  final int? id;
  final String? nome;
  final double? preco;

  Produto({this.id, this.nome, this.preco});

  factory Produto.fromJson(Map<String, dynamic> json) {
    return Produto(
      id: json['id'],
      nome: json['nome'],
      preco: json['preco']?.toDouble(),
    );
  }
}