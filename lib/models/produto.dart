import 'package:flutter/foundation.dart';

class Produto {
  String id;
  String nome;
  String quantidade;
  String categoria;
  bool iscomplete;

  Produto(
      {@required this.id,
      @required this.nome,
      @required this.quantidade,
      @required this.categoria,
      @required this.iscomplete});

  Produto.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    quantidade = json['quantidade'];
    categoria = json['categoria'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['quantidade'] = this.quantidade;
    data['categoria'] = this.categoria;
    return data;
  }
}
