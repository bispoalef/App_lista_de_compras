import 'package:flutter/material.dart';
import 'package:lista_compras/models/produto.dart';

import '../models/lista_produtos.dart';

class EditarProduto extends StatelessWidget {
  const EditarProduto({this.produto, this.list, Key? key}) : super(key: key);
  final Produto? produto;
  final ListaDeProdutos? list;

  @override
  Widget build(BuildContext context) {
    TextEditingController controllerNome = TextEditingController();
    TextEditingController controllerQuantidade = TextEditingController();
    TextEditingController controllerPreco = TextEditingController();

    void Salvar() {
      String nome = controllerNome.text;
      double preco = double.parse(controllerPreco.text);
      int quantidade = int.parse(controllerQuantidade.text);
      list!.editarProduto(
        produto!,
        nome,
        preco,
        quantidade,
      );
      Navigator.of(context).pop();
    }

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: controllerNome,
                decoration: InputDecoration(hintText: produto!.nome),
              ),
              TextField(
                controller: controllerPreco,
                decoration:
                    InputDecoration(hintText: produto!.preco.toString()),
              ),
              TextField(
                controller: controllerQuantidade,
                decoration:
                    InputDecoration(hintText: produto!.quantidade.toString()),
              ),
              ElevatedButton(onPressed: Salvar, child: const Text('Salvar'))
            ],
          ),
        ));
  }
}
