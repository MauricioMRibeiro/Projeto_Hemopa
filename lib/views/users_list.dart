import 'package:flutter/material.dart';
import 'package:hemopa_app/componentes/users_tile.dart';
import 'package:hemopa_app/provider/users.dart';
import 'package:hemopa_app/routes/app_routes.dart';
import 'package:provider/provider.dart';

class UserList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Users users = Provider.of(context);
    // ignore: todo
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Usuarios Cadastrados'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: users.count,
        itemBuilder: (ctx, i) => UserTitle(users.all.elementAt(i)),
      ),
    );
  }
}
