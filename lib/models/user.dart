import 'package:flutter/material.dart';
class User{
  final String cpf;
  final String nome;
  final String email;
  final String id;
  final String avatarUrl;
  final String telefone;
  final String endereco;

  const User({
    this.cpf,
    @required this.nome,
    @required this.email,
    @required this.id,
    @required this.avatarUrl,
    @required this.telefone,
    @required this.endereco,
  });
}