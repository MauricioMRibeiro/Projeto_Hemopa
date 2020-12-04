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

class DadosUsuario extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);

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
                child:Text(
                  'Dados do Doador',
                  style: TextStyle(fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.black
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text("Nome: " + users.all.elementAt(1).nome,
                style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Email: " +users.all.elementAt(1).email,
                style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                ),
                ),
                //style:  TextStyle(fontSize: 20),
              SizedBox(
                height: 5,
              ),
              Text("Endereço: " +users.all.elementAt(1).endereco,
                style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Identidade: " +users.all.elementAt(1).id,
                style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text("Telefone: " +users.all.elementAt(1).telefone,
                style: TextStyle(fontSize: 20,
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
                child:  SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("Agendar doação",
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
                        AppRoutes.AGENDAMENTO_DOACAO,
                      ),
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 20
              ),
              Container(
                height: 30,
                alignment: Alignment.bottomCenter,
                decoration: BoxDecoration(
                  color: Colors.orange,
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
                        Text("Atualizar cadastro",
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
                        AppRoutes.ATUALIZAR_CADASTRO,
                      ),
                    },
                  ),
                ),
              ),
              SizedBox(
                  height: 20
              ),
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
                      color:  Colors.black,
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
        )
    );
  }
}