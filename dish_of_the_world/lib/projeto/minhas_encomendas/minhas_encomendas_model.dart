import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import '/models/encomenda.dart';
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
  }

  Future<void> carregarEncomendas() async {
    try {
      isLoading = true;
      errorMessage = null;
      
      // Obter ID do usuário logado
      final userId = await UserService.getUserId();
      if (userId == null) {
        throw Exception('Usuário não está logado');
      }
      
      encomendas = await EncomendaService.listarEncomendasPorUsuario(userId);
      aplicarFiltros();
    } catch (e) {
      errorMessage = 'Erro ao carregar encomendas: $e';
      encomendas = [];
      encomendasFiltradas = [];
    } finally {
      isLoading = false;
    }
  }

  void aplicarFiltros() {
    encomendasFiltradas = encomendas.where((encomenda) {
      // Filtro por status
      bool statusMatch = filtroStatus == 'Todas' || 
          getStatusText(encomenda.status) == filtroStatus;
      
      // Filtro por busca
      bool searchMatch = searchQuery.isEmpty ||
          (encomenda.produto?.nome?.toLowerCase().contains(searchQuery.toLowerCase()) ?? false) ||
          encomenda.id.toString().contains(searchQuery);
      
      return statusMatch && searchMatch;
    }).toList();
    
    // Ordenar por data mais recente
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
      // Encontrar a encomenda
      final encomenda = encomendas.firstWhere((e) => e.id == encomendaId);
      
      // Criar nova encomenda com status cancelado
      final encomendaAtualizada = Encomenda(
        id: encomenda.id,
        dataEncomenda: encomenda.dataEncomenda,
        comentario: encomenda.comentario,
        usuarioId: encomenda.usuarioId,
        quantidade: encomenda.quantidade,
        preco: encomenda.preco,
        produtoId: encomenda.produtoId,
        status: 5, // Status cancelado
        retirada: encomenda.retirada,
        usuario: encomenda.usuario,
        produto: encomenda.produto,
      );
      
      final sucesso = await EncomendaService.atualizarEncomenda(encomendaAtualizada);
      if (sucesso) {
        await carregarEncomendas();
      } else {
        throw Exception('Falha ao cancelar encomenda');
      }
    } catch (e) {
      throw Exception('Erro ao cancelar encomenda: $e');
    }
  }

  String getStatusText(int? status) {
    switch (status) {
      case 1:
        return 'Confirmada';
      case 2:
        return 'Em preparo';
      case 3:
        return 'Pronta para retirada';
      case 4:
        return 'Retirada';
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
        return Color(0xFFFF9800);
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
    return status == 1 || status == 2; // Apenas confirmada ou em preparo
  }

  List<String> get statusOptions => [
    'Todas',
    'Confirmada',
    'Em preparo',
    'Pronta para retirada',
    'Retirada',
    'Cancelada'
  ];

  @override
  void dispose() {
    searchController.dispose();
  }
}
