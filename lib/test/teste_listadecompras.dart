import 'package:minhas_compras/models/listadecompra.dart';
import 'package:minhas_compras/models/produto.dart';

main() {
  var compras = ListadeCompra(
      nome: "Compra de Julho",
      data: DateTime.now(),
      listadecompra: [
        Produto(nome: "Açúcar", quantidade: "2x", categoria: "Grosso"),
        Produto(nome: "Sal", quantidade: "Padrão", categoria: "Grosso"),
        Produto(nome: "Desinfetante", quantidade: "3x", categoria: "LeH"),
        Produto(nome: "Desodorante", quantidade: "1x", categoria: "LeH"),
        Produto(nome: "Sabonete", quantidade: "Padrão", categoria: "LeH"),
        Produto(nome: "Fio Dental", quantidade: "2x", categoria: "LeH"),
        Produto(
            nome: "Lâmina de Barbear", quantidade: "Padrão", categoria: "LeH"),
        Produto(nome: "Peixe", quantidade: "3x", categoria: "Frios"),
        Produto(nome: "Salsicha", quantidade: "1x", categoria: "Frios"),
      ]);

  print(compras.nome);
  print(compras.listadecompra[3].nome);
}
