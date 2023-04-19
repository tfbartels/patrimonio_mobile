import 'package:patrimonio_mobile/app/pessoas/pessoa_model.dart';

import 'pessoa_service.dart';


class PessoaController {

  PessoaService service = PessoaService();

  Future<List<Pessoa>> listPessoasByNome(String nome) async {
    return service.listPessoasByNome(nome);
  }

}