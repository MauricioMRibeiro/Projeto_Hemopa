import 'package:flutter/material.dart';
import 'package:hemopa_app/models/user.dart';
import 'package:hemopa_app/routes/app_routes.dart';
import 'package:provider/provider.dart';

class DadosUsuario extends StatefulWidget {

  @override
  _DadosUsuarioState createState() => _DadosUsuarioState();
}

class _DadosUsuarioState extends State<DadosUsuario> {
  @override
  Widget build(BuildContextcontext) {
    // ignore: unused_local_variable
    final User user = Provider.of(context);

    // ignore: todo
    // TODO: implement build
    return Scaffold(
        body: Container(
      padding: EdgeInsets.only(
        top: 20,
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
            height: 20,
          ),

          Container(
            height: 30,
            alignment: Alignment.bottomCenter,
            child: Text(
              'Dados do Doador',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Nome: " + user.nome,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),

          Text(
            "Email: " + user.email,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          //style:  TextStyle(fontSize: 20),
          SizedBox(
            height: 5,
          ),
          Text(
            "Endereço: " + user.endereco,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Identidade: " + user.rg,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            "Telefone: " + user.telefone,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: 60,
          ),

          Container(
            height: 30,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.green,
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
                      "Agendar doação",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                onPressed: () => {
                  Navigator.of(context).pushNamed(
                    AppRoutes.AGENDAMENTO_DOACAO,
                  ),
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: 30,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: Colors.orange,
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
                      "Atualizar cadastro",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                onPressed: () => {
                  Navigator.of(context).pushNamed(
                    AppRoutes.ATUALIZAR_CADASTRO,
                  ),
                },
              ),
            ),
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(
                Radius.circular(8),
              ),
            ),
            height: 30,
            child: FlatButton(
              child: Text(
                "Cancelar Doação",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  fontSize: 20,
                ),
                textAlign: TextAlign.center,
              ),
              onPressed: () => {
                Navigator.of(context).pushNamed(
                  AppRoutes.AGENDAMENTO_DOACAO,
                ),
              },
            ),
          )
        ],
      ),
    ));
  }
}
