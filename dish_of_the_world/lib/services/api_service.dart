import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/produto.dart';
import '../models/pais.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8080';
  
  // Headers padrão
  static Map<String, String> get headers => {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
  };

  // GET request
  static Future<Map<String, dynamic>> get(String endpoint) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/$endpoint'),
        headers: headers,
      );
      
      if (response.statusCode == 200) {
        return {'success': true, 'data': json.decode(response.body)};
      } else {
        return {'success': false, 'error': 'Erro ${response.statusCode}'};
      }
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }

  // POST request
  static Future<Map<String, dynamic>> post(String endpoint, Map<String, dynamic> data) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/$endpoint'),
        headers: headers,
        body: json.encode(data),
      );
      
      if (response.statusCode == 200 || response.statusCode == 201) {
        return {'success': true, 'data': json.decode(response.body)};
      } else {
        return {'success': false, 'error': 'Erro ${response.statusCode}: ${response.body}'};
      }
    } catch (e) {
      return {'success': false, 'error': e.toString()};
    }
  }

  // Cadastrar usuário
  static Future<Map<String, dynamic>> cadastrarUsuario({
    required String nome,
    required String email,
    required String cpf,
    required String telefone,
    required String dataNascimento,
    required String senha,
  }) async {
    final userData = {
      'nome': nome,
      'email': email,
      'cpf': cpf,
      'telefone': telefone,
      'dataNascimento': dataNascimento,
      'senha': senha,
      'nivelAcesso': 'CLIENTE',
    };
    
    print('Enviando dados: $userData');
    final result = await post('usuarios/salvar', userData);
    print('Resposta: $result');
    return result;
  }

  // Login usuário
  static Future<Map<String, dynamic>> loginUsuario({
    required String email,
    required String senha,
  }) async {
    final loginData = {
      'email': email,
      'senha': senha,
    };
    
    return await post('usuarios/login', loginData);
  }

  // Buscar produtos aleatórios (máximo 5)
  static Future<List<Produto>> getProdutosAleatorios() async {
    try {
      final response = await get('produtos/home/experimente');
      if (response['success']) {
        final List<dynamic> data = response['data'];
        return data.map((json) => Produto.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }

  // Buscar todos os países ativos
  static Future<List<Pais>> getPaises() async {
    try {
      final response = await get('paises/listar/cliente');
      if (response['success']) {
        final List<dynamic> data = response['data'];
        return data.map((json) => Pais.fromJson(json)).toList();
      }
      return [];
    } catch (e) {
      return [];
    }
  }
}