import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  static const String _userNameKey = 'user_name';
  static const String _userEmailKey = 'user_email';
  static const String _userIdKey = 'user_id';
  static const String _userCpfKey = 'user_cpf';
  static const String _userTelefoneKey = 'user_telefone';

  // Salvar dados do usuário
  static Future<void> saveUser({
    required String name,
    required String email,
    required int id,
    String? cpf,
    String? telefone,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_userNameKey, name);
    await prefs.setString(_userEmailKey, email);
    await prefs.setInt(_userIdKey, id);
    if (cpf != null) await prefs.setString(_userCpfKey, cpf);
    if (telefone != null) await prefs.setString(_userTelefoneKey, telefone);
  }

  // Obter nome do usuário
  static Future<String?> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userNameKey);
  }

  // Obter email do usuário
  static Future<String?> getUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userEmailKey);
  }

  // Obter ID do usuário
  static Future<int?> getUserId() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(_userIdKey);
  }

  // Obter CPF do usuário
  static Future<String?> getUserCpf() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userCpfKey);
  }

  // Obter telefone do usuário
  static Future<String?> getUserTelefone() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_userTelefoneKey);
  }

  // Limpar dados do usuário (logout)
  static Future<void> clearUser() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_userNameKey);
    await prefs.remove(_userEmailKey);
    await prefs.remove(_userIdKey);
    await prefs.remove(_userCpfKey);
    await prefs.remove(_userTelefoneKey);
  }

  // Verificar se usuário está logado
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.containsKey(_userNameKey);
  }
}