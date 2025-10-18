import '/models/produto.dart';
import '/services/encomenda_service.dart';
import '/services/user_service.dart';

class CarrinhoService {
  static final CarrinhoService _instance = CarrinhoService._internal();
  factory CarrinhoService() => _instance;
  CarrinhoService._internal();

  final List<Map<String, dynamic>> _itens = [];
  
  // Callback para notificar mudanças no carrinho
  Function()? _onCarrinhoChanged;
  
  // Callback para notificar quando um pedido for finalizado
  Function()? _onPedidoFinalizado;

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
    _notificarMudanca();
  }

  void removerProduto(int produtoId) {
    _itens.removeWhere((item) => item['produto'].id == produtoId);
    _notificarMudanca();
  }

  void atualizarQuantidade(int produtoId, int quantidade) {
    final index = _itens.indexWhere((item) => item['produto'].id == produtoId);
    if (index >= 0) {
      if (quantidade <= 0) {
        _itens.removeAt(index);
      } else {
        _itens[index]['quantidade'] = quantidade;
      }
      _notificarMudanca();
    }
  }

  double get total {
    return _itens.fold(0.0, (sum, item) => 
        sum + (item['produto'].preco * item['quantidade']));
  }

  Future<bool> finalizarPedido() async {
    try {
      print('Iniciando finalização do pedido...');
      print('Itens no carrinho: ${_itens.length}');
      
      final userId = await _getUserId();
      print('UserID para pedido: $userId');
      
      if (userId == null) {
        print('Usuário não está logado');
        return false;
      }
      
      for (var item in _itens) {
        final produto = item['produto'];
        final quantidade = item['quantidade'];
        
        final encomendaData = {
          'dataEncomenda': DateTime.now().toIso8601String(),
          'usuarioId': userId,
          'quantidade': quantidade,
          'preco': produto.preco,
          'produtoId': produto.id,
          'status': 1,
          'retirada': false,
        };
        
        print('Criando encomenda: $encomendaData');
        final sucesso = await EncomendaService.criarEncomenda(encomendaData);
        print('Encomenda criada: $sucesso');
      }
      
      print('Limpando carrinho...');
      limpar();
      
      // Notificar que o pedido foi finalizado
      if (_onPedidoFinalizado != null) {
        _onPedidoFinalizado!();
      }
      
      return true;
    } catch (e) {
      print('Erro ao finalizar pedido: $e');
      return false;
    }
  }
  
  Future<int?> _getUserId() async {
    try {
      final userId = await UserService.getUserId();
      print('UserID obtido: $userId');
      return userId ?? 1; // Usar ID 1 como fallback para teste
    } catch (e) {
      print('Erro ao obter UserID: $e');
      return 1; // Usar ID 1 como fallback
    }
  }

  void limpar() {
    _itens.clear();
    _notificarMudanca();
  }
  
  void setOnCarrinhoChanged(Function()? callback) {
    _onCarrinhoChanged = callback;
  }
  
  void setOnPedidoFinalizado(Function()? callback) {
    _onPedidoFinalizado = callback;
  }
  
  void _notificarMudanca() {
    if (_onCarrinhoChanged != null) {
      _onCarrinhoChanged!();
    }
  }
  
  int get quantidadeTotal {
    return _itens.fold(0, (sum, item) => sum + (item['quantidade'] as int));
  }
  
  bool get temItens {
    return _itens.isNotEmpty;
  }
  
  bool get estaVazio {
    return _itens.isEmpty;
  }
}