import 'dart:convert';
import 'package:hemopa_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:hemopa_app/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';

class TelaLogin extends StatefulWidget {
  static const _baseUrl = 'https://hemopa-app-default-rtdb.firebaseio.com/';

  @override
  _TelaLoginState createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  var _senha = 'text2' ,
      _email = 'text',
      _emaildigitado = null,
      _senhadigitada = null;

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
            obscureText: false,
            decoration: InputDecoration(
                labelText: 'Email ou CPF',
                labelStyle: TextStyle(
                  color: Colors.black38,
                  fontWeight: FontWeight.w400,
                  fontSize: 20,
                )),
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
            onSaved: (value) => _emaildigitado = value,
          ),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Nome invalido';
              }
              if (value.trim().length <= 3) {
                return 'Nome muito pequeno.';
              }
              return null;
            },
            onSaved: (value) => _senhadigitada = value,
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
              onPressed: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.USER_LIST,
                );
              },
            ),
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
                await http.get("${TelaLogin._baseUrl}${_emaildigitado}.json",
                    body: json.encode({
                      'email': _email,
                      'senha': _senha,
                    }));
                print(_emaildigitado);
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
