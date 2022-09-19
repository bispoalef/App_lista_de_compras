import 'package:flutter/material.dart';
import 'package:lista_compras/components/home_page_components/item_da_lista.dart';
import 'package:lista_compras/controllers/home_controller.dart';
import 'package:lista_compras/models/lista_produtos.dart';
import 'package:lista_compras/models/produto.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final HomeController controller = HomeController(lista: ListaDeProdutos());

    controller.getLista();

    return Scaffold(
      body: ValueListenableBuilder<List<Produto>>(
        valueListenable: controller.listaDeProduto,
        builder: (_, listaProd, __) => ListView.separated(
          separatorBuilder: (_, __) => const Divider(
            endIndent: 20,
            indent: 20,
          ),
          itemCount: listaProd.length,
          itemBuilder: ((context, index) =>
              ItemDaLista(controller: controller, produto: listaProd[index])),
        ),
      ),
    );
  }
}
