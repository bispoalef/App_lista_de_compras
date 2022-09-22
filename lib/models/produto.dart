// ignore_for_file: public_member_api_docs, sort_constructors_first
class Produto {
  int id;
  String nome;
  double preco;
  int quantidade;
  Produto({
    required this.id,
    required this.nome,
    required this.preco,
    required this.quantidade,
  });

  set setNome(nome) => this.nome = nome;

  set setPreco(preco) => this.preco = preco;

  set setQuantidade(quantidade) => this.quantidade = quantidade;

  @override
  String toString() {
    return 'Produto(id: $id, nome: $nome, preco: $preco, quantidade: $quantidade)';
  }
}
