import 'package:flutter/material.dart';
import 'package:patrimonio_mobile/app/patrimonio/partimonio_controller.dart';
import 'package:patrimonio_mobile/app/patrimonio/patrimonio_model.dart';



class BuscaPatrimonioView extends StatefulWidget {
  const BuscaPatrimonioView({super.key}); 

  @override
  State<BuscaPatrimonioView> createState() => _BuscaPatrimonioViewState();
}

class _BuscaPatrimonioViewState extends State<BuscaPatrimonioView> {

  final PatrimonioController patrimonioController = PatrimonioController();
  String codigo = '';
  Patrimonio? patrimonio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Buscar Patrimônio'),
        ),
        body: Column(
            children: [          
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Código',
                    border: OutlineInputBorder()
                  ),
                  onChanged: (value){
                    codigo = value;
                  },
                ),
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                    child: const Text('Buscar',
                      style: TextStyle(
                        fontSize: 17, 
                        fontWeight: FontWeight.bold)
                    ),
                    onPressed: () async{
                      patrimonio = await patrimonioController.getPatrimonioByCodigo(codigo);
                      Navigator.of(context).pop(patrimonio);
                    },
                ),
              )
          
            ]
       )
    );
  }
}