import 'package:flutter/material.dart';
import 'package:hemopa_app/routes/app_routes.dart';

class TelaHome extends StatefulWidget {
  @override
  _TelaHomeState createState() => _TelaHomeState();
}

class _TelaHomeState extends State<TelaHome> {
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
      body: GridView.count(
        padding: const EdgeInsets.all(20),
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.grey),
              ),
              padding: EdgeInsets.all(25.0),
              child: Column(children: <Widget>[
                Icon(
                  Icons.account_circle,
                  color: Colors.grey,
                  size: 70,
                ),
                Text(
                  "Perfil",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ),
              ]),
              onPressed: () => {},
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.grey),
              ),
              padding: EdgeInsets.all(25.0),
              child: Column(children: <Widget>[
                Icon(
                  Icons.insert_invitation_rounded,
                  color: Colors.grey,
                  size: 70,
                ),
                Text(
                  "Agendamento",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ),
              ]),
              onPressed: () => {
                Navigator.of(context).pushNamed(
                  AppRoutes.AGENDAMENTO_DOACAO,
                )
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.grey),
              ),
              padding: EdgeInsets.all(25.0),
              child: Column(children: <Widget>[
                Icon(
                  Icons.check_circle,
                  color: Colors.grey,
                  size: 70,
                ),
                Text(
                  "Checkin",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ),
              ]),
              onPressed: () => {},
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.grey),
              ),
              padding: EdgeInsets.all(25.0),
              child: Column(children: <Widget>[
                Icon(
                  Icons.history_outlined,
                  color: Colors.grey,
                  size: 70,
                ),
                Text(
                  "Histórico",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ),
              ]),
              onPressed: () => {},
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.grey),
              ),
              padding: EdgeInsets.all(25.0),
              child: Column(children: <Widget>[
                Icon(
                  Icons.description_rounded,
                  color: Colors.grey,
                  size: 70,
                ),
                Text(
                  "Comprovante",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ),
              ]),
              onPressed: () => {},
            ),
          ),
          Container(
            padding: EdgeInsets.all(8),
            child: FlatButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: BorderSide(color: Colors.grey),
              ),
              padding: EdgeInsets.all(25.0),
              child: Column(children: <Widget>[
                Icon(
                  Icons.cancel,
                  color: Colors.grey,
                  size: 70,
                ),
                Text(
                  "Cancelar",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 15,
                  ),
                ),
              ]),
              onPressed: () => {},
            ),
          ),
        ],
      ),
    );
  }
}
