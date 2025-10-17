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

  // Criar nova encomenda
  static Future<bool> criarEncomenda(Map<String, dynamic> dados) async {
    final response = await ApiService.post('encomendas/salvar', dados);
    return response['success'];
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