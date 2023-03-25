
import 'package:flutter/material.dart';


import 'app/home/view/home_view.dart';
import 'app/patrimonio/view/busca_patrimonio_view.dart';
import 'app/patrimonio/view/form_patrimonio_view.dart';


void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
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
