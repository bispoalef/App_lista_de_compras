import 'package:flutter/material.dart';
import 'package:lista_compras/components/home_page_components/item_da_lista_carrinho.dart';
import 'package:lista_compras/components/home_page_components/item_da_lista_pendente.dart';
import 'package:lista_compras/models/lista_produtos.dart';
import 'package:lista_compras/models/produto.dart';
import 'package:provider/provider.dart';

import '../components/home_page_components/novo_produto_dialog.dart';

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
    var size = MediaQuery.of(context).size;

    List<Produto> carrinho = lista.getCarrinho;

    return Scaffold(
      appBar: AppBar(
          title: const Center(child: Text('Lista de Comptras')),
          actions: [
            IconButton(
                onPressed: () {
                  novoProdutoDialog(context, size, lista);
                },
                icon: const Icon(Icons.add))
          ]),
      body: Column(
        children: [
          Flexible(
            child: Container(
              color: Colors.orange,
              child: ReorderableListView.builder(
                onReorder: (oldIndex, newIndex) => setState(
                  () {
                    final index =
                        newIndex > oldIndex ? newIndex -= 1 : newIndex;
                    final prod = lista.getLista[oldIndex];

                    lista.removerNoIndex(oldIndex);
                    lista.inserirNoIndex(index, prod);
                  },
                ),
                itemCount: lista.getLista.length,
                itemBuilder: ((context, index) => ItemDaListaPendente(
                      key: ValueKey(lista.getLista[index]),
                      list: lista,
                      produto: lista.getLista[index],
                    )),
              ),
            ),
          ),
          Text('Total R\$${lista.valorTotalCarrinho().toStringAsFixed(2)}',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              )),
          Flexible(
            child: Container(
              color: Colors.yellow,
              child: carrinho.isEmpty
                  ? const Center(
                      child: Text(
                      'Carrinho Vazio',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ))
                  : ListView.builder(
                      itemCount: carrinho.length,
                      itemBuilder: (context, index) => ItemDaListaCarrinho(
                          list: lista, produto: carrinho[index]),
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
