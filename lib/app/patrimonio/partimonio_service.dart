import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:patrimonio_mobile/app/patrimonio/patrimonio_model.dart';

class PatrimonioService{
  
  Future<Patrimonio> getPatrimonioByCodigo(String codigo) async {
    final client = http.Client();
    final url = Uri.parse('${dotenv.env['API_URL']}/patrimonios?codigo=$codigo');
    Patrimonio patrimonio = Patrimonio();

    try {
      final response = await client.get(url);      
      patrimonio.fromJson(jsonDecode(response.body)[0]);
      return  patrimonio;
    }catch(e){
      throw Exception(e);
    }
     finally {
      client.close();
    }
  }


  Future<void> updatePatrimonio(Patrimonio patrimonio) async {
    var client = http.Client();
    final url = Uri.parse('${dotenv.env['API_URL']}/patrimonios/${patrimonio.id}');
    try {
      var response = await client.patch(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'descricao': patrimonio.descricao,
        }),
      );
      //return  Patrimonio.fromJson(jsonDecode(response.body)[0]);
    } finally {
      client.close();
    }
  }

  Future<void> insertPatrimonio(Patrimonio patrimonio) async {
    var client = http.Client();
    final url = Uri.parse('${dotenv.env['API_URL']}/patrimonios/');
    try {
      var response = await client.post(url,
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode({
          'descricao': patrimonio.descricao,
        }),
      );
      //return  Patrimonio.fromJson(jsonDecode(response.body)[0]);
    } finally {
      client.close();
    }
  }
}