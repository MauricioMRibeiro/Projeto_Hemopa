import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:hemopa_app/models/user.dart';
// ignore: unused_import
import 'package:hemopa_app/routes/app_routes.dart';
// ignore: unused_import
import 'package:provider/provider.dart';

class MeusAgendamentos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Meus Agendamentos',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 22,
            ),
          ),
        ),
        body: Container(
          padding: EdgeInsets.only(
            top: 20,
            left: 20,
            right: 20,
          ),
          //color: Colors.redAccent[100],
          child: ListView(
            children: <Widget>[
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.red[800], width: 1),
                ),
                child: ListTile(
                  title: Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        color: Colors.red[600],
                        size: 30,
                      ),
                      Text(
                        'Data: ',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hora: ',
                        style: TextStyle(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Unidade: ',
                        style: TextStyle(
                          fontSize: 18,
                          //fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: Colors.red[800],
                      size: 30,
                    ),
                    onPressed: () {},
                  ),
                ),

                //),
              ),
            ],
          ),
        ));
  }
}
