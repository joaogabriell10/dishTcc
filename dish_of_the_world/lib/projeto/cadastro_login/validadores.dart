class Validadores {
  // Validação completa de CPF
  static bool validarCPF(String cpf) {
    cpf = cpf.replaceAll(RegExp(r'[^0-9]'), '');
    
    if (cpf.length != 11) return false;
    
    // Verifica se todos os dígitos são iguais
    if (RegExp(r'^(\d)\1*$').hasMatch(cpf)) return false;
    
    // Calcula o primeiro dígito verificador
    int soma = 0;
    for (int i = 0; i < 9; i++) {
      soma += int.parse(cpf[i]) * (10 - i);
    }
    int resto = soma % 11;
    int digito1 = resto < 2 ? 0 : 11 - resto;
    
    if (int.parse(cpf[9]) != digito1) return false;
    
    // Calcula o segundo dígito verificador
    soma = 0;
    for (int i = 0; i < 10; i++) {
      soma += int.parse(cpf[i]) * (11 - i);
    }
    resto = soma % 11;
    int digito2 = resto < 2 ? 0 : 11 - resto;
    
    return int.parse(cpf[10]) == digito2;
  }
  
  // Validação de data
  static bool validarData(String data) {
    if (!RegExp(r'^\d{2}/\d{2}/\d{4}$').hasMatch(data)) return false;
    
    List<String> partes = data.split('/');
    int dia = int.parse(partes[0]);
    int mes = int.parse(partes[1]);
    int ano = int.parse(partes[2]);
    
    if (mes < 1 || mes > 12) return false;
    if (dia < 1 || dia > 31) return false;
    if (ano < 1900 || ano > DateTime.now().year) return false;
    
    // Verifica dias por mês
    List<int> diasPorMes = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    
    // Ano bissexto
    if (ano % 4 == 0 && (ano % 100 != 0 || ano % 400 == 0)) {
      diasPorMes[1] = 29;
    }
    
    return dia <= diasPorMes[mes - 1];
  }
}