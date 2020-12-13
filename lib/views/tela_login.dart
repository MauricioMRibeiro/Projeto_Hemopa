import 'dart:convert';
// ignore: duplicate_import
import 'dart:convert';
import 'dart:ui';
import 'package:hemopa_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hemopa_app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';

class TelaLogin extends StatefulWidget {
  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  static const _baseUrl = 'https://hemopa-app-default-rtdb.firebaseio.com/';
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
  }

  // ignore: non_constant_identifier_names
  void Salvar() {
    setState(() {
      _emaildigitado = textusuario.text;
      _senhadigitada = senhadigitada.text;
    });
  }

  fromJson(Map<String, dynamic> json) {
    // ignore: unused_label
    // ignore: unnecessary_statements
    // ignore: unused_label
    // ignore: unnecessary_statements
    // ignore: unused_label
    // ignore: unnecessary_statements
    // ignore: unused_label
    // ignore: unnecessary_statements
    _email:
    json['email'];
    // ignore: unused_label
    _senha:
    json['id'];
    // ignore: unused_label
    title:
    json['title'];
    // ignore: unused_label
    body:
    json['body'];
  }

  var _senha = 'text2',
      _email = 'text',
      // ignore: avoid_init_to_null
      _emaildigitado = null,
      // ignore: avoid_init_to_null
      _senhadigitada = null;
  TextEditingController textusuario = TextEditingController(),
      senhadigitada = TextEditingController();
  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(
        top: 120,
        left: 40,
        right: 40,
      ),
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          SizedBox(
            width: 158,
            height: 158,
            child: Image.asset('imagem/logo.png'),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: textusuario,
            obscureText: false,
            decoration: InputDecoration(
                labelText: 'E-mail ou CPF',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                )),
            style: TextStyle(fontSize: 20),
          ),
          TextFormField(
            controller: senhadigitada,
            keyboardType: TextInputType.text,
            obscureText: true,
            decoration: InputDecoration(
                labelText: 'Senha',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                )),
            style: TextStyle(fontSize: 20),
          ),
          Container(
            height: 48,
            alignment: Alignment.centerRight,
            child: FlatButton(
                child: Text(
                  "Recuperar Senha",
                ),
                onPressed: Salvar),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.redAccent,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            height: 60,
            child: FlatButton(
              child: Text(
                "Entrar",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () async {
                Salvar();
                final response =
                    await http.get("$_baseUrl/user/{$_emaildigitado}.json");
                _email = json.decode(response.body);

                print(response);
                print(_senhadigitada);
                print(_senha);
                print(_emaildigitado);
                print(_email);
                if (_email == _emaildigitado && _senha == _senhadigitada) {
                  Navigator.of(context).pushNamed(
                    AppRoutes.DADOS_USARIO,
                  );
                } else {
                  Navigator.of(context).pushNamed(
                    AppRoutes.HOME,
                  );
                }
              },
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            child: Text(
              "Não tem uma conta?",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 18,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            // decoration: BoxDecoration(
            //   color: Colors.red,
            //   borderRadius: BorderRadius.all(
            //     Radius.circular(8),
            //   ),
            //),
            height: 60,
            child: FlatButton(
              child: Text(
                "Cadastre-se",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Colors.redAccent)),
              onPressed: () => {
                Navigator.of(context).pushNamed(
                  AppRoutes.CADASTRO,
                ),
              },
            ),
          )
        ],
      ),
    ));
  }
}
