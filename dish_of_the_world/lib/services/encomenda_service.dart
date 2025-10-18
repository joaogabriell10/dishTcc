import '../models/encomenda.dart';
import 'api_service.dart';

class EncomendaService {
  
  // Listar todas as encomendas
  static Future<List<Encomenda>> listarEncomendas() async {
    final response = await ApiService.get('encomendas/listar');
    
    if (response['success']) {
      List<dynamic> data = response['data'];
      return data.map((json) => Encomenda.fromJson(json)).toList();
    } else {
      throw Exception('Erro ao carregar encomendas: ${response['error']}');
    }
  }

  // Listar encomendas por usuário
  static Future<List<Encomenda>> listarEncomendasPorUsuario(int usuarioId) async {
    try {
      final response = await ApiService.get('encomendas/usuario/$usuarioId');
      
      if (response['success']) {
        List<dynamic> data = response['data'];
        return data.map((json) {
          // Formatar a data se necessário
          if (json['dataEncomenda'] != null) {
            try {
              DateTime dateTime = DateTime.parse(json['dataEncomenda']);
              json['dataEncomenda'] = '${dateTime.day.toString().padLeft(2, '0')}/${dateTime.month.toString().padLeft(2, '0')}/${dateTime.year}';
            } catch (e) {
              // Manter o valor original se não conseguir parsear
            }
          }
          return Encomenda.fromJson(json);
        }).toList();
      } else {
        throw Exception('Erro ao carregar encomendas: ${response['error']}');
      }
    } catch (e) {
      print('Erro no serviço de encomenda: $e');
      throw Exception('Erro ao carregar encomendas: $e');
    }
  }

  // Criar nova encomenda
  static Future<Map<String, dynamic>> criarEncomenda(Map<String, dynamic> dados) async {
    print('EncomendaService.criarEncomenda chamado com: $dados');
    
    // Validar se o produto está disponível
    if (dados['produtoId'] != null) {
      final produtosDisponiveis = await ApiService.getProdutosDisponiveis();
      final produtoDisponivel = produtosDisponiveis.any(
        (produto) => produto.id == dados['produtoId']
      );
      
      if (!produtoDisponivel) {
        return {
          'success': false, 
          'error': 'Este produto não está mais disponível para encomenda'
        };
      }
    }
    
    final response = await ApiService.post('encomendas/salvar', dados);
    print('Resposta do backend: $response');
    return response;
  }

  // Atualizar encomenda
  static Future<bool> atualizarEncomenda(Encomenda encomenda) async {
    final response = await ApiService.post('encomendas/atualizar', encomenda.toJson());
    return response['success'];
  }

  // Obter encomenda por ID
  static Future<Encomenda?> obterEncomenda(int id) async {
    final response = await ApiService.get('encomendas/obter/$id');
    
    if (response['success']) {
      return Encomenda.fromJson(response['data']);
    }
    return null;
  }

  // Deletar encomenda
  static Future<bool> deletarEncomenda(int id) async {
    final response = await ApiService.get('encomendas/deletar/$id');
    return response['success'];
  }
}