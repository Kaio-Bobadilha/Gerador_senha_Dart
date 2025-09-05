import 'dart:math';
import 'package:gerador_senha/Seed_senha.dart';
import 'package:gerador_senha/utils/metodo_derivada.dart';

class GeradorSenhaService {
  /*
  * Gera a senha final, orquestrando todas as etapas do processo.
  *
  * 1. Valida os dados de entrada.
  * 2. Combina os campos para criar a semente.
  * 3. Aplica o método de hash escolhido.
  * 4. Formata a senha final.
  */
  String gerarSenha(Seed_senha seedData, Metododerivada metodo) {
    // Validação da lógica de negócio.
    if (seedData.servico.isEmpty || seedData.fraseSecreta.isEmpty) {
      throw ArgumentError(
        'Os campos Serviço e Frase Secreta são obrigatórios.',
      );
    }
    if (seedData.tamanho <= 0) {
      throw ArgumentError('O comprimento da senha deve ser maior que zero.');
    }

    // Combina os dados de entrada para formar a semente
    String sementeCombinada = seedData.combinarSemente();

    // Aplica o método de hash e obtém a chave derivada
    String chaveDerivada = aplicarHashs(sementeCombinada, metodo);

    // Formata a senha final com base nas opções do usuário
    return _formatarSenha(chaveDerivada, seedData);
  }

  /// Converte a chave derivada (hash) em uma senha formatada, garantindo diversidade.
  String _formatarSenha(String chave, Seed_senha seedData) {
    // Define os alfabetos de caracteres com base nas opções do usuário
    String caracteresPermitidos = '';
    String minusculas = 'abcdefghijklmnopqrstuvwxyz';
    String maiusculas = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
    String especiais = '!@#\$%^&*()_+-=[]{}|';

    if (seedData.usarMinusculas) {
      caracteresPermitidos += minusculas;
    }
    if (seedData.usarMaisculas) {
      caracteresPermitidos += maiusculas;
    }
    if (seedData.usarCaracterEspecial) {
      caracteresPermitidos += especiais;
    }

    if (caracteresPermitidos.isEmpty) {
      throw ArgumentError('Nenhuma opção de caractere foi selecionada.');
    }

    // Usa a chave de hash como semente para o gerador de números aleatórios, garantindo determinismo
    Random random = Random(chave.hashCode);

    List<String> senhaList = [];

    // Garante que a senha final contenha pelo menos um caractere de cada tipo selecionado
    if (seedData.usarMinusculas)
      senhaList.add(minusculas[random.nextInt(minusculas.length)]);
    if (seedData.usarMaisculas)
      senhaList.add(maiusculas[random.nextInt(maiusculas.length)]);
    if (seedData.usarCaracterEspecial)
      senhaList.add(especiais[random.nextInt(especiais.length)]);

    // Preenche o restante da senha com caracteres aleatórios do alfabeto completo
    while (senhaList.length < seedData.tamanho) {
      senhaList.add(
        caracteresPermitidos[random.nextInt(caracteresPermitidos.length)],
      );
    }

    // Embaralha a lista para que a senha não comece sempre com um caractere obrigatório
    senhaList.shuffle(random);

    return senhaList.join();
  }
}
