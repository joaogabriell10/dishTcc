import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/models/encomenda.dart';
import '/models/produto.dart';
import '/services/api_service.dart';
import '/services/carrinho_service.dart';
import '/services/encomenda_service.dart';
import '/services/user_service.dart';
import 'minhas_encomendas_widget.dart' show MinhasEncomendasWidget;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MinhasEncomendasModel extends FlutterFlowModel<MinhasEncomendasWidget> {
  List<Encomenda> encomendas = [];
  List<Encomenda> encomendasFiltradas = [];
  bool isLoading = true;
  String? errorMessage;
  String filtroStatus = 'Todas';
  String searchQuery = '';
  TextEditingController searchController = TextEditingController();
  
  Set<int> _encomendasCanceladas = {};

  @override
  void initState(BuildContext context) {
    _inicializar();
    
    // Escutar quando um pedido for finalizado para recarregar as encomendas
    CarrinhoService().setOnPedidoFinalizado(() {
      print('Pedido finalizado, recarregando encomendas...');
      carregarEncomendas();
    });
  }
  
  Future<void> _inicializar() async {
    await _carregarCancelamentos();
    await carregarEncomendas();
  }
  
  Future<void> _carregarCancelamentos() async {
    final prefs = await SharedPreferences.getInstance();
    final cancelados = prefs.getStringList('encomendas_canceladas') ?? [];
    _encomendasCanceladas = cancelados.map((e) => int.parse(e)).toSet();
  }
  
  Future<void> _salvarCancelamentos() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('encomendas_canceladas', 
        _encomendasCanceladas.map((e) => e.toString()).toList());
  }

  Future<void> carregarEncomendas({bool forceReload = false}) async {
    if (_encomendasCanceladas.isEmpty) {
      await _carregarCancelamentos();
    }
    try {
      isLoading = true;
      errorMessage = null;
      
      // Limpar dados anteriores se for um reload forçado
      if (forceReload) {
        encomendas.clear();
        encomendasFiltradas.clear();
      }
      
      final userId = await UserService.getUserId();
      print('UserID para carregar encomendas: $userId');
      
      if (userId != null) {
        print('Fazendo requisição para: encomendas/usuario/$userId');
        final response = await ApiService.get('encomendas/usuario/$userId');
        print('Resposta da API: $response');
        
        if (response['success']) {
          List<dynamic> data = response['data'];
          print('Dados recebidos: ${data.length} encomendas');
          encomendas = data.map((json) => Encomenda.fromJson(json)).toList();
        } else {
          throw Exception(response['error'] ?? 'Erro ao carregar pedidos');
        }
      } else {
        // Se não há usuário logado, lista vazia
        print('Usuário não logado');
        encomendas = [];
      }
      
<<<<<<< HEAD
      // TESTE: Sempre adicionar algumas encomendas de exemplo
      if (!forceReload) {
        encomendas.addAll(_criarEncomendasExemplo());
      }
      
=======
>>>>>>> e08bd5e1407eca7314b8fee10d7eb3aad09e041b
      aplicarFiltros();
    } catch (e) {
      print('Erro ao carregar encomendas: $e');
      if (e.toString().contains('Connection') || e.toString().contains('Network')) {
        errorMessage = 'Sem conexão com a internet. Verifique sua conexão e tente novamente.';
      } else {
        errorMessage = 'Não foi possível carregar seus pedidos. Tente novamente em alguns instantes.';
      }
<<<<<<< HEAD
      // Para debug, vamos usar dados de exemplo mesmo com erro
      if (encomendas.isEmpty) {
        encomendas = _criarEncomendasExemplo();
      }
=======
      encomendas = [];
>>>>>>> e08bd5e1407eca7314b8fee10d7eb3aad09e041b
      aplicarFiltros();
    } finally {
      isLoading = false;
    }
  }

<<<<<<< HEAD
  List<Encomenda> _criarEncomendasExemplo() {
    return [
      Encomenda(
        id: 1,
        dataEncomenda: '15/12/2024',
        comentario: 'Sem cebola, por favor',
        usuarioId: 1,
        quantidade: 2,
        preco: 46.00,
        produtoId: 1,
        status: _encomendasCanceladas.contains(1) ? 5 : 1,
        retirada: false,
        produto: Produto(
          id: 1, 
          nome: 'Feijoada', 
          preco: 25.90,
          descricao: 'Prato tradicional brasileiro com feijão preto e carnes',
        ),
      ),
      Encomenda(
        id: 2,
        dataEncomenda: '14/12/2024',
        comentario: null,
        usuarioId: 1,
        quantidade: 1,
        preco: 24.50,
        produtoId: 2,
        status: _encomendasCanceladas.contains(2) ? 5 : 1,
        retirada: false,
        produto: Produto(
          id: 2, 
          nome: 'Paella', 
          preco: 32.50,
          descricao: 'Prato tradicional espanhol com arroz e frutos do mar',
        ),
      ),
      Encomenda(
        id: 3,
        dataEncomenda: '13/12/2024',
        comentario: 'Extra wasabi',
        usuarioId: 1,
        quantidade: 3,
        preco: 79.50,
        produtoId: 103,
        status: _encomendasCanceladas.contains(3) ? 5 : 1,
        retirada: true,
        produto: Produto(
          id: 3, 
          nome: 'Sushi', 
          preco: 28.90,
          descricao: 'Prato tradicional japonês com peixe cru e arroz',
        ),
      ),
      Encomenda(
        id: 4,
        dataEncomenda: '12/12/2024',
        comentario: null,
        usuarioId: 1,
        quantidade: 1,
        preco: 26.50,
        produtoId: 104,
        status: _encomendasCanceladas.contains(4) ? 5 : 1,
        retirada: false,
        produto: Produto(
          id: 4, 
          nome: 'Tacos', 
          preco: 22.00,
          descricao: 'Prato tradicional mexicano com tortilla e recheios variados',
        ),
      ),
      Encomenda(
        id: 5,
        dataEncomenda: '10/12/2024',
        comentario: 'Cancelado pelo cliente',
        usuarioId: 1,
        quantidade: 2,
        preco: 47.00,
        produtoId: 105,
        status: 5,
        retirada: false,
        produto: Produto(
          id: 5, 
          nome: 'Ratatouille', 
          preco: 24.90,
          descricao: 'Prato tradicional francês com legumes refogados',
        ),
      ),
    ];
  }
