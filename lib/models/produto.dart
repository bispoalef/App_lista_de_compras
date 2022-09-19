class Produto {
  final int id;
  String nome;
  final double preco;
  final int quantidade;

  Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.quantidade,
  });

  @override
  String toString() {
    return 'Produto(id: $id, nome: $nome, preco: $preco, quantidade: $quantidade)';
  }
}
