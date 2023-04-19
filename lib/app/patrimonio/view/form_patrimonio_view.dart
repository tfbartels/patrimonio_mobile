import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:patrimonio_mobile/app/patrimonio/partimonio_controller.dart';
import 'package:patrimonio_mobile/app/patrimonio/patrimonio_model.dart';

import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import '../../pessoas/pessoa_controller.dart';
import '../../pessoas/pessoa_model.dart';


class FormPatrimonioView extends StatefulWidget {
  const FormPatrimonioView({super.key}); 

  @override
  State<FormPatrimonioView> createState() => _FormPatrimonioViewState();
}

class _FormPatrimonioViewState extends State<FormPatrimonioView> {

  final PatrimonioController patrimonioController = PatrimonioController();
  final PessoaController pessoaController = PessoaController();
  Patrimonio? patrimonio;  

  TextEditingController codigo = TextEditingController();
  TextEditingController descricao = TextEditingController();

  String titulo = '';

  bool isInclude = false;

  static String pessoaSelecionada (Pessoa option) => option.nome;


  Future<String?> barcodeScan() async {
    try {
      return  await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Sair', true, ScanMode.BARCODE);
    } on PlatformException catch(e){
      print('Falha ao obter a versão da plataforma: $e');
    } catch(e) {
      print(e.toString());
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {

    isInclude = ModalRoute.of(context)!.settings.arguments == null;
    if(isInclude){
      patrimonio =  Patrimonio(); 
      titulo = 'Incluir Patrimônio';
    }else{
      patrimonio = ModalRoute.of(context)!.settings.arguments  as Patrimonio;
      codigo.text = patrimonio!.codigo!;
      descricao.text = patrimonio!.descricao!;

      titulo = 'Editar Patrimônio';
    }

    return Scaffold(
        appBar: AppBar(
          title: Text(titulo),
        ),
        body: Column(
            children: [ 
              Row(                
                children: [
                  Flexible(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
                      child:                   
                        TextField(
                          enabled: isInclude,
                          controller: codigo,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            labelText: 'Código',
                            border: OutlineInputBorder()
                          ),
                          onChanged: (value) {},
                        ),
                      )
                  ),
                  if(isInclude) SizedBox(
                    width: 80,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 15.0, top: 15.0),
                      child:
                       IconButton(
                          icon: const Icon(Icons.qr_code),
                          onPressed: () async {
                              codigo.text = (await barcodeScan())!;
                          },
                        ),
                      )
                  ),
                ]
              ),         
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 15.0),
                child: TextField(
                  controller: descricao,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    border: OutlineInputBorder(),
                  ),
                  minLines: 3,
                  maxLines: 10,
                  onChanged: (value){
                    patrimonio!.descricao = value;
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Autocomplete<Pessoa>(
                    displayStringForOption: pessoaSelecionada,                    
                    optionsBuilder: (TextEditingValue textEditingValue) {
                      if (textEditingValue.text.length < 3) {
                        return const Iterable<Pessoa>.empty();
                      }
                      return  pessoaController.listPessoasByNome(textEditingValue.text);
                    },
                    onSelected: (Pessoa selection) {
                      debugPrint('You just selected ${pessoaSelecionada(selection)}');
                    },
                    fieldViewBuilder: (
                      BuildContext context,
                      TextEditingController fieldTextEditingController,
                      FocusNode fieldFocusNode,
                      VoidCallback onFieldSubmitted
                      ){
                        return TextField(
                          controller: fieldTextEditingController,
                          focusNode: fieldFocusNode,
                          decoration: InputDecoration(
                            labelText: 'Responsável',
                            border: OutlineInputBorder()
                          ),
                        );
                      },
                    ),
              ),              
              SizedBox(
                width: 130,
                height: 50,
                child: ElevatedButton(
                    child: const Text('Salvar',
                      style: TextStyle(
                        fontSize: 17, 
                        fontWeight: FontWeight.bold)
                    ),
                    onPressed: () {
                        patrimonioController.updatePatrimonio(patrimonio!);
                        Navigator.of(context).pop();
                    },
                ),
              )
          
            ]
       )
    );
  }
}