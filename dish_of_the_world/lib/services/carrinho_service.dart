import '/models/produto.dart';

class CarrinhoService {
  static final CarrinhoService _instance = CarrinhoService._internal();
  factory CarrinhoService() => _instance;
  CarrinhoService._internal();

  final List<Map<String, dynamic>> _itens = [];

  List<Map<String, dynamic>> get itens => _itens;

  void adicionarProduto(Produto produto) {
    final index = _itens.indexWhere((item) => item['produto'].id == produto.id);
    
    if (index >= 0) {
      _itens[index]['quantidade']++;
    } else {
      _itens.add({
        'produto': produto,
        'quantidade': 1,
      });
    }
  }

  void removerProduto(int produtoId) {
    _itens.removeWhere((item) => item['produto'].id == produtoId);
  }

  void atualizarQuantidade(int produtoId, int quantidade) {
    final index = _itens.indexWhere((item) => item['produto'].id == produtoId);
    if (index >= 0) {
      if (quantidade <= 0) {
        _itens.removeAt(index);
      } else {
        _itens[index]['quantidade'] = quantidade;
      }
    }
  }

  double get total {
    return _itens.fold(0.0, (sum, item) => 
        sum + (item['produto'].preco * item['quantidade']));
  }

  void limpar() {
    _itens.clear();
  }
}