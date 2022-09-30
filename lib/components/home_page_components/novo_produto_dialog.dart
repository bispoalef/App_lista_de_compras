import 'dart:math';

import 'package:flutter/material.dart';
import 'package:lista_compras/models/lista_produtos.dart';
import 'package:lista_compras/models/produto.dart';

Future<dynamic> novoProdutoDialog(
    BuildContext context, Size size, ListaDeProdutos lista) {
  TextEditingController nomeController = TextEditingController();
  TextEditingController quantidadeController = TextEditingController();
  TextEditingController precoController = TextEditingController();
  return showDialog(
    context: context,
    builder: (_) => AlertDialog(
      content: SizedBox(
          height: size.height * 0.35,
          child: Column(
            children: [
              TextField(
                  controller: nomeController,
                  decoration: textDecoration('Nome')),
              TextField(
                  controller: quantidadeController,
                  decoration: textDecoration('Quantidade')),
              TextField(
                  controller: precoController,
                  decoration: textDecoration('Preço')),
              Container(height: 20),
              ElevatedButton(
                  onPressed: () {
                    lista.adicionarProduto(
                      Produto(
                        id: Random().nextInt(100),
                        nome: nomeController.text,
                        preco: double.parse(precoController.text),
                        quantidade: int.parse(quantidadeController.text),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: const Text('Salvar'))
            ],
          )),
    ),
  );
}

InputDecoration textDecoration(String texto) {
  return InputDecoration(
    hintText: texto,
  );
}
