import 'package:flutter/material.dart';
import 'package:hemopa_app/models/user.dart';
import 'package:hemopa_app/routes/app_routes.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

class DadosUsuario extends StatelessWidget {
  final User user;

  const DadosUsuario({Key key, this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'HEMOPA',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        body: SafeArea(
            child: Container(
          child: Column(
            children: <Widget>[
              Container(
                width: 400,
                height: 230,
                color: Colors.redAccent[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Container(
                      width: 110,
                      height: 110,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: Icon(
                        Icons.account_circle,
                        color: Colors.grey,
                        size: 110,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.account_circle_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            Text(
                              " " + user.nome,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.crop_free_sharp,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            Text(
                              " " + user.cpf,
                              style: TextStyle(
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.email_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            Text(
                              " " + user.email,
                              style: TextStyle(
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.phone,
                                color: Colors.white,
                                size: 20,
                              ),
                            ),
                            Text(
                              " " + user.celular,
                              style: TextStyle(
                                fontSize: 15,
                                //fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        RaisedButton.icon(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            side: BorderSide(color: Colors.white, width: 3),
                          ),
                          label: Text(
                            'Atualizar Cadastro',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                          icon: Icon(
                            Icons.update,
                            color: Colors.white,
                          ),
                          color: Colors.redAccent[100],
                          onPressed: () => {
                            Navigator.of(context).pushNamed(
                              AppRoutes.ATUALIZAR_CADASTRO,
                            ),
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      width: 350,
                      height: 70,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.red[600], width: 3),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.insert_invitation_rounded,
                                color: Colors.red[800],
                                size: 40,
                              ),
                            ),
                            Text(
                              'Agendar Doação',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20,
                              ),
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
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 350,
                      height: 70,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.red[600], width: 3),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.favorite,
                                color: Colors.red[800],
                                size: 40,
                              ),
                            ),
                            Text(
                              'Meus Agendamentos',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                        onPressed: () => {
                          Navigator.of(context).pushNamed(
                            AppRoutes.MEUS_AGENDAMENTOS,
                          ),
                        },
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 350,
                      height: 70,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.red[600], width: 3),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.description_rounded,
                                color: Colors.red[800],
                                size: 40,
                              ),
                            ),
                            Text(
                              'Comprovante de Doação',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20,
                              ),
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
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      width: 350,
                      height: 70,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                          side: BorderSide(color: Colors.red[600], width: 3),
                        ),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8),
                              child: Icon(
                                Icons.check_circle,
                                color: Colors.red[800],
                                size: 40,
                              ),
                            ),
                            Text(
                              'Realizar Checkin',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                                fontSize: 20,
                              ),
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
                    SizedBox(
                      height: 15,
                    ),
                  ],
                ),
              ),
            ],
          ),
        )));
  }
}
