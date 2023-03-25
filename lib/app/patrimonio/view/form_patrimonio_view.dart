import 'package:flutter/material.dart';
import 'package:patrimonio_mobile/app/patrimonio/partimonio_controller.dart';
import 'package:patrimonio_mobile/app/patrimonio/patrimonio_model.dart';


class FormPatrimonioView extends StatefulWidget {
  const FormPatrimonioView({super.key}); 

  @override
  State<FormPatrimonioView> createState() => _FormPatrimonioViewState();
}

class _FormPatrimonioViewState extends State<FormPatrimonioView> {

  final PatrimonioController patrimonioController = PatrimonioController();
  Patrimonio? patrimonio;  

  TextEditingController codigo = TextEditingController();
  TextEditingController descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {    
    patrimonio = ModalRoute.of(context)!.settings.arguments as Patrimonio;
    codigo.text = patrimonio!.codigo;
    descricao.text = patrimonio!.descricao;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar Patrimônio'),
        ),
        body: Column(
            children: [ 
              Padding(
                padding: const EdgeInsets.only(right: 15.0, left: 15.0, top: 15.0),
                child: TextField(
                  controller: codigo,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Código',
                    border: OutlineInputBorder()
                  ),
                  onChanged: (value){
                    
                  },
                ),
              ),         
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  controller: descricao,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Descrição',
                    border: OutlineInputBorder()
                  ),
                  onChanged: (value){
                   // patrimonio.descricao = value;
                  },
                ),
              ),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                    child: const Text('Salvar',
                      style: TextStyle(
                        fontSize: 17, 
                        fontWeight: FontWeight.bold)
                    ),
                    onPressed: () {
                         print(patrimonio!.descricao);            
               
                    },
                ),
              )
          
            ]
       )
    );
  }
}