import 'package:flutter/material.dart';
import 'package:lista_compras/models/lista_produtos.dart';
import 'package:lista_compras/models/produto.dart';

Future<dynamic> edit_produto_dialog(
    BuildContext context, Size size, Produto produto, ListaDeProdutos list) {
  TextEditingController controllerNome = TextEditingController();
  TextEditingController controllerQuantidade = TextEditingController();
  TextEditingController controllerPreco = TextEditingController();

  controllerNome.text = produto.nome;
  controllerPreco.text = '${produto.preco}';
  controllerQuantidade.text = '${produto.quantidade}';

  void Salvar() {
    String nome = controllerNome.text;
    double preco = double.parse(controllerPreco.text);
    int quantidade = int.parse(controllerQuantidade.text);
    list.editarProduto(
      produto,
      nome,
      preco,
      quantidade,
    );
    Navigator.of(context).pop();
  }

  return showDialog(
      context: context,
      builder: (_) => AlertDialog(
            content: SizedBox(
                height: size.height * 0.35,
                child: Column(
                  children: [
                    TextField(
                      decoration: const InputDecoration(label: Text('Nome')),
                      controller: controllerNome,
                    ),
                    TextField(
                      decoration: const InputDecoration(label: Text('Preço')),
                      controller: controllerPreco,
                    ),
                    TextField(
                      decoration:
                          const InputDecoration(label: Text('Quantidade')),
                      controller: controllerQuantidade,
                    ),
                    Container(height: 20),
                    ElevatedButton(
                        onPressed: Salvar, child: const Text('Salvar'))
                  ],
                )),
          ));
}
