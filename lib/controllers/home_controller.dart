import 'package:flutter/material.dart';
import 'package:lista_compras/models/lista_produtos.dart';
import 'package:lista_compras/models/produto.dart';

class HomeController {
  final ListaDeProdutos lista;

  HomeController({
    required this.lista,
  });
  ValueNotifier<List<Produto>> listaDeProduto =
      ValueNotifier<List<Produto>>([]);

  getLista() {
    listaDeProduto.value = lista.getLista;
  }

  removerItem() {
    print('remo');

    listaDeProduto.value[0].nome = 'ana';
  }
}
