import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hemopa_app/data/dummy_Users.dart';
import 'package:hemopa_app/models/user.dart';


class Users with ChangeNotifier{
 final Map<String, User> _items = {...DUMMY_USERS};


  List<User> get all {
    return [..._items.values];
  }


  int get count{
    return _items.length;
  }

  User byIndex(int i){
    return _items.values.elementAt(i);
  }

//verifica se o usuario existe
  void put(User user){
    if(user == null){
      return;
    }
// Aletra cadastro
    if(user.cpf != null && !user.cpf.trim().isEmpty && _items.containsKey(user.cpf)){
      _items.update(
        user.cpf,
        (_) => User(
          cpf: user.cpf,
          nome: user.nome,
          id: user.id,
          email: user.email,
          avatarUrl: user.avatarUrl,
          endereco: user.endereco,
          telefone: user.telefone,
        ),
      );
    }else{
      // adicionar
      final cpf = Random().nextDouble().toString();
      _items.putIfAbsent(
        cpf,
        () => User(
          cpf: cpf,
          nome: user.nome,
          email: user.email,
          avatarUrl:  user.avatarUrl,
          endereco: user.endereco,
          telefone: user.telefone,

        ),
      );
    }
    // ou alterar

    notifyListeners();
  }

  void remove(User user){
    if(user != null && user.cpf != null){
      _items.remove(user.cpf);
      notifyListeners();
    }
  }
}