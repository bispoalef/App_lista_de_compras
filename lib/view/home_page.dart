import 'package:flutter/material.dart';
import 'package:lista_compras/components/home_page_components/item_da_lista.dart';
import 'package:lista_compras/models/lista_produtos.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late ListaDeProdutos lista = ListaDeProdutos();

  @override
  Widget build(BuildContext context) {
    lista = Provider.of<ListaDeProdutos>(context);

    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text('Lista de Comptras')),
          actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.add))]),
      body: ReorderableListView.builder(
        onReorder: (oldIndex, newIndex) => setState(
          () {
            final index = newIndex > oldIndex ? newIndex -= 1 : newIndex;
            final prod = lista.getLista[oldIndex];

            lista.removerNoIndex(oldIndex);
            lista.inserirNoIndex(index, prod);
          },
        ),
        // separatorBuilder: (_, __) => const
        itemCount: lista.getLista.length,
        itemBuilder: ((context, index) => ItemDaLista(
              key: ValueKey(lista.getLista[index]),
              list: lista,
              produto: lista.getLista[index],
            )),
      ),
    );
  }
}
