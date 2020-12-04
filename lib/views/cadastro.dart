import 'package:flutter/material.dart';
import 'package:hemopa_app/models/user.dart';
import 'package:hemopa_app/provider/users.dart';
import 'package:provider/provider.dart';

class Cadastro extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formdata = {};

  void _loadformdata(User user) {
    _formdata['id'] = user.id;
    _formdata['nome'] = user.nome;
    _formdata['email'] = user.email;
    _formdata['avatarUrl'] = user.avatarUrl;
    _formdata['endereco'] = user.endereco;
    _formdata['telefone'] = user.telefone;
  }

  @override
  Widget build(BuildContext context) {
    //final User user = ModalRoute.of(context).settings.arguments;
    //_loadformdata(user);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro Doador'),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.save,
              color: Colors.green.shade100,
            ),
            onPressed: () {
              final isValid = _form.currentState.validate();

              if (isValid) {
                _form.currentState.save();
                Provider.of<Users>(context, listen: false).put(User(
                  nome: _formdata['nome'],
                  email: _formdata['email'],
                  id: _formdata['id'],
                  avatarUrl: _formdata['avatarUrl'],
                  endereco: _formdata['endereco'],
                  telefone: _formdata['telefone'],
                ));
                Navigator.of(context).pop();
              }
              ;
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
                  keyboardType: TextInputType.text,
                  obscureText: false,
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
                  keyboardType: TextInputType.emailAddress,
                  obscureText: false,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nome invalido';
                    }

                    if (value.trim().length <= 3) {
                      return 'Nome muito pequeno.';
                    }
                    return null;
                  },
                  onSaved: (value) => _formdata['email'] = value,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  decoration: InputDecoration(labelText: 'Cpf'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'cpf invalido';
                    }
                    if (value.trim().length <= 12) {
                      return 'cpf invalido!';
                    }
                    return null;
                  },
                  onSaved: (value) => _formdata['id'] = value,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  obscureText: false,
                  decoration: InputDecoration(labelText: 'Telefone'),
                  onSaved: (value) => _formdata['telefone'] = value,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  decoration: InputDecoration(labelText: 'Endereço'),
                  onSaved: (value) => _formdata['endereco'] = value,
                ),
              ],
            )),
      ),
    );
  }
}