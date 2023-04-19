
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app/home/view/home_view.dart';
import 'app/patrimonio/view/busca_patrimonio_view.dart';
import 'app/patrimonio/view/form_patrimonio_view.dart';


void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {  
    return MaterialApp(
      title: 'Patrimonio',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
     // home: const HomePage(title: 'Flutter Demo Home Page'),
      routes: {       
        '/': (context) => const HomeView(),
        '/busca_patrimonio': (context) => const BuscaPatrimonioView(),
        '/form_patrimonio': (context) => const FormPatrimonioView(),
      },
    );
  }
}
