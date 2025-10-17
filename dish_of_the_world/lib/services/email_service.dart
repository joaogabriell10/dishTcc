import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailService {
  static const String baseUrl = 'http://localhost:8080/usuarios';

  static Future<String> enviarEmailRedefinicaoSenha(String email) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/esqueci-senha'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'email': email}),
      );

      if (response.statusCode == 200) {
        return 'Email enviado com sucesso!';
      } else {
        throw Exception('Erro ao enviar email');
      }
    } catch (e) {
      throw Exception('Erro: $e');
    }
  }
}