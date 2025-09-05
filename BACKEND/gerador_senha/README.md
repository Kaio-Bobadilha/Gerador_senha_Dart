# gerador_senha

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

------------------------------------------------------------------------------------------------

Descrição dos Arquivos

1. lib/Seed_senha.dart:
    Este arquivo contém a classe Seed_senha. A função principal deste modelo é agrupar todos os dados de entrada do usuário em um único objeto. Em vez de passar vários parâmetros soltos entre as funções, essa classe organiza tudo de forma limpa e estruturada.

    EX: Define o modelo de dados Seed_senha para encapsular todas as entradas do usuário, como serviço, frase secreta e opções de formatação. Isso centraliza a coleta de dados e facilita a passagem de informações entre as funções.

2. lib/utils/metodo_derivada.dart
    Este arquivo é responsável por toda a lógica de hash. Ele define o Enum Metododerivada, que lista os algoritmos disponíveis (MD5, SHA-1, SHA-256), e a função aplicarHashs, que executa o cálculo do hash. Separar essa lógica garante que o código seja mais fácil de manter e testar.

    EX: Implementa a lógica de hash. O arquivo define os métodos de derivação de hash (Enum Metododerivada) e contém a função aplicarHashs para gerar a chave de hash a partir da semente, mantendo essa lógica isolada e reutilizável.

3. lib/gerador_senha_service.dart
    Este é o arquivo central do seu backend. A classe GeradorSenhaService funciona como um orquestrador, coordenando todo o processo de geração da senha.

    - Validação de Dados: Ele garante que os campos obrigatórios tenham sido preenchidos, agindo como uma camada de segurança adicional à validação da UI.

    - Processamento da Semente: O serviço pega os dados do usuário, combina-os em uma "semente" e aplica o método de hash escolhido.

    - Formatação Final: Ele chama a função _formatarSenha para criar a senha final, garantindo que ela tenha o tamanho e os tipos de caracteres corretos (maiúsculas, minúsculas, símbolos).

    - A separação de lógica de formatação em um método privado (_formatarSenha) é uma ótima prática de engenharia de software que aumenta a legibilidade e facilita a manutenção do código.

