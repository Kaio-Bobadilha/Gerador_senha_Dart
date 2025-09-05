// ignore_for_file: file_names

/* Criação da classe da semente o que tera*/

// ignore: camel_case_types
class Seed_senha {
  final String servico;
  final String fraseSecreta;
  final int tamanho;
  final String nome;
  final String ano;
  final String seedExtra;
  final bool usarMaisculas;
  final bool usarMinusculas;
  final bool usarCaracterEspecial;

  Seed_senha({
    required this.servico,
    required this.fraseSecreta,
    required this.tamanho,
    this.nome = '',
    this.ano = '',
    this.seedExtra = '',
    this.usarMaisculas = true,
    this.usarMinusculas = true,
    this.usarCaracterEspecial = true,
  });

  String combinarSemente() {
    final partes = [servico, fraseSecreta, nome, ano, seedExtra];
    return partes.join('|');
  }
}