=======

>>>>>>> e08bd5e1407eca7314b8fee10d7eb3aad09e041b

  void aplicarFiltros() {
    encomendasFiltradas = encomendas.where((encomenda) {
      // Filtro por status
      bool statusMatch = filtroStatus == 'Todas' || 
          getStatusText(encomenda.status, prontoParaRetirada: encomenda.prontoParaRetirada, retirada: encomenda.retirada) == filtroStatus;
      
      // Filtro por busca (nome do produto ou número do pedido)
      bool searchMatch = searchQuery.isEmpty ||
          (encomenda.produto?.nome?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false) ||
          encomenda.id.toString().contains(searchQuery);
      
      return statusMatch && searchMatch;
    }).toList();
    
    // Ordenar por ID mais recente
    encomendasFiltradas.sort((a, b) {
      if (a.id == null || b.id == null) return 0;
      return b.id!.compareTo(a.id!);
    });
  }

  void filtrarPorStatus(String status) {
    filtroStatus = status;
    aplicarFiltros();
  }

  void buscarEncomendas(String query) {
    searchQuery = query;
    aplicarFiltros();
  }

  void cancelarEncomenda(int encomendaId) {
    _encomendasCanceladas.add(encomendaId);
    _salvarCancelamentos();
    
    for (int i = 0; i < encomendas.length; i++) {
      if (encomendas[i].id == encomendaId) {
        final encomenda = encomendas[i];
        encomendas[i] = Encomenda(
          id: encomenda.id,
          dataEncomenda: encomenda.dataEncomenda,
          comentario: encomenda.comentario,
          usuarioId: encomenda.usuarioId,
          quantidade: encomenda.quantidade,
          preco: encomenda.preco,
          produtoId: encomenda.produtoId,
          status: 5,
          retirada: encomenda.retirada,
          prontoParaRetirada: encomenda.prontoParaRetirada,
          usuario: encomenda.usuario,
          produto: encomenda.produto,
        );
        break;
      }
    }
    aplicarFiltros();
  }

  String getStatusText(int? status, {bool? prontoParaRetirada, bool? retirada}) {
    if (retirada == true) {
      return 'Retirada / Entregue';
    }
    if (prontoParaRetirada == true) {
      return 'Pronta para retirada';
    }
    switch (status) {
      case 1:
        return 'Confirmada';
      case 2:
<<<<<<< HEAD
        return 'Em preparo';
      case 3:
        return 'Pronta para retirada';
      case 4:
        return 'Retirada / Entregue';
      case 5:
=======
>>>>>>> e08bd5e1407eca7314b8fee10d7eb3aad09e041b
        return 'Cancelada';
      default:
        return 'Desconhecido';
    }
  }

  Color getStatusColor(int? status, {bool? prontoParaRetirada, bool? retirada}) {
    if (retirada == true) {
      return Color(0xFF2196F3);
    }
    if (prontoParaRetirada == true) {
      return Color(0xFF4CAF50);
    }
    switch (status) {
      case 1:
        return Color(0xFF38B6FF);
      case 2:
<<<<<<< HEAD
        return Color(0xFFFF9800);
      case 3:
        return Color(0xFF4CAF50);
      case 4:
        return Color(0xFF2196F3);
      case 5:
=======
>>>>>>> e08bd5e1407eca7314b8fee10d7eb3aad09e041b
        return Color(0xFFD0132E);
      default:
        return Color(0xFF757575);
    }
  }

  IconData getStatusIcon(int? status, {bool? prontoParaRetirada, bool? retirada}) {
    if (retirada == true) {
      return Icons.done_all;
    }
    if (prontoParaRetirada == true) {
      return Icons.notifications_active;
    }
    switch (status) {
      case 1:
        return Icons.check_circle_outline;
      case 2:
        return Icons.cancel;
      default:
        return Icons.help_outline;
    }
  }

  bool podeSerCancelada(int? status) {
    return status == 1; // Apenas confirmada pode ser cancelada
  }

  List<String> get statusOptions => [
    'Todas',
    'Confirmada',
<<<<<<< HEAD
    'Em preparo',
=======
    'Cancelada',
>>>>>>> e08bd5e1407eca7314b8fee10d7eb3aad09e041b
    'Pronta para retirada',
    'Retirada / Entregue',
    'Cancelada'
  ];

  @override
  void dispose() {
    searchController.dispose();
  }
}
