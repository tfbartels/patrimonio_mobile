import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:patrimonio_mobile/app/pessoas/pessoa_model.dart';


class PessoaService{
  
  Future<List<Pessoa>> listPessoasByNome(String nome) async {    
    final url = Uri.parse('${dotenv.env['API_URL']}/pessoas?nome_like=$nome');

  //  try {
      final response = await http.get(url);
      final json = jsonDecode(response.body);      
      return List<Pessoa>.from(json.map((item) {
        Pessoa pessoa = Pessoa();
        pessoa.fromJson(item);
        return pessoa;
      }));       
  //  } catch(){

  //  }
  }


}