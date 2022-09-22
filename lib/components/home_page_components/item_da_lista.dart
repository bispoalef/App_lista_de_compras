import 'package:flutter/material.dart';
import 'package:lista_compras/models/lista_produtos.dart';
import 'package:lista_compras/view/editar_produto.dart';

import '../../models/produto.dart';

class ItemDaLista extends StatefulWidget {
  const ItemDaLista({
    Key? key,
    this.produto,
    this.list,
  }) : super(key: key);

  final Produto? produto;
  final ListaDeProdutos? list;

  @override
  State<ItemDaLista> createState() => _ItemListaComponenteState();
}

class _ItemListaComponenteState extends State<ItemDaLista> {
  bool checkBox = true;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(10),
        ),
        height: size.height * 0.07,
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(
                    value: checkBox,
                    onChanged: (bool? newValue) {
                      setState(() {
                        checkBox = newValue!;
                        widget.list!.removerProduto(widget.produto!);
                      });
                    }),
                Column(
                  children: [
                    Text(
                      widget.produto!.nome,
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Text(
                      'Quantidade ${widget.produto!.quantidade}',
                      style: const TextStyle(
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                Container(width: 20),
                Text(
                  'R\$ ${widget.produto!.preco.toStringAsFixed(2)}',
                  style: const TextStyle(
                      fontSize: 20,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => EditarProduto(
                        produto: widget.produto,
                        list: widget.list,
                      ),
                    ));
                  },
                  icon: const Icon(Icons.edit),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
