import 'dart:convert';
import 'dart:convert';
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
  void _loadformdata(User user) {
    _formdata['id'] = user.id;
    _formdata['cpf'] = user.cpf;
    _formdata['nome'] = user.nome;
    _formdata['email'] = user.email;
    _formdata['avatarUrl'] = user.avatarUrl;
    _formdata['endereco'] = user.endereco;
    _formdata['telefone'] = user.telefone;
  }

  void Salvar() {
    setState(() {
      _emaildigitado = textusuario.text;
      _senhadigitada = senhadigitada.text;
    });
  }
  fromJson(Map<String, dynamic> json) {
      _email: json['email'];
      _senha: json['id'];
      title: json['title'];
      body: json['body'];

  }
  var _senha = 'text2',
      _email = 'text',
      _emaildigitado = null,
      _senhadigitada = null;
  TextEditingController textusuario = TextEditingController(),
      senhadigitada = TextEditingController();
  User user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(
        top: 60,
        left: 40,
        right: 40,
      ),
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          SizedBox(
            width: 128,
            height: 128,
            child: Image.asset('imagem/logo.png'),
          ),
          SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 10,
          ),
          TextFormField(
            keyboardType: TextInputType.emailAddress,
            controller: textusuario,
            obscureText: false,
            decoration: InputDecoration(
                labelText: 'Email ou CPF',
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
              color: Colors.green,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            height: 40,
            child: FlatButton(
              child: Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () async {
                Salvar();
                final response = await http.get("$_baseUrl/user/{$_emaildigitado}.json");
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
                ;
              },
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            height: 40,
            child: FlatButton(
              child: Text(
                "Cadastre-se",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
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
