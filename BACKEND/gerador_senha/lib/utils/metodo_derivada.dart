import 'dart:convert';
import 'package:crypto/crypto.dart';

/* Enum para os métodos disponíveis */
enum Metododerivada { md5, sha1, sha256 }

String aplicarHashs(String semete, Metododerivada metodo) {
  final bytes = utf8.encode(semete);
  /* Digest é o objeto que representa o resultado de um algoritmo de hash */
  Digest resumo;

  switch (metodo) {
    case Metododerivada.md5:
      resumo = md5.convert(bytes);
      break;
    case Metododerivada.sha1:
      resumo = sha1.convert(bytes);
      break;
    case Metododerivada.sha256:
      resumo = sha256.convert(bytes);
      break;
  }
  return resumo.toString();
}
