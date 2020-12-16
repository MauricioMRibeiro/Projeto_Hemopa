import 'package:flutter/material.dart';
import 'package:hemopa_app/models/user.dart';
import 'package:hemopa_app/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formdata = {};

  // ignore: unused_element
  void _loadformdata(User user) {
    _formdata['cpf'] = user.cpf;
    _formdata['nome'] = user.nome;
    _formdata['email'] = user.email;
    //_formdata['avatarUrl'] = user.avatarUrl;
    _formdata['endereco'] = user.endereco;
    _formdata['telefone'] = user.telefone;
    _formdata['senha'] = user.senha;
    //inseri novos dados:
    _formdata['datanasc'] = user.datanasc;
    _formdata['rg'] = user.rg;
    _formdata['cep'] = user.cep;
    _formdata['cidade'] = user.cidade;
    _formdata['uf'] = user.uf;
    _formdata['numero'] = user.numero;
    _formdata['bairro'] = user.bairro;
    _formdata['sexo'] = user.sexo;
    _formdata['celular'] = user.celular;
  }

  @override
  Widget build(BuildContext context) {
    //final User user = ModalRoute.of(context).settings.arguments;
    //_loadformdata(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Informações do Doador'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();
                // ignore: missing_required_param
                Provider.of<Users>(context, listen: false).put(User(
                  cpf: _formdata['cpf'],
                  //id: _formdata['id'],
                  nome: _formdata['nome'],
                  email: _formdata['email'],
                  datanasc: _formdata['datanasc'],
                  rg: _formdata['rg'],
                  telefone: _formdata['telefone'],
                  //avatarUrl: _formdata['avatarUrl'],
                  sexo: _formdata['sexo'],
                  celular: _formdata['celular'],
                  endereco: _formdata['endereco'],
                  numero: _formdata['numero'],
                  bairro: _formdata['bairro'],
                  cep: _formdata['cep'],
                  cidade: _formdata['cidade'],
                  uf: _formdata['uf'],
                  senha: _formdata['senha'],
                ));
                Navigator.of(context).pop();
              }
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
            key: _form,
            child: Column(
              children: <Widget>[
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nome invalido';
                    }

                    if (value.trim().length <= 3) {
                      return 'Nome muito pequeno.';
                    }
                    return null;
                  },
                  onSaved: (value) => _formdata['nome'] = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Email'),
                  onSaved: (value) => _formdata['email'] = value,
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Url do Avatar'),
                  onSaved: (value) => _formdata['avatarUrl'] = value,
                )
              ],
            )),
      ),
    );
  }
}
