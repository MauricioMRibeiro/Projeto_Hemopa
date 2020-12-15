import 'package:flutter/material.dart';
import 'package:hemopa_app/models/user.dart';
import 'package:hemopa_app/provider/users.dart';
import 'package:provider/provider.dart';

class UserForm extends StatelessWidget {
  final _form = GlobalKey<FormState>();
  final Map<String, String> _formdata = {};

  // ignore: unused_element
  void _loadformdata(User user) {
    _formdata['id'] = user.id;
    _formdata['cpf'] = user.cpf;
    _formdata['nome'] = user.nome;
    _formdata['email'] = user.email;
    _formdata['avatarUrl'] = user.avatarUrl;
    _formdata['endereco'] = user.endereco;
    _formdata['telefone'] = user.telefone;
    _formdata['senha'] = user.senha;
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
                  nome: _formdata['nome'],
                  email: _formdata['email'],
                  id: _formdata['id'],
                  avatarUrl: _formdata['avatarUrl'],
                  endereco: _formdata['endereco'],
                  telefone: _formdata['telefone'],
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
