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

class MinhasEncomendasModel extends FlutterFlowModel<MinhasEncomendasWidget> {
  List<Encomenda> encomendas = [];
  List<Encomenda> encomendasFiltradas = [];
  bool isLoading = true;
  String? errorMessage;
  String filtroStatus = 'Todas';
  String searchQuery = '';
  TextEditingController searchController = TextEditingController();

  @override
  void initState(BuildContext context) {
    carregarEncomendas();
    
    // Escutar quando um pedido for finalizado para recarregar as encomendas
    CarrinhoService().setOnPedidoFinalizado(() {
      print('Pedido finalizado, recarregando encomendas...');
      carregarEncomendas();
    });
  }

  Future<void> carregarEncomendas() async {
    try {
      isLoading = true;
      errorMessage = null;
      
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
        // Se não há usuário logado, usar dados de exemplo para teste
        print('Usuário não logado, usando dados de exemplo');
        encomendas = _criarEncomendasExemplo();
      }
      
      // TESTE: Sempre adicionar algumas encomendas de exemplo
      encomendas.addAll(_criarEncomendasExemplo());
      
      aplicarFiltros();
    } catch (e) {
      print('Erro ao carregar encomendas: $e');
      if (e.toString().contains('Connection') || e.toString().contains('Network')) {
        errorMessage = 'Sem conexão com a internet. Verifique sua conexão e tente novamente.';
      } else {
        errorMessage = 'Não foi possível carregar seus pedidos. Tente novamente em alguns instantes.';
      }
      // Para debug, vamos usar dados de exemplo mesmo com erro
      encomendas = _criarEncomendasExemplo();
      aplicarFiltros();
    } finally {
      isLoading = false;
    }
  }

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
        status: 2,
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
        status: 3,
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
        status: 4,
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
        status: 1,
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

  void aplicarFiltros() {
    encomendasFiltradas = encomendas.where((encomenda) {
      // Filtro por status
      bool statusMatch = filtroStatus == 'Todas' || 
          getStatusText(encomenda.status) == filtroStatus;
      
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

  Future<void> cancelarEncomenda(int encomendaId) async {
    try {
      print('Cancelando encomenda ID: $encomendaId');
      
      // Encontrar a encomenda
      final encomenda = encomendas.firstWhere((e) => e.id == encomendaId);
      print('Encomenda encontrada: ${encomenda.id}');
      
      // Atualizar diretamente na lista local para teste
      final index = encomendas.indexWhere((e) => e.id == encomendaId);
      if (index >= 0) {
        encomendas[index] = Encomenda(
          id: encomenda.id,
          dataEncomenda: encomenda.dataEncomenda,
          comentario: encomenda.comentario,
          usuarioId: encomenda.usuarioId,
          quantidade: encomenda.quantidade,
          preco: encomenda.preco,
          produtoId: encomenda.produtoId,
          status: 2, // Status cancelado
          retirada: encomenda.retirada,
          usuario: encomenda.usuario,
          produto: encomenda.produto,
        );
        aplicarFiltros();
        print('Encomenda cancelada localmente');
      }
      
      // Tentar atualizar no backend
      try {
        final dadosAtualizacao = {
          'id': encomendaId,
          'status': 2
        };
        final response = await ApiService.post('encomendas/atualizar', dadosAtualizacao);
        print('Resposta do backend: $response');
      } catch (e) {
        print('Erro ao atualizar no backend: $e');
      }
      
    } catch (e) {
      print('Erro ao cancelar encomenda: $e');
      throw Exception('Erro ao cancelar encomenda: $e');
    }
  }

  String getStatusText(int? status) {
    switch (status) {
      case 1:
        return 'Confirmada';
      case 2:
        return 'Cancelado';
      case 3:
        return 'Pronta para retirada';
      case 4:
        return 'Retirada / Entregue';
      case 5:
        return 'Cancelada';
      default:
        return 'Desconhecido';
    }
  }

  Color getStatusColor(int? status) {
    switch (status) {
      case 1:
        return Color(0xFF38B6FF);
      case 2:
        return Color(0xFFD0132E);
      case 3:
        return Color(0xFF4CAF50);
      case 4:
        return Color(0xFF2196F3);
      case 5:
        return Color(0xFFD0132E);
      default:
        return Color(0xFF757575);
    }
  }

  IconData getStatusIcon(int? status) {
    switch (status) {
      case 1:
        return Icons.check_circle_outline;
      case 2:
        return Icons.restaurant;
      case 3:
        return Icons.notifications_active;
      case 4:
        return Icons.done_all;
      case 5:
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
    'Cancelado',
    'Pronta para retirada',
    'Retirada / Entregue'
  ];

  @override
  void dispose() {
    searchController.dispose();
  }
}
