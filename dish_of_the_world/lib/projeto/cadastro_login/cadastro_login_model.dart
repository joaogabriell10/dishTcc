import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'cadastro_login_widget.dart' show CadastroLoginWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'validadores.dart';
import '/services/api_service.dart';
import '/services/user_service.dart';

class CadastroLoginModel extends FlutterFlowModel<CadastroLoginWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;
  int get tabBarPreviousIndex =>
      tabBarController != null ? tabBarController!.previousIndex : 0;

  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode1;
  TextEditingController? emailAddressCreateTextController1;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextController1Validator;
  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode2;
  TextEditingController? emailAddressCreateTextController2;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextController2Validator;
  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode3;
  TextEditingController? emailAddressCreateTextController3;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextController3Validator;
  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode4;
  TextEditingController? emailAddressCreateTextController4;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextController4Validator;
  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode5;
  TextEditingController? emailAddressCreateTextController5;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextController5Validator;
  // State field(s) for emailAddress_Create widget.
  FocusNode? emailAddressCreateFocusNode6;
  TextEditingController? emailAddressCreateTextController6;
  String? Function(BuildContext, String?)?
      emailAddressCreateTextController6Validator;
  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode1;
  TextEditingController? passwordCreateTextController1;
  late bool passwordCreateVisibility1;
  String? Function(BuildContext, String?)?
      passwordCreateTextController1Validator;
  // State field(s) for password_Create widget.
  FocusNode? passwordCreateFocusNode2;
  TextEditingController? passwordCreateTextController2;
  late bool passwordCreateVisibility2;
  String? Function(BuildContext, String?)?
      passwordCreateTextController2Validator;
  // State field(s) for emailAddress widget.
  FocusNode? emailAddressFocusNode;
  TextEditingController? emailAddressTextController;
  String? Function(BuildContext, String?)? emailAddressTextControllerValidator;
  // State field(s) for password widget.
  FocusNode? passwordFocusNode;
  TextEditingController? passwordTextController;
  late bool passwordVisibility;
  String? Function(BuildContext, String?)? passwordTextControllerValidator;

  // Formatadores de máscara
  final cpfFormatter = MaskTextInputFormatter(
    mask: '###.###.###-##',
    filter: {'#': RegExp(r'[0-9]')},
  );
  
  final telefoneFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {'#': RegExp(r'[0-9]')},
  );
  
  final dataFormatter = MaskTextInputFormatter(
    mask: '##/##/####',
    filter: {'#': RegExp(r'[0-9]')},
  );

  @override
  void initState(BuildContext context) {
    passwordCreateVisibility1 = false;
    passwordCreateVisibility2 = false;
    passwordVisibility = false;
    
    // Configurar validadores
    emailAddressCreateTextController1Validator = _validarNome;
    emailAddressCreateTextController2Validator = _validarEmail;
    emailAddressCreateTextController3Validator = _validarCPF;
    emailAddressCreateTextController4Validator = _validarTelefone;
    emailAddressCreateTextController5Validator = _validarDataNascimento;
    emailAddressCreateTextController6Validator = null;
    passwordCreateTextController1Validator = _validarSenha;
    passwordCreateTextController2Validator = _validarConfirmacaoSenha;
    emailAddressTextControllerValidator = _validarEmail;
    passwordTextControllerValidator = _validarSenhaLogin;
    
    // Listener para verificar senhas em tempo real
    passwordCreateTextController1?.addListener(_verificarSenhas);
    passwordCreateTextController2?.addListener(_verificarSenhas);
  }
  
  void _verificarSenhas() {
    // Força revalidação do campo de confirmação quando a senha principal muda
    if (passwordCreateTextController2?.text.isNotEmpty == true) {
      // Trigger validation
    }
  }
  
  // Validação para Nome (apenas letras)
  String? _validarNome(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Nome é obrigatório';
    }
    if (RegExp(r'[0-9]').hasMatch(value)) {
      return 'Nome não pode conter números';
    }
    if (!RegExp(r'^[a-zA-ZÀ-ÿ\s]+$').hasMatch(value)) {
      return 'Nome deve conter apenas letras';
    }
    if (value.length < 2) {
      return 'Nome deve ter pelo menos 2 caracteres';
    }
    return null;
  }
  
  // Validação para CPF
  String? _validarCPF(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'CPF é obrigatório';
    }
    if (!Validadores.validarCPF(value)) {
      return 'CPF inválido';
    }
    return null;
  }
  
  // Validação para Data de Nascimento
  String? _validarDataNascimento(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Data de nascimento é obrigatória';
    }
    if (!Validadores.validarData(value)) {
      return 'Data inválida. Use DD/MM/AAAA';
    }
    return null;
  }
  
  // Validação para Telefone
  String? _validarTelefone(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Telefone é obrigatório';
    }
    String telefone = value.replaceAll(RegExp(r'[^0-9]'), '');
    if (telefone.length < 10 || telefone.length > 11) {
      return 'Telefone deve ter 10 ou 11 dígitos';
    }
    return null;
  }
  
  
  // Validação para Email
  String? _validarEmail(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Email é obrigatório';
    }
    if (!value.contains('@')) {
      return 'Email deve conter @';
    }
    if (!value.contains('.')) {
      return 'Email deve conter um domínio válido';
    }
    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
      return 'Email inválido';
    }
    return null;
  }
  
  // Validação para Senha
  String? _validarSenha(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória';
    }
    if (value.length < 8) {
      return 'Senha deve ter pelo menos 8 caracteres';
    }
    if (!RegExp(r'(?=.*[a-z])').hasMatch(value)) {
      return 'Senha deve conter pelo menos uma letra minúscula';
    }
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(value)) {
      return 'Senha deve conter pelo menos uma letra maiúscula';
    }
    if (!RegExp(r'(?=.*\d)').hasMatch(value)) {
      return 'Senha deve conter pelo menos um número';
    }
    return null;
  }
  
  // Validação para Confirmação de Senha
  String? _validarConfirmacaoSenha(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Confirmação de senha é obrigatória';
    }
    if (value != passwordCreateTextController1?.text) {
      return 'Senhas não coincidem';
    }
    return null;
  }
  
  // Validação para Senha do Login
  String? _validarSenhaLogin(BuildContext context, String? value) {
    if (value == null || value.isEmpty) {
      return 'Senha é obrigatória';
    }
    return null;
  }

  // Validar todos os campos obrigatórios
  bool validarFormulario() {
    final nome = emailAddressCreateTextController1?.text?.trim() ?? '';
    final email = emailAddressCreateTextController2?.text?.trim() ?? '';
    final cpf = emailAddressCreateTextController3?.text?.trim() ?? '';
    final telefone = emailAddressCreateTextController4?.text?.trim() ?? '';
    final dataNascimento = emailAddressCreateTextController5?.text?.trim() ?? '';
    final senha = passwordCreateTextController1?.text?.trim() ?? '';
    final confirmSenha = passwordCreateTextController2?.text?.trim() ?? '';
    
    // Verificar se todos os campos estão preenchidos
    if (nome.isEmpty) return false;
    if (email.isEmpty) return false;
    if (cpf.isEmpty) return false;
    if (telefone.isEmpty) return false;
    if (dataNascimento.isEmpty) return false;
    if (senha.isEmpty) return false;
    if (confirmSenha.isEmpty) return false;
    
    return true;
  }

  // Método para cadastrar usuário
  Future<Map<String, dynamic>> cadastrarUsuario() async {
    final nome = emailAddressCreateTextController1?.text?.trim() ?? '';
    final email = emailAddressCreateTextController2?.text?.trim() ?? '';
    final cpf = emailAddressCreateTextController3?.text?.trim() ?? '';
    final telefone = emailAddressCreateTextController4?.text?.trim() ?? '';
    final dataNascimento = emailAddressCreateTextController5?.text?.trim() ?? '';
    final senha = passwordCreateTextController1?.text?.trim() ?? '';
    final confirmSenha = passwordCreateTextController2?.text?.trim() ?? '';
    
    // Validação básica
    if (nome.isEmpty || email.isEmpty || cpf.isEmpty || telefone.isEmpty || dataNascimento.isEmpty || senha.isEmpty) {
      return {'success': false, 'error': 'Preencha todos os campos'};
    }
    
    if (senha != confirmSenha) {
      return {'success': false, 'error': 'Senhas não coincidem'};
    }
    
    // Remover formatação do CPF e telefone
    final cpfLimpo = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    final telefoneLimpo = telefone.replaceAll(RegExp(r'[^0-9]'), '');
    
    return await ApiService.cadastrarUsuario(
      nome: nome,
      email: email,
      cpf: cpfLimpo,
      telefone: telefoneLimpo,
      dataNascimento: dataNascimento,
      senha: senha,
    );
  }

  // Método para fazer login
  Future<Map<String, dynamic>> loginUsuario() async {
    final email = emailAddressTextController?.text ?? '';
    final senha = passwordTextController?.text ?? '';
    
    return await ApiService.loginUsuario(
      email: email,
      senha: senha,
    );
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    emailAddressCreateFocusNode1?.dispose();
    emailAddressCreateTextController1?.dispose();

    emailAddressCreateFocusNode2?.dispose();
    emailAddressCreateTextController2?.dispose();

    emailAddressCreateFocusNode3?.dispose();
    emailAddressCreateTextController3?.dispose();

    emailAddressCreateFocusNode4?.dispose();
    emailAddressCreateTextController4?.dispose();

    emailAddressCreateFocusNode5?.dispose();
    emailAddressCreateTextController5?.dispose();

    emailAddressCreateFocusNode6?.dispose();
    emailAddressCreateTextController6?.dispose();

    passwordCreateFocusNode1?.dispose();
    passwordCreateTextController1?.dispose();

    passwordCreateFocusNode2?.dispose();
    passwordCreateTextController2?.dispose();

    emailAddressFocusNode?.dispose();
    emailAddressTextController?.dispose();

    passwordFocusNode?.dispose();
    passwordTextController?.dispose();
  }
}
