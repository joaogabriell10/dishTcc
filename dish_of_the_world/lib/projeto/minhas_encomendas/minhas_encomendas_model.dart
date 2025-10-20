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
        // Se não há usuário logado, lista vazia
        print('Usuário não logado');
        encomendas = [];
      }
      
      aplicarFiltros();
    } catch (e) {
      print('Erro ao carregar encomendas: $e');
      if (e.toString().contains('Connection') || e.toString().contains('Network')) {
        errorMessage = 'Sem conexão com a internet. Verifique sua conexão e tente novamente.';
      } else {
        errorMessage = 'Não foi possível carregar seus pedidos. Tente novamente em alguns instantes.';
      }
      encomendas = [];
      aplicarFiltros();
    } finally {
      isLoading = false;
    }
  }



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
          prontoParaRetirada: encomenda.prontoParaRetirada,
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
    'Cancelada',
    'Pronta para retirada',
    'Retirada / Entregue'
  ];

  @override
  void dispose() {
    searchController.dispose();
  }
}
