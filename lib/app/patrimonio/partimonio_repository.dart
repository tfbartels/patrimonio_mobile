import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:patrimonio_mobile/app/patrimonio/patrimonio_model.dart';

class PatrimonioRepository{
  
  Future<Patrimonio> getPatrimonioByCodigo(String codigo) async {
    var client = http.Client();
    try {
      var response = await client.get(Uri.parse('http://192.168.0.45:3000/patrimonios?codigo=$codigo'));
      return  Patrimonio.fromJson(jsonDecode(response.body)[0]);
    } finally {
      client.close();
    }
  }
}