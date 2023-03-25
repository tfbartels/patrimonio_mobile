import 'package:http/http.dart' as http;
import 'dart:convert';

import 'partimonio_repository.dart';
import 'package:patrimonio_mobile/app/patrimonio/patrimonio_model.dart';

class PatrimonioController {

  PatrimonioRepository repository = PatrimonioRepository();

  Future<Patrimonio> getPatrimonioByCodigo(String codigo) async {
    return repository.getPatrimonioByCodigo(codigo);
  }
}