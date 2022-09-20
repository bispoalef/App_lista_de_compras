import 'package:flutter/material.dart';
import 'package:lista_compras/components/home_page_components/item_da_lista.dart';
import 'package:lista_compras/models/lista_produtos.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  late ListaDeProdutos lista = ListaDeProdutos();
  @override
  Widget build(BuildContext context) {
    lista = Provider.of<ListaDeProdutos>(context);

    return Scaffold(
      body: ListView.separated(
        separatorBuilder: (_, __) => const Divider(
          endIndent: 20,
          indent: 20,
        ),
        itemCount: lista.getLista.length,
        itemBuilder: ((context, index) =>
            ItemDaLista(list: lista, produto: lista.getLista[index])),
      ),
    );
  }
}
