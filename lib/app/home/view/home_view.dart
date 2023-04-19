
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:patrimonio_mobile/app/patrimonio/partimonio_controller.dart';
import 'package:patrimonio_mobile/app/patrimonio/patrimonio_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  int _selectedIndex = 0;    
  final PatrimonioController patrimonioController = PatrimonioController();
  Patrimonio? patrimonio;
  

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


  Future<void> getPatrimonioScaningCodigo() async {
    final String? codigo;

    try {
      codigo = await barcodeScan();
      patrimonio = await patrimonioController.getPatrimonioByCodigo(codigo!);      
    } catch(e) {
      print(e.toString());
    }

  }

    
  Future<void> getPatrimonioTypingCodigo() async {    
    try {
       patrimonio = await Navigator.of(context).pushNamed('/busca_patrimonio') as Patrimonio;
    } catch(e) {
      print(e.toString());
    }

  }
  
  editPatrimonio() {
    Navigator.of(context).pushNamed('/form_patrimonio',arguments: patrimonio);
  }
  
  novoPatrimonio() {
    Navigator.of(context).pushNamed('/form_patrimonio');
  }
  

  void _onItemTapped(int index) async {
    switch (index) {
      case 0:
      
        break;
      
      case 1:
        await getPatrimonioScaningCodigo();
        editPatrimonio();
        break;
      
      case 2:
        await getPatrimonioTypingCodigo();
        editPatrimonio();
        break;
      
      case 3:
        novoPatrimonio();
        break;
    }

    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    final disabledColor = Theme.of(context).disabledColor;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patrimônio'),
      ),
      body: Center(        
         child: Container()
      ),
      // body: Center(        
      //   child: Column(          
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: [
      //       Container(
      //             alignment: Alignment.center,
      //             child: Flex(
      //                 direction: Axis.vertical,
      //                 mainAxisAlignment: MainAxisAlignment.center,
      //                 children: <Widget>[
      //                   SizedBox(
      //                     height: 50,
      //                     child: ElevatedButton(
      //                         onPressed: () async {
      //                             await getPatrimonioScaningCodigo();
      //                             editPatrimonio();                                  
      //                           },                              
      //                         child: const Text('Ler código de barras',
      //                           style: TextStyle(
      //                             fontSize: 17, 
      //                             fontWeight: FontWeight.bold)
      //                         )
      //                     ),
      //                   ),
      //                   Padding(
      //                     padding: const EdgeInsets.only(top: 12.0),
      //                     child: SizedBox(
      //                       height: 50,
      //                       child: ElevatedButton(
      //                           onPressed: () async {
      //                             await getPatrimonioTypingCodigo();
      //                             editPatrimonio();
      //                           },
      //                           child: const Text('Digitar código de barras',
      //                             style: TextStyle(
      //                               fontSize: 17, 
      //                               fontWeight: FontWeight.bold)
      //                           )
      //                       ),
      //                     ),
      //                   ),
      //                 ]
      //               )
      //         )
      //     ],
      //   ),
      // ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Início',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code),
            label: 'Ler código ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline),
            label: 'Novo',
          ),
        ],
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedIndex,
        selectedItemColor: primaryColor,
        unselectedItemColor: disabledColor,
        onTap: _onItemTapped,
      ),
    );
  }
}
