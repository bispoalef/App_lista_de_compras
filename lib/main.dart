import 'package:flutter/material.dart';
import 'package:lista_compras/models/lista_produtos.dart';
import 'package:lista_compras/view/editar_produto.dart';
import 'package:lista_compras/view/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ListaDeProdutos(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        // darkTheme: ThemeData.dark(),
        theme: ThemeData(),
        initialRoute: 'home',
        routes: {
          'home': (context) => HomePage(),
          'editarProduto': (context) => const EditarProduto(),
        },
      ),
    );
  }
}
