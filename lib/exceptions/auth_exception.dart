class AuthException implements Exception {
  final String key;
  final Map<String, String> erros = {
    "EMAIL_NOT_FOUND": "E-mail ou Senha Inválido.",
    "INVALID_PASSWORD": "E-mail ou Senha Inválido.",
    "USER_DISABLED": "Conta desativada.",
    "EMAIL_EXISTS": "E-mail já existente.",
    "OPERATION_NOT_ALLOWED": "Operação não permitida.",
    "TOO_MANY_ATTEMPTS_TRY_LATER":
        "Muitas tentativas realizadas. Tente novamente mais tarde!"
  };

  AuthException(this.key);

  @override
  String toString() {
    if (erros.containsKey(key)) {
      return erros[key];
    } else {
      return "Ocorreu um erro na autenticação";
    }
  }
}
