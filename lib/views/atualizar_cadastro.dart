import 'package:flutter/material.dart';
import 'package:hemopa_app/models/user.dart';
import 'package:hemopa_app/provider/users.dart';
import 'package:hemopa_app/routes/app_routes.dart';
import 'package:provider/provider.dart';

// ignore: unused_element
final _form = GlobalKey<FormState>();
final Map<String, String> _formdata = {};

// ignore: unused_element
void _loadformdata(User user) {
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

class AtualizarCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    // final User user = ModalRoute.of(context).settings.arguments;
    //_loadformdata(user);

    // ignore: todo
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Atualizar Cadastro",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
          backgroundColor: Colors.red,
        ),
        body: Container(
          padding: EdgeInsets.only(
            top: 40,
            left: 40,
            right: 40,
          ),
          color: Colors.white,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 1),
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("imagem/logo.png"),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 30,
                alignment: Alignment.bottomCenter,
                child: Text(
                  'Dados Pessoais',
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: "Nome: " + users.all.elementAt(1).nome,
                  counterStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: "Cpf: " + users.all.elementAt(1).cpf,
                  counterStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: "E-mail: " + users.all.elementAt(1).email,
                  counterStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                maxLines: 1, // ISSO FAZ COM QUE SEU TEXTO NÃO PULE PARA LINHA
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: "Telefone: " + users.all.elementAt(1).telefone,
                  counterStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                //initialValue: _formdata['endereco'],
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black)),
                  labelText: "Endereço: " + users.all.elementAt(1).endereco,
                  counterStyle: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 60,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.all(
                    Radius.circular(8),
                  ),
                ),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Atualizar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                    onPressed: () => {
                      Navigator.of(context).pushNamed(
                        AppRoutes.DADOS_USARIO,
                      ),
                    },
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
