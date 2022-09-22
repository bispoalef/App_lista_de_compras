import 'package:flutter/material.dart';
import 'package:lista_compras/models/produto.dart';

class EditarProduto extends StatelessWidget {
  const EditarProduto({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Produto produto =
        ModalRoute.of(context)!.settings.arguments as Produto;

    TextEditingController controllerNome = TextEditingController();

    void Salvar() {
      produto.setNome = controllerNome.text;
      Navigator.of(context).pop();

      print(produto.nome);
    }

    return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              TextField(
                controller: controllerNome,
                decoration: InputDecoration(hintText: produto.nome),
              ),
              TextField(
                decoration: InputDecoration(hintText: produto.preco.toString()),
              ),
              TextField(
                decoration:
                    InputDecoration(hintText: produto.quantidade.toString()),
              ),
              ElevatedButton(onPressed: Salvar, child: const Text('Salvar'))
            ],
          ),
        ));
  }
}
