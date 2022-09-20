import 'package:flutter/cupertino.dart';
import 'package:lista_compras/models/produto.dart';

import '../data/lista_mocada.dart';

class ListaDeProdutos extends ChangeNotifier {
  final List<Produto> _list = listaMocada;

  List<Produto> get getLista => [..._list];

  void adicionarProduto(Produto produto) {
    _list.add(produto);
    notifyListeners();
  }

  void removerProduto(Produto produto) {
    _list.remove(produto);
    notifyListeners();
  }
}
