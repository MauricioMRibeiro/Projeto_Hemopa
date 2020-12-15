import 'package:flutter/material.dart';

class User {
  final String cpf;
  final String nome;
  final String email;
  final String id;
  final String avatarUrl;
  final String telefone;
  final String endereco;
  final String senha;
  //inseri novos dados:
  final String datanasc;
  final String rg;
  final String cep;
  final String cidade;
  final String uf;
  final String numero;
  final String bairro;
  final String sexo;
  final String celular;

  const User({
    this.cpf,
    @required this.nome,
    @required this.email,
    @required this.id,
    @required this.avatarUrl,
    @required this.telefone,
    @required this.endereco,
    @required this.senha,
    //inseri novos dados:
    @required this.datanasc,
    @required this.rg,
    @required this.cep,
    @required this.cidade,
    @required this.uf,
    @required this.numero,
    @required this.bairro,
    @required this.sexo,
    @required this.celular,
  });
}
