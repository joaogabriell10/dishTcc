import 'dart:convert';
import 'package:http/http.dart' as http;

class HttpService {
  static const String baseUrl = 'http://localhost:8080';

  static Future<Map<String, dynamic>?> getUserById(int userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/usuarios/$userId'),
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
}