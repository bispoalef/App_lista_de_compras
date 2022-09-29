import 'package:flutter/cupertino.dart';
import 'package:lista_compras/models/produto.dart';

import '../data/lista_mocada.dart';

class ListaDeProdutos extends ChangeNotifier {
  final List<Produto> _list = listaMocada;
  final List<Produto> carrinho = [];

  List<Produto> get getLista => [..._list];

  void adicionarProduto(Produto produto) {
    _list.add(produto);
    notifyListeners();
  }

  void inserirNoIndex(int index, Produto prod) {
    _list.insert(index, prod);
    notifyListeners();
  }

  removerNoIndex(int index) {
    _list.removeAt(index);
    notifyListeners();
  }

  void removerProduto(Produto produto) {
    carrinho.add(produto);
    _list.remove(produto);
    notifyListeners();
  }

  void editarProduto(
    Produto produto,
    String nome,
    double preco,
    int quantidade,
  ) {
    produto.setNome = nome;
    produto.setPreco = preco;
    produto.setQuantidade = quantidade;

    notifyListeners();
  }
}
