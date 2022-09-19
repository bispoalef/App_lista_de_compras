import 'package:lista_compras/models/produto.dart';

import '../data/lista_mocada.dart';

class ListaDeProdutos {
  final List<Produto> _list = listaMocada;

  List<Produto> get getLista => [..._list];

  void adicionarProduto(Produto produto) {
    _list.add(produto);
  }

  void removerProduto(Produto produto) {
    _list.remove(produto.id);
  }
}
