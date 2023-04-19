import 'partimonio_service.dart';
import 'package:patrimonio_mobile/app/patrimonio/patrimonio_model.dart';

class PatrimonioController {

  PatrimonioService service = PatrimonioService();

  Future<Patrimonio> getPatrimonioByCodigo(String codigo) async {
    return service.getPatrimonioByCodigo(codigo);
  }

  Future<void> updatePatrimonio(Patrimonio patrimonio) async {
    service.updatePatrimonio(patrimonio);
  }
}