//import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hemopa_app/models/user.dart';
import 'package:hemopa_app/provider/users.dart';
import 'package:provider/provider.dart';
import 'package:brasil_fields/brasil_fields.dart';

class Cadastro extends StatefulWidget {
  @override
  _CadastroState createState() => _CadastroState();
}

class _CadastroState extends State<Cadastro> {
  final _form = GlobalKey<FormState>();

  bool _isLoading = false;

  final Map<String, String> _formdata = {};

  // ignore: unused_element
  void _loadformdata(User user) {
   // _formdata['id'] = user.id;
    _formdata['cpf'] = user.cpf;
    _formdata['nome'] = user.nome;
    _formdata['email'] = user.email;
    _formdata['avatarUrl'] = user.avatarUrl;
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
          title: Text(
            'Cadastro Doador',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.save,
                color: Colors.green.shade100,
                size: 35.0,
              ),
              onPressed: () async {
                final isValid = _form.currentState.validate();

                if (isValid) {
                  _form.currentState.save();

                  setState(() {
                    _isLoading = true;
                  });

                  // ignore: missing_required_param
                  await Provider.of<Users>(context, listen: false).put(User(
                    cpf: _formdata['cpf'],
                    //id: _formdata['id'],
                    nome: _formdata['nome'],
                    email: _formdata['email'],
                    datanasc: _formdata['datanasc'],
                    rg: _formdata['rg'],
                    telefone: _formdata['telefone'],
                    avatarUrl: _formdata['avatarUrl'],
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
        body: SingleChildScrollView(
          child: _isLoading
              ? Center(child: CircularProgressIndicator())
              : Padding(
                  padding: EdgeInsets.all(15),
                  child: Form(
                      key: _form,
                      child: Column(
                        children: <Widget>[
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            decoration: InputDecoration(labelText: 'Nome'),
                            style: TextStyle(fontSize: 20),
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
                          ),TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(labelText: 'Senha'),
                            style: TextStyle(fontSize: 20),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Senha invalido';
                              }

                              if (value.trim().length <= 3) {
                                return 'Senha muito pequeno.';
                              }
                              return null;
                            },
                            onSaved: (value) => _formdata['senha'] = value,
                          ),
                          //inseri novos dados:
                          TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            decoration: InputDecoration(
                                labelText: 'Data de Nascimento'),
                            style: TextStyle(fontSize: 20),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              DataInputFormatter(),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'data invalida';
                              }

                              if (value.trim().length <= 8) {
                                return 'data muito pequena.';
                              }
                              return null;
                            },
                            onSaved: (value) => _formdata['datanasc'] = value,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            decoration: InputDecoration(labelText: 'CPF'),
                            style: TextStyle(fontSize: 20),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CpfInputFormatter(),
                            ],
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'cpf invalido';
                              }
                              if (value.trim().length <= 11) {
                                return 'cpf invalido!';
                              }
                              return null;
                            },
                            onSaved: (value) => _formdata['cpf'] = value,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            decoration: InputDecoration(labelText: 'RG'),
                            style: TextStyle(fontSize: 20),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'RG invalido';
                              }
                              if (value.trim().length >= 20) {
                                return 'RG invalido!';
                              }
                              return null;
                            },
                            onSaved: (value) => _formdata['rg'] = value,
                          ),

                          TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            decoration: InputDecoration(labelText: 'E-mail'),
                            style: TextStyle(fontSize: 20),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'e-mail invalido';
                              }

                              if (value.trim().length <= 3) {
                                return 'e-mail muito pequeno.';
                              }
                              return null;
                            },
                            onSaved: (value) => _formdata['email'] = value,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            decoration: InputDecoration(labelText: 'CEP'),
                            style: TextStyle(fontSize: 20),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CepInputFormatter(),
                            ],
                            onSaved: (value) => _formdata['cep'] = value,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            decoration: InputDecoration(labelText: 'Endereço'),
                            style: TextStyle(fontSize: 20),
                            onSaved: (value) => _formdata['endereco'] = value,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            decoration: InputDecoration(labelText: 'Nº'),
                            style: TextStyle(fontSize: 20),
                            onSaved: (value) => _formdata['numero'] = value,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            decoration: InputDecoration(labelText: 'Bairro'),
                            style: TextStyle(fontSize: 20),
                            onSaved: (value) => _formdata['bairro'] = value,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            decoration: InputDecoration(labelText: 'Cidade'),
                            style: TextStyle(fontSize: 20),
                            onSaved: (value) => _formdata['cidade'] = value,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: false,
                            decoration: InputDecoration(labelText: 'Estado'),
                            style: TextStyle(fontSize: 20),
                            onSaved: (value) => _formdata['uf'] = value,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            decoration: InputDecoration(labelText: 'Celular'),
                            style: TextStyle(fontSize: 20),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TelefoneInputFormatter(),
                            ],
                            onSaved: (value) => _formdata['celular'] = value,
                          ),
                          TextFormField(
                            keyboardType: TextInputType.number,
                            obscureText: false,
                            decoration: InputDecoration(labelText: 'Telefone'),
                            style: TextStyle(fontSize: 20),
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              TelefoneInputFormatter(),
                            ],
                            onSaved: (value) => _formdata['telefone'] = value,
                          ),
                        ],
                      )),
                ),
        ));
  }
}
