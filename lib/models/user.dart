import 'package:flutter/material.dart';

class User {
  final String cpf;
  final String nome;
  final String email;
  //final String id;
  final String avatarUrl;
  final String telefone;
  final String endereco;
  final String senha;
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
    //@required this.id,
    @required this.avatarUrl,
    @required this.telefone,
    @required this.endereco,
    @required this.senha,
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      cpf: json['cpf'],
      //id: json['id'],
      nome: json['nome'],
      email: json['email'],
      datanasc: json['datanasc'],
      senha: json['senha'],
      rg: json['rg'],
      telefone: json['telefone'],
      avatarUrl: json['avatarUrl'],
      sexo: json['sexo'],
      celular: json['celular'],
      endereco: json['endereco'],
      numero: json['numero'],
      bairro: json['bairro'],
      cep: json['cep'],
      cidade: json['cidade'],
      uf: json['uf'],

    );
  }
}
