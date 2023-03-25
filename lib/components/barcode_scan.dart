// import 'package:flutter/services.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class BarcodeScan  {
//   const MyWidget({super.key});

//     Future<void> barcodeScan() async {
//       String barcodeScanRes;
      
//       try {
//         barcodeScanRes = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Sair', true, ScanMode.DEFAULT);      
//       } on PlatformException catch(e){
//         barcodeScanRes = 'Falha ao obter a versão da plataforma: $e' ;
//       } catch(e) {
//         barcodeScanRes = e.toString();
//       }
//       return barcodeScanRes;
//     }
// }