
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

import 'package:patrimonio_mobile/app/patrimonio/patrimonio_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});
  
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  
  String _scanBarcode = 'Unknown';
  Patrimonio? patrimonio;
  
  Future<void> barcodeScan() async {
    String barcodeScanRes;
    
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Sair', true, ScanMode.DEFAULT);      
    } on PlatformException catch(e){
      barcodeScanRes = 'Falha ao obter a versão da plataforma: $e' ;
    } catch(e) {
      barcodeScanRes = e.toString();
    }

    setState(() {
      _scanBarcode = barcodeScanRes;
    });
  }


    
  Future<void> getPatrimonioByCodigo() async {
    
    try {
       patrimonio = await Navigator.of(context).pushNamed('/busca_patrimonio') as Patrimonio;
    } catch(e) {
      print(e.toString());
    }

  }
  
  editPatrimonio() {
    Navigator.of(context).pushNamed('/form_patrimonio',arguments: patrimonio);      
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patrimônio'),
      ),
      body: Center(        
        child: Column(          
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                  alignment: Alignment.center,
                  child: Flex(
                      direction: Axis.vertical,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Resultado : $_scanBarcode\n',
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold)),
                        SizedBox(
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () => barcodeScan(),
                              child: const Text('Ler código de barras',
                                style: TextStyle(
                                  fontSize: 17, 
                                  fontWeight: FontWeight.bold)
                              )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 12.0),
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () async {
                                  await getPatrimonioByCodigo();
                                  editPatrimonio();
                                },
                                child: const Text('Digitar código de barras',
                                  style: TextStyle(
                                    fontSize: 17, 
                                    fontWeight: FontWeight.bold)
                                )
                            ),
                          ),
                        ),
                      ]
                    )
              )
          ],
        ),
      ),
    );
  }
}
