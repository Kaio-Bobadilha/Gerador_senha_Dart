import 'dart:async';
import 'package:dart_odbc/dart_odbc.dart';

class Oracleconectar {
  late DartOdbc odbc;

  final usuario = 'C##Trabalho_dart';
  final senha = '1234';

  final dsn = 'Driver={Oracle in OraClient19Home1};Dbq=localhost:1521/xe;';

  final pathToDriver = '<path_to_odbc_driver>';

  Future<void> connect() async {
    odbc = DartOdbc(dsn: dsn, pathToDriver: pathToDriver);

    await odbc.connect(username: usuario, password: senha);
  }

  Future<List<Map<String, dynamic>>> query(String sql) async {
    final List<Map<String, dynamic>> result = await odbc.execute(sql);
    return result;
  }

  Future<void> close() async {
    await odbc.disconnect();
  }
}
