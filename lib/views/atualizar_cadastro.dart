import 'package:flutter/material.dart';
import 'package:hemopa_app/models/user.dart';
import 'package:hemopa_app/provider/users.dart';
import 'package:hemopa_app/routes/app_routes.dart';
import 'package:provider/provider.dart';


final _form = GlobalKey<FormState>();
final Map<String, String> _formdata = {};

void _loadformdata(User user){
  _formdata['id'] = user.id;
  _formdata['nome'] = user.nome;
  _formdata['email'] = user.email ;
  _formdata['avatarUrl'] = user.avatarUrl;
  _formdata['endereco']= user.endereco;
  _formdata['telefone']= user.telefone;
}

class AtualizarCadastro extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
   // final User user = ModalRoute.of(context).settings.arguments;
    //_loadformdata(user);

    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Atualizar Cadastro",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color:  Colors.black,
              fontSize: 20,
            ),
          ),

          backgroundColor: Colors.blue,
        ),
        body: Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 40,
            right: 40,
          ),

          color: Colors.white,

          child: ListView(
            padding: EdgeInsets.symmetric(horizontal:1),
            children: <Widget>[
              SizedBox(
                width: 128,
                height: 128,
                child: Image.asset("imagem/logo.png"),
              ),
              SizedBox(
                height: 10,
              ),

              Container(
                height: 30,
                alignment: Alignment.bottomCenter,
                child:Text(
                  'Dados',
                  style: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextFormField(
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  labelText: "Nome: " + users.all.elementAt(1).nome,
                  counterStyle: TextStyle(fontSize: 15,
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
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  labelText: "Identidade: " + users.all.elementAt(1).id,
                  counterStyle: TextStyle(fontSize: 15,
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
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  labelText: "Email: " + users.all.elementAt(1).email,
                  counterStyle: TextStyle(fontSize: 15,
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
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  labelText: "Telefone: " + users.all.elementAt(1).telefone,
                  counterStyle: TextStyle(fontSize: 15,
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
                  border: OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
                  //labelText: "Endereço: " + users.all.elementAt(1).endereco,
                  counterStyle: TextStyle(fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 5,
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
                child:  SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Atualizar",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color:  Colors.black,
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
        )
    );
  }
}