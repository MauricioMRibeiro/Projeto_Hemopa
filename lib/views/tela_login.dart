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
  var _emaildigitado = null, _senhadigitada = null;

  TextEditingController textusuario = TextEditingController(),
      senhadigitada = TextEditingController();

  User user;

  //static const _baseUrl = 'https://hemopa-app-default-rtdb.firebaseio.com/';
  static const _baseUrl = 'https://hemopa-app1-default-rtdb.firebaseio.com/';
  final Map<String, String> _formdata = {};

  User converteUser(var teste , int i ) {
    _formdata['id'] = user.id;
    _formdata['cpf'] = user.cpf;
    _formdata['nome'] = user.nome;
    _formdata['email'] = user.email;
    _formdata['avatarUrl'] = user.avatarUrl;
    _formdata['endereco'] = user.endereco;
    _formdata['telefone'] = user.telefone;
    _formdata['senha'] = user.senha;
   // var senha  =  teste.values.elementAt(i)['senha'];

  }

  void Salvar() {
    setState(() {
      _emaildigitado = textusuario.text;
      _senhadigitada = senhadigitada.text;
    });
  }

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
                final response = await http.get("$_baseUrl/user.json");
                //var teste =  User.fromJson(json.decode(response.body)['user']);
                Map teste = json.decode(response.body);

                // Percorre lista de usuarios cadastrados
                for (int i = 0; i < teste.length; i++) {
                  //print(teste.values.elementAt(i)['cpf'] + " email digitado : " + _emaildigitado);
                  if ((teste.values.elementAt(i)['cpf'] == _emaildigitado) &&
                      (teste.values.elementAt(i)['senha'] == _senhadigitada)) {
                    print("Ususario: " + teste.values.elementAt(i)['cpf']);
                    print("Senha:" + teste.values.elementAt(i)['senha']);
                    print("Login efetuado com sucesso !");
                    //converteUser(i, teste.values.elementAt(i));
                    print("Doador:" + teste.values.elementAt(i).toString());
                    user = User.fromJson(teste.values.elementAt(i));

                    i = teste.length;

                    print("Senha:" + user.cpf);
                    print("Nome:" + user.nome);
                    print("cpf:" + user.cpf);
                    print("avatarUrl:" + user.avatarUrl);
                    print("id:" + user.id);
                    print("endereco:" + user.endereco);
                    print("telefone:" + user.telefone);
                    print("email:" + user.email);
                    print("senha:" + user.senha);

                    Navigator.of(context).pushNamed(
                        AppRoutes.DADOS_USARIO,
                    );
                  }
                };
                Navigator.of(context).pushNamed(
                  AppRoutes.HOME,
                );

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
