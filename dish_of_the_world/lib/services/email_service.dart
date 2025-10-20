import 'dart:convert';
import 'package:http/http.dart' as http;

class EmailService {
  static const String baseUrl = 'http://localhost:8080/usuarios';

  static Future<void> enviarEmailRedefinicaoSenha(String email) async {
    try {
      // Gerar token único
      final token = DateTime.now().millisecondsSinceEpoch.toString();
      
      final response = await http.post(
        Uri.parse('$baseUrl/esqueci-senha'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email,
          'token': token,
          'linkRedefinicao': 'https://dishoftheworld.com/redefinir-senha?token=$token'
        }),
      );

      if (response.statusCode != 200) {
        throw Exception('Email não encontrado');
      }
    } catch (e) {
      throw Exception('Email não encontrado');
    }
  }
}