import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static const String baseUrl = 'http://localhost:8080';

  static Future<Map<String, dynamic>?> getUserById(int userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/usuarios/obter/$userId'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        return json.decode(response.body);
      }
      return null;
    } catch (e) {
      print('Erro ao buscar dados do usuário: $e');
      return null;
    }
  }

  static Future<bool> updateUser(int userId, Map<String, dynamic> userData) async {
    try {
      print('URL: $baseUrl/usuarios/salvar');
      print('Body: ${json.encode(userData)}');
      
      final response = await http.post(
        Uri.parse('$baseUrl/usuarios/salvar'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userData),
      );

      print('Status Code: ${response.statusCode}');
      print('Response Body: ${response.body}');
      
      return response.statusCode == 200;
    } catch (e) {
      print('Erro ao atualizar dados do usuário: $e');
      return false;
    }
  }

  static Future<bool> limparEncomendas() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/encomendas/listar'),
        headers: {'Content-Type': 'application/json'},
      );

      if (response.statusCode == 200) {
        final List<dynamic> encomendas = json.decode(response.body);
        
        for (var encomenda in encomendas) {
          await http.get(
            Uri.parse('$baseUrl/encomendas/deletar/${encomenda['id']}'),
            headers: {'Content-Type': 'application/json'},
          );
        }
        return true;
      }
      return false;
    } catch (e) {
      print('Erro ao limpar encomendas: $e');
      return false;
    }
  }
}